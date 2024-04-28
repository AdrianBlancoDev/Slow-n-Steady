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
import java.util.Arrays;
import java.util.Enumeration;
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
        if ("getProjectUntrackedTasks".equals(action)) {
            try {
                long projectId = Long.parseLong(request.getParameter("projectId"));
                TaskDao taskDao = new TaskDao();
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
        } else if (action.equals("loadTasks")) {
            try {
                long sprintId = Long.parseLong(request.getParameter("sprintId"));
                System.out.println("ID del Sprint cuyas tareas vamos a cargar: " + sprintId);
                long stateId = Long.parseLong(request.getParameter("stateId"));
                System.out.println("ID del Estado de las tareas que vamos a cargar: " + stateId);
                //We check the parameter names
                Enumeration<String> parameterNames = request.getParameterNames();
                while (parameterNames.hasMoreElements()) {
                    String paramName = parameterNames.nextElement();
                    String[] paramValues = request.getParameterValues(paramName);
                    System.out.println("Parameter: " + paramName);
                    System.out.println("Values: " + Arrays.toString(paramValues));
                }
                //We instantiate TaskDao in order to fetch the tasks depending on sprint and state ids
                TaskDao taskDao = new TaskDao();
                List<Task> tasks = taskDao.selectSprintTasksByState(sprintId, stateId);
                for (Task task : tasks) {
                    System.out.println(task.toString());
                }
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
        if (action.equals("addTasksToSprint")) {
            long sprintId = Long.parseLong(request.getParameter("sprintId"));
            System.out.println("Sprint seleccionado " + sprintId);
            String[] selectedTasksIds = request.getParameterValues("selectedTasksIds[]");
            //We check the parameter names
            Enumeration<String> parameterNames = request.getParameterNames();
            while (parameterNames.hasMoreElements()) {
                String paramName = parameterNames.nextElement();
                String[] paramValues = request.getParameterValues(paramName);
                System.out.println("Parameter: " + paramName);
                System.out.println("Values: " + Arrays.toString(paramValues));
            }

            for (String selectedTasksId : selectedTasksIds) {
                System.out.println("Task Seleccionada: " + selectedTasksId);
            }
            if (selectedTasksIds == null || selectedTasksIds.length == 0) {
                response.setContentType("text/plain");
                response.getWriter().write("BACKEND SAYS: No tasks selected to add to sprint");
                return;
            }

            TaskDao taskDao = new TaskDao();
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
        } else if (action.equals("modifyTaskState")) {
            try {
                long taskId = Long.parseLong(request.getParameter("taskId"));
                long stateId = Long.parseLong(request.getParameter("stateId"));

                Enumeration<String> parameterNames = request.getParameterNames();
                while (parameterNames.hasMoreElements()) {
                    String paramName = parameterNames.nextElement();
                    String[] paramValues = request.getParameterValues(paramName);
                    System.out.println("Parameter: " + paramName);
                    System.out.println("Values: " + Arrays.toString(paramValues));
                }
                //We instantiate the TaskDao in order to perform the operation
                TaskDao taskDao = new TaskDao();
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
