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
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Project;
import model.persist.ProjectDao;
import model.persist.UserProjectDao;

/**
 *
 * @author kalav
 */
@WebServlet(name = "ProjectsAPI", urlPatterns = {"/ProjectsAPI"})
public class ProjectsAPI extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String projectDaoFunction = request.getParameter("projectDAO");
            switch (projectDaoFunction) {
                case "modify":
                    long projectIdM = Long.parseLong(request.getParameter("projectId"));
                    String projectNameM = request.getParameter("projectName");
                    String projectDescriptionM = request.getParameter("projectDescription");
                    String projectStartDateStrM = request.getParameter("projectStartDate");

                    Date projectStartDateM = null;
                    SimpleDateFormat dateFormatM = new SimpleDateFormat("yyyy-MM-dd");
                    try {
                        projectStartDateM = (Date) dateFormatM.parse(projectStartDateStrM);
                    } catch (java.text.ParseException ex) {
                        Logger.getLogger(ProjectsAPI.class.getName()).log(Level.SEVERE, null, ex);
                    }

                    ProjectDao projectDaoM = new ProjectDao();
                    Project newProjectM = new Project(projectNameM, projectDescriptionM, projectStartDateM);
                    projectDaoM.modifyProject(projectIdM, newProjectM);
                    break;
                case "delete":
                    long projectIdD = Long.parseLong(request.getParameter("projectId"));

                    ProjectDao projectDaoD = new ProjectDao();
                    projectDaoD.deleteProject(projectIdD);
                    break;
                case "create":
                    String projectNameC = request.getParameter("projectName");
                    String projectDescriptionC = request.getParameter("projectDescription");
                    String projectStartDateStrC = request.getParameter("projectStartDate");

                    Date projectStartDateC = null;
                    SimpleDateFormat dateFormatC = new SimpleDateFormat("yyyy-MM-dd");
                    try {
                        projectStartDateC = (Date) dateFormatC.parse(projectStartDateStrC);
                    } catch (java.text.ParseException ex) {
                        Logger.getLogger(ProjectsAPI.class.getName()).log(Level.SEVERE, null, ex);
                    }

                    Date projectCreationDateC = new Date();

                    ProjectDao projectDaoC = new ProjectDao();
                    Project newProjectC = new Project(projectNameC, projectDescriptionC, projectStartDateC, projectCreationDateC);
                    projectDaoC.createProject(newProjectC);
                    long idProjectC = projectDaoC.selectProjectIdByName(projectNameC);
                    HttpSession session = request.getSession(false);
                    long idUserC = (long) session.getAttribute("userId");
                    
                    UserProjectDao userProjectDaoC = new UserProjectDao();


                    userProjectDaoC.setProjectAdmin(idProjectC, idUserC);
                    break;
            }

        } catch (SQLException ex) {
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
