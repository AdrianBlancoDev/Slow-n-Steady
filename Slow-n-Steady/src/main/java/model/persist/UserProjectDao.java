package model.persist;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import model.DbConnect;
import model.UserProject;

public class UserProjectDao {

    private final DbConnect dbConnect;
    private final Map<String, String> queries;

    public UserProjectDao() {
        dbConnect = new DbConnect();
        queries = new HashMap<>();
        initQueries();
    }

    /**
     * Puts into the Queries HashMap all the queries we need for the different
     * operations we want to do with UserProject table from database.
     */
    private void initQueries() {
        //Set User as admin of a project (ID 1 stands for ADMIN role)
        queries.put("setProjectAdmin", "INSERT INTO user_project VALUES (?, ?, 1);");
        //Ser User as collaborator of a project (ID 2 stands for COLLAB role)
        queries.put("addProjectCollaborator", "INSERT INTO user_project VALUES (?, ?, 2);");
        //Delete Collaborator from a Project
        queries.put("deleteCollaborator", "DELETE FROM user_project WHERE user_id = ? AND project_id = ?;");
        //Change Collaborator Privileges in a Project
        queries.put("changeCollaboratorPrivileges", "UPDATE user_project set privileges_id = ? WHERE user_id = ? AND project_id = ?;");
    }

    /**
     * Method that obtains a UserProject objects with the data obtained from the
     * queries.
     *
     * @param rs resultset obtained from queries
     * @return UserProject object with that data
     * @throws SQLException in case of error
     */
    private UserProject userProjectFromResultSet(ResultSet rs) throws SQLException {
        UserProject userProject;
        //We read the userProject attrtibutes fetched from the queries
        long projectId = rs.getLong("project_id");
        long userId = rs.getLong("user_id");
        long privilegesId = rs.getLong("privilege_id");
        userProject = new UserProject(userId, projectId, privilegesId);
        return userProject;
    }

    /**
     * Inserts a row into table, setting the Admin User to a Project, with its
     * privileges.
     *
     * @param projectId id of the project we want to set the admin
     * @param userId id of the user we want to set as an admin of the project
     * @return number of lines modified: 1 if successfull, 0 in case of error.
     */
    public int setProjectAdmin(long projectId, long userId) {
        int result = 0;
        try (Connection conn = dbConnect.getConnection()) {
            if (conn != null) {
                String query = queries.get("setProjectAdmin");
                PreparedStatement st = conn.prepareStatement(query);
                st.setLong(1, projectId);
                st.setLong(2, userId);
                result = st.executeUpdate();
            }
        } catch (SQLException ex) {
            result = 0;
        }
        return result;
    }

    /**
     * Inserts a row into table, adding a Collaborator to a Project, with its
     * privileges
     *
     * @param projectId id of the project we want to add an admin to.
     * @param userId id of the user we want to add as a collab to the project
     * @return number of lines modified: 1 if successfull, 0 in case of error.
     */
    public int addProjectCollaborator(long projectId, long userId) {
        int result = 0;
        try (Connection conn = dbConnect.getConnection()) {
            if (conn != null) {
                String query = queries.get("addProjectCollaborator");
                PreparedStatement st = conn.prepareStatement(query);
                st.setLong(1, projectId);
                st.setLong(2, userId);
                result = st.executeUpdate();
            }
        } catch (SQLException ex) {
            result = 0;
        }
        return result;
    }

    /**
     * Deletes a row from table, deleting the collaborator from the project.
     *
     * @param userId id of user we want to delete from project
     * @param projectId id of the project we want to delete the user from
     * @return number of lines modified: 1 is successfull, 0 in case of error.
     */
    public int deleteCollaborator(long userId, long projectId) {
        int result = 0;
        try (Connection conn = dbConnect.getConnection()) {
            if (conn != null) {
                String query = queries.get("deleteCollaborator");
                PreparedStatement st = conn.prepareStatement(query);
                st.setLong(1, userId);
                st.setLong(2, projectId);
                result = st.executeUpdate();
            }
        } catch (SQLException ex) {
            result = 0;
        }
        return result;
    }

    /**
     * Modifies a row from table, changing the user privileges to the project
     * asigned.
     *
     * @param privilegesId id of the privileges we're about to give to the user
     * @param userId user we want to change the privileges to
     * @param projectId user's project
     * @return number of lines modified: 1 is successfull, 0 in case of error.
     */
    public int changeCollaboratorPrivileges(long privilegesId, long userId, long projectId) {
        int result = 0;
        try (Connection conn = dbConnect.getConnection()) {
            if (conn != null) {
                String query = queries.get("changeCollaboratorPrivileges");
                PreparedStatement st = conn.prepareStatement(query);
                st.setLong(1, privilegesId);
                st.setLong(2, userId);
                st.setLong(3, projectId);
                result = st.executeUpdate();
            }
        } catch (SQLException ex) {
            result = 0;
        }
        return result;
    }
}
