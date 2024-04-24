/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.persist;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.DbConnect;
import model.Sprint;

/**
 *
 * @author anxnimus
 */
public class SprintDao {

    private final DbConnect dbConnect;
    private final Map<String, String> queries;

    public SprintDao() {
        dbConnect = new DbConnect();
        queries = new HashMap<>();
        initQueries();
    }

    /**
     * Initializes the HashMap with all the queries needed to do in this table
     * of the database.
     */
    private void initQueries() {
        //Listar los Sprints de un Proyecto
        queries.put("selectSprintsByProject", "SELECT * FROM sprint WHERE project_id = ?;");
        //Crear un Sprint para un Proyecto
        queries.put("createSprint", "INSERT INTO sprint VALUES (null, ?, ?, ?, ?, ?);");
        //Eliminar un Sprint
        queries.put("deleteSprintByProjectId", "DELETE FROM sprint WHERE id = ?;");
        //Modificar un Sprint
        queries.put("modifySprint", "UPDATE sprint SET name = ?, description = ?, start_date = ?, end_date = ?, project_id = ?;");
    }

    /**
     * Method that obtains a Sprint object with the data obtained from the
     * database
     *
     * @param rs
     * @return Sprint with all that data
     * @throws SQLException in case of error
     */
    private Sprint sprintFromResultSet(ResultSet rs) throws SQLException {
        Sprint sprint;
        //We read the attributes from the queries
        long id = rs.getLong("id");
        String name = rs.getString("name");
        String description = rs.getString("description");
        Date startDate = rs.getDate("start_date");
        Date endDate = rs.getDate("end_date");
        long projectId = rs.getLong("project_id");
        //We instantiate a new Sprint object usign the previous attributes
        sprint = new Sprint(id, name, description, startDate, endDate, projectId);
        return sprint;
    }

    /**
     * Fetches all Sprints of a Project, given the project ID:
     *
     * @param projectId of the project whose sprint we want to fetch
     * @return a list of Sprints found or null in case any error takes place.
     * @throws java.sql.SQLException
     */
    public List<Sprint> selectSprintsByProject(long projectId) throws SQLException {
        List<Sprint> result = new ArrayList<>();
        try (Connection conn = dbConnect.getConnection()) {
            if (conn != null) {
                String query = queries.get("selectSprintsByProject");
                PreparedStatement st = conn.prepareStatement(query);
                st.setLong(1, projectId);
                ResultSet rs = st.executeQuery(query);
                while (rs.next()) {
                    Sprint sprint = sprintFromResultSet(rs);
                    if (sprint != null) {
                        result.add(sprint);
                    }
                }
            }
        }
        return result;
    }

    /**
     * Creates a new Sprint, given a Sprint Object with all its data
     *
     * @param sprint with the data we want to insert
     * @return 1 if successfull, 0 in case any error takes place.
     * @throws java.sql.SQLException
     */
    public int createSprint(Sprint sprint) throws SQLException {
        int result = 0;
        try (Connection conn = dbConnect.getConnection()) {
            if (conn != null) {
                String query = queries.get("createSprint");
                PreparedStatement st = conn.prepareStatement(query);
                st.setString(1, sprint.getName());
                st.setString(2, sprint.getDescription());
                st.setDate(3, (java.sql.Date) sprint.getStartDate());
                st.setDate(4, (java.sql.Date) sprint.getEndDate());
                st.setLong(5, sprint.getProjectId());
                result = st.executeUpdate();
            }
        }
        return result;
    }
    
    /**
     * Modifies a sprint given its id and a new Sprint object with the updated
     * data.
     * @param sprintId id of the sprint to modify
     * @param updatedSprint Sprint object with the new data
     * @return 1 if successfull, 0 in case any error takes place.
     * @throws java.sql.SQLException
     */
    public int modifySprint(long sprintId, Sprint updatedSprint) throws SQLException {
        int result = 0;
        try(Connection conn = dbConnect.getConnection()) {
            String query = queries.get("modifySprint");
            PreparedStatement st = conn.prepareStatement(query);
            st.setString(1, updatedSprint.getName());
            st.setString(2, updatedSprint.getDescription());
            st.setDate(3, (java.sql.Date) updatedSprint.getStartDate());
            st.setDate(4, (java.sql.Date) updatedSprint.getEndDate());
            st.setLong(5, sprintId);
            result = st.executeUpdate();
        }
        return result;
    }
}
