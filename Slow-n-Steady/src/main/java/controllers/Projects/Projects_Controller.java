/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.Projects;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Project;
import model.UserProject;
import model.persist.ProjectDao;
import model.persist.UserProjectDao;

/**
 *
 * @author Mati
 */
@WebServlet(name = "Projects", urlPatterns = {"/Projects"})
public class Projects_Controller extends HttpServlet {

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
        try {
            response.setContentType("text/html;charset=UTF-8");
            RequestDispatcher rd = request.getRequestDispatcher("/views/Projects_View.jsp");
            
            HttpSession session=request.getSession(false);
            long  id = (long)session.getAttribute("userId");
            
            UserProjectDao userProjectDao = new UserProjectDao();
            List<Project> adminProjectList = userProjectDao.selectProjectsWhereUserAdmin(id);
            request.setAttribute("projectAdmin", adminProjectList);
            
            List<Project> collaboratorProjectList = userProjectDao.selectProjectsWhereUserCollaborator(id);
            request.setAttribute("projectCollaborator", collaboratorProjectList);
            
            List<String> userNamesList = userProjectDao.selectUserNameByProjectId(id);
            String userNameStr = getUserNamesAsString(userNamesList);
            request.setAttribute("usernameList", userNameStr);
            
            rd.forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Projects_Controller.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public String getUserNamesAsString(List<String> userNames) {
        StringBuilder result = new StringBuilder();
        for (int i = 0; i < userNames.size(); i++) {
            result.append(userNames.get(i));
            if (i < userNames.size() - 1) {
                result.append(", ");
            }
        }
        return result.toString();
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
