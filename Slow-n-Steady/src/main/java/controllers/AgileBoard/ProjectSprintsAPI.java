package controllers.AgileBoard;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Sprint;
import model.persist.SprintDao;

@WebServlet(name = "ProjectSprintsAPI", urlPatterns = {"/getProjectSprints"})
public class ProjectSprintsAPI extends HttpServlet {

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
        long projectId = Long.parseLong(request.getParameter("projectId"));
        System.err.println(projectId);
        List<Sprint> projectSprints = getProjectSprints(projectId);
        for (Sprint projectSprint : projectSprints) {
            System.out.println(projectSprint.toString());
        }
        if (projectSprints.isEmpty()) {
            System.err.println("LA LISTA DE SPRINTS ESTÁ VACÍA!");
        }
        //We parse the sprint list to JSON
        Gson gsonParser = new Gson();
        String sprintsToJson = gsonParser.toJson(projectSprints);
        response.getWriter().write(sprintsToJson);
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

    private List<Sprint> getProjectSprints(long projectId) {
        SprintDao sprintDao = new SprintDao();
        List<Sprint> result = new ArrayList<>();
        try {
            result = sprintDao.selectSprintsByProject(projectId);
        } catch (SQLException ex) {
            System.out.println(ex.getLocalizedMessage());
        }
        return result;
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
