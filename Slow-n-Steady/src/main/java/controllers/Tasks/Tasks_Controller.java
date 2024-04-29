/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.Tasks;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Project;
import model.Task;
import model.UserProject;
import model.persist.TaskDao;
import model.persist.UserProjectDao;

/**
 *
 * @author Mati
 */
@WebServlet(name = "UserStories", urlPatterns = {"/UserStories"})
public class Tasks_Controller extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("userId");

        TaskDao taskDao = new TaskDao();
        UserProjectDao userProjectDao = new UserProjectDao();

        try {
            List<Project> projects = userProjectDao.selectProjectsByUserId(id);
            List<Task> tasks = taskDao.selectProjectTasks(1);

            request.setAttribute("tasks", tasks);
            request.setAttribute("projects", projects);

        } catch (SQLException ex) {
            Logger.getLogger(Tasks_Controller.class.getName()).log(Level.SEVERE, null, ex);
        }

        RequestDispatcher rd = request.getRequestDispatcher("/views/Tasks_View.jsp");
        rd.forward(request, response);
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
        processRequest(request, response);

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
        processRequest(request, response);

        TaskDao taskDao = new TaskDao();
        Task task = new Task();
        String selection = request.getParameter("selection");

        if (selection.equals("delete")) {
            long id = 0;
            try {
                taskDao.deleteTask(id);
            } catch (SQLException ex) {
                Logger.getLogger(Tasks_Controller.class.getName()).log(Level.SEVERE, null, ex);
            }
        }else if(selection.equals("create")) {
            task.setProjectId(Long.parseLong(request.getParameter("projectId")));
            task.setName(request.getParameter("name"));
            task.setDescription(request.getParameter("description"));
            task.setPriority(Integer.parseInt(request.getParameter("priority")));
            try {
                taskDao.createTask(task);
            } catch (SQLException ex) {
                Logger.getLogger(Tasks_Controller.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        RequestDispatcher rd = request.getRequestDispatcher("views/Tasks_View.jsp");
        rd.forward(request, response);

    }
    
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
