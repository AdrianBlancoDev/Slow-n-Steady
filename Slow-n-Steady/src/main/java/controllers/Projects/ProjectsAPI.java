/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.Projects;

import com.google.protobuf.TextFormat.ParseException;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Project;
import model.persist.ProjectDao;

/**
 *
 * @author kalav
 */
@WebServlet(name = "ProjectsAPI", urlPatterns = {"/ProjectsAPI"})
public class ProjectsAPI extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            long projectId = Long.parseLong(request.getParameter("projectId"));
            String projectName = request.getParameter("projectName");
            String projectDescription = request.getParameter("projectDescription");
            String projectStartDateStr = request.getParameter("projectStartDate");
            
            Date projectStartDate = null;
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            try {
                projectStartDate = (Date) dateFormat.parse(projectStartDateStr);
            }catch (java.text.ParseException ex) {
                Logger.getLogger(ProjectsAPI.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            ProjectDao projectDao = new ProjectDao();
            Project newProject = new Project(projectName, projectDescription, projectStartDate);
            projectDao.modifyProject(projectId, newProject);
            
            System.out.println("ID del proyecto: " + projectId);
            System.out.println("Nombre del proyecto: " + projectName);
            System.out.println("Descripción del proyecto: " + projectDescription);
            System.out.println("Fecha de inicio del proyecto: " + projectStartDate);
        }catch (SQLException ex) {
            Logger.getLogger(ProjectsAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}