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

        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("userId");

        TaskDao taskDao = new TaskDao();
        UserProjectDao userProjectDao = new UserProjectDao();
        String projectIdNull = request.getParameter("projectId");

        List<Project> projects;
        List<Task> tasks = new ArrayList<>();

        try {
            projects = userProjectDao.selectProjectsByUserId(id);
            if (projectIdNull == null) {
                try {
                    tasks = taskDao.selectProjectTasks(0);
                } catch (SQLException ex) {
                    Logger.getLogger(Tasks_Controller.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                long projectId = Long.parseLong(request.getParameter("projectId"));
                try {
                    tasks = taskDao.selectProjectTasks(projectId);
                } catch (SQLException ex) {
                    Logger.getLogger(Tasks_Controller.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            request.setAttribute("projects", projects);
            request.setAttribute("tasks", tasks);

        } catch (SQLException ex) {
            Logger.getLogger(Tasks_Controller.class.getName()).log(Level.SEVERE, null, ex);
        }

        RequestDispatcher rd = request.getRequestDispatcher("/views/Tasks_View.jsp");
        rd.forward(request, response);
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
