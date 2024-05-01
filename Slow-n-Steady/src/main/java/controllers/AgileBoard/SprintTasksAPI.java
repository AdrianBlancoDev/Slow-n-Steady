/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.AgileBoard;

import com.google.gson.Gson;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Task;
import model.persist.TaskDao;

/**
 *
 * @author anxnimus
 */
@WebServlet(name = "SprintTasksAPI", urlPatterns = {"/sprintTasks"})
public class SprintTasksAPI extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //We set the response type of the servlet
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        TaskDao taskDao = new TaskDao();
        switch (action) {
            case "getProjectUntrackedTasks":
                try {
                    long projectId = Long.parseLong(request.getParameter("projectId"));
                    List<Task> untrackedTasks = taskDao.selectProjectTasksNoSprintNoState(projectId);
                    //We parse the obtained list to JSON
                    Gson gson = new Gson();
                    String untrackedTasksJson = gson.toJson(untrackedTasks);
                    //Set the response type and send it back
                    response.setContentType("application/json");
                    //Write the JSON response in the response bodu
                    response.getWriter().write(untrackedTasksJson);
                } catch (SQLException ex) {
                    response.setContentType("text/plain");
                    response.getWriter().write("Error occurred while loading untracked tasks");
                }
                break;
            case "loadTasks":
                try {
                    long sprintId = Long.parseLong(request.getParameter("sprintId"));
                    long stateId = Long.parseLong(request.getParameter("stateId"));
                    List<Task> tasks = taskDao.selectSprintTasksByState(sprintId, stateId);
                    //We parse the task into JSON
                    Gson gson = new Gson();
                    String tasksJson = gson.toJson(tasks);
                    //Set response type and send it back
                    response.setContentType("application/json");
                    response.getWriter().write(tasksJson);
                } catch (SQLException ex) {
                    response.setContentType("text/plain");
                    response.getWriter().write("Error occurred while loading sprint tasks by state: " + ex.getMessage());
                }
                break;
            case "getTaskDetails":
                long taskId = Long.parseLong(request.getParameter("taskId"));
                 {
                    try {
                        Task task = taskDao.selectTaskById(taskId);
                        System.out.println("TAREA A MOSTRAR INFORMACIÓN: " + task.toString());
                        if (task != null) {
                            //We parse the data to JSON in order to send it as a response
                            Gson gson = new Gson();
                            String taskJson = gson.toJson(task);
                            //Now we set the response type and send it back to the front
                            response.setContentType("application/json");
                            response.getWriter().write(taskJson);
                        }
                    } catch (SQLException ex) {
                        response.setContentType("text/plain");
                        response.getWriter().write("Error occurred while retrieving Task Info: " + ex.getMessage());
                    }
                }
                break;

            default:
                break;
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        TaskDao taskDao = new TaskDao();
        switch (action) {
            case "addTasksToSprint":
                long sprintId = Long.parseLong(request.getParameter("sprintId"));
                System.out.println("Sprint seleccionado " + sprintId);
                String[] selectedTasksIds = request.getParameterValues("selectedTasksIds[]");
                for (String selectedTasksId : selectedTasksIds) {
                    System.out.println("Task Seleccionada: " + selectedTasksId);
                }
                if (selectedTasksIds == null || selectedTasksIds.length == 0) {
                    response.setContentType("text/plain");
                    response.getWriter().write("BACKEND SAYS: No tasks selected to add to sprint");
                    return;
                }
                List<Long> taskIds = convertStringArrayToIdsList(selectedTasksIds);
                for (Long taskId : taskIds) {
                    System.out.println("ID de Tarea a modificar: " + taskId);
                    if (taskId != null) {
                        try {
                            Task foundTask = taskDao.selectTaskById(taskId);
                            if (foundTask != null) {
                                int result = taskDao.setTaskSprint(sprintId, taskId);
                            }
                        } catch (SQLException ex) {
                            response.setContentType("text/plain");
                            response.getWriter().write("Error occurred while adding tasks to sprint: " + ex.getMessage());
                            return;
                        }
                    }
                }
                response.setContentType("text/plain");
                response.getWriter().write("Tasks added successfully to sprint");
                break;
            case "modifyTaskState":
                try {
                    long taskId = Long.parseLong(request.getParameter("taskId"));
                    long stateId = Long.parseLong(request.getParameter("stateId"));
                    //We instantiate the TaskDao in order to perform the operation

                    int result = taskDao.modifyTaskState(taskId, stateId);
                    if (result == 1) {
                        //We set the response type and send it back
                        response.setContentType("text/plain");
                        response.getWriter().write("Task State updated successfully!");
                    } else {
                        response.setContentType("text/plain");
                        response.getWriter().write("Task State not updated!");
                    }
                } catch (SQLException ex) {
                    response.setContentType("text/plain");
                    response.getWriter().write("Error occurred changing Task state: " + ex.getMessage());
                }
                break;
            case "removeTaskFromSprint":
                long taskId = Long.parseLong(request.getParameter("taskId"));
                 {
                    try {
                        int result = taskDao.removeTaskFromSprint(taskId);
                        if (result == 1) {
                            //We set the response type and send it back
                            response.setContentType("text/plain");
                            response.getWriter().write("Task State updated successfully!");
                        }
                    } catch (SQLException ex) {
                        response.setContentType("text/plain");
                        response.getWriter().write("Error occurred while removing Task from Sprint: " + ex.getMessage());
                    }
                }
                break;

            default:
                break;
        }
    }

    private List<Long> convertStringArrayToIdsList(String[] idsList) {
        List<Long> result = new ArrayList<>();
        for (String id : idsList) {
            Long idLong = Long.valueOf(id);
            result.add(idLong);
        }
        return result;
    }

    ;

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
