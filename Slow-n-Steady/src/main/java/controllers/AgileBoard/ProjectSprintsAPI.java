package controllers.AgileBoard;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Sprint;
import model.persist.SprintDao;

@WebServlet(name = "ProjectSprintsAPI", urlPatterns = {"/projectSprints"})
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
        List<Sprint> projectSprints = getProjectSprints(projectId);
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
        Sprint sprint;
        try {
            BufferedReader reader = request.getReader();
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
            String json = sb.toString();
            JsonObject sprintDataJson = JsonParser.parseString(json).getAsJsonObject();

            //We extract the JSON individual values
            String sprintName = sprintDataJson.get("sprint-name").getAsString();
            System.out.println("Nombre del Sprint: " + sprintName);
            String sprintDescription = sprintDataJson.get("sprint-description").getAsString();
            System.out.println("Descripción del Sprint: " + sprintDescription);
            String startDateString = sprintDataJson.get("start-date-picker").getAsString();
            System.out.println("Fecha de inicio del Sprint: " + startDateString);
            String endDateString = sprintDataJson.get("end-date-picker").getAsString();
            System.out.println("Fecha de fin del Sprint: " + endDateString);
            Long projectId = sprintDataJson.get("project-id").getAsLong();
            System.out.println("ID del Proyecto del Sprint: " + projectId);

            // Convierte las fechas de cadena a objetos Date
            SimpleDateFormat dateFormatter = new SimpleDateFormat("MM/dd/yyyy");
            Date sprintStartDate = dateFormatter.parse(startDateString);
            Date sprintEndDate = dateFormatter.parse(endDateString);

            //We verify if the sprint name is empty
            if (sprintName == null || sprintName.trim().isEmpty()) {
                JsonObject errorResponse = new JsonObject();
                errorResponse.addProperty("error", "Sprint name is mandatory");
                response.getWriter().write(errorResponse.toString());
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                return;
            }
            //We instantiate a new sprint
            sprint = new Sprint(0, sprintName, sprintDescription, sprintStartDate, sprintEndDate, projectId);
            SprintDao sprintDao = new SprintDao();
            int result = sprintDao.createSprint(sprint);

            //We prepare the response
            JsonObject jsonResponse = new JsonObject();
            jsonResponse.addProperty("id", sprint.getId());
            jsonResponse.addProperty("name", sprint.getName());
            
            //We send the response
            response.getWriter().write(jsonResponse.toString());
            response.setStatus(HttpServletResponse.SC_OK);
        } catch (SQLException ex) {
            JsonObject errorResponse = new JsonObject();
            errorResponse.addProperty("error", "ERROR SQL Exception");
            response.getWriter().write(errorResponse.toString());
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        } catch (ParseException ex) {
            JsonObject errorResponse = new JsonObject();
            errorResponse.addProperty("error", "ERROR Parsing Dates!");
            response.getWriter().write(errorResponse.toString());
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
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
