package model.persist;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.DbConnect;
import model.Project;
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
        //Show Role of the User to a Project
        queries.put("selectUserRoleInProjects", "SELECT * FROM user_project WHERE user_id = ? AND project_id = ?;");
        //Select UserProjects Where User Admin
        queries.put("selectUserProjectsWhereUserAdmin", "SELECT * FROM user_project WHERE user_id = ? AND privilege_id = 1;");
        //Select Projects Where User Admin
        queries.put("selectProjectsWhereUserAdmin", "SELECT project.* FROM project INNER JOIN user_project ON project.id = user_project.project_id WHERE user_project.user_id = ? AND user_project.privilege_id = 1;");
        //Select UserProjects Where User Collaborator
        queries.put("selectUserProjectsWhereUserCollab", "SELECT * FROM user_project WHERE user_id = ? AND privilege_id = 2;");
        //Select Projects where User Collaborator
        queries.put("selectProjectsWhereUserCollaborator", "SELECT project.* FROM project INNER JOIN user_project ON project.id = user_project.project_id WHERE user_project.user_id = ? AND user_project.privilege_id = 2");
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
     * Method that
     *
     * @param userId
     * @param projectId
     * @return
     * @throws java.sql.SQLException in case of error
     */
    public UserProject selectUserRoleInProjects(long userId, long projectId) throws SQLException {
        UserProject result = null;
        try (Connection conn = dbConnect.getConnection()) {
            String query = queries.get("selectUserRoleInProjects");
            PreparedStatement st = conn.prepareStatement(query);
            st.setLong(1, userId);
            st.setLong(2, projectId);
            ResultSet rs = st.executeQuery(query);
            if (rs.next()) {
                result = userProjectFromResultSet(rs);
            }
        }
        return result;
    }
    
    /**
     * List all the participations in projects where the User is admin.
     * @param userId id of the user
     * @return List of participations or null in case any error takes place
     * @throws java.sql.SQLException in case of error
     */
<<<<<<< HEAD
    public List<UserProject> selectProjectsWhereUserAdmin(long userId) {
        List<UserProject> result = null;
=======
    public List<UserProject> selectUserProjectsWhereUserAdmin(long userId) throws SQLException {
        List<UserProject> result = new ArrayList<>();
>>>>>>> main
        try (Connection conn = dbConnect.getConnection()) {
            if (conn != null) {
                String query = queries.get("selectUserProjectsWhereUserAdmin");
                PreparedStatement st = conn.prepareStatement(query);
                st.setLong(1, userId);
                ResultSet rs = st.executeQuery(query);
                while (rs.next()) {
                    UserProject userProj = userProjectFromResultSet(rs);
                    if (userProj != null) {
                        result.add(userProj);
                    }
                }
            }
        }
        return result;
    }
    
    public List<Project> selectProjectsWhereUserAdmin(long userId) throws SQLException{
        List<Project> result = new ArrayList<>();
        try(Connection conn = dbConnect.getConnection()) {
            if (conn != null) {
                String query = queries.get("selectProjectsWhereUserAdmin");
                PreparedStatement st = conn.prepareStatement(query);
                st.setLong(1, userId);
                ResultSet rs = st.executeQuery(query);
                while (rs.next()) {
                    ProjectDao projectDao = new ProjectDao();
                    Project proj = projectDao.projectFromResultSet(rs);
                    if (proj != null) {
                        result.add(proj);
                    }
                }
            }
        }
        return result;
    }
    
    /**
     * List all the participations in projects where the User is collaborator.
     * @param userId id of the user
     * @return List of participations or null in case any error takes place
     * @throws java.sql.SQLException in case of error
     */
    public List<UserProject> selectUserProjectsWhereUserCollaborator(long userId) throws SQLException {
        List<UserProject> result = new ArrayList<>();
        try (Connection conn = dbConnect.getConnection()) {
            if (conn != null) {
                String query = queries.get("selectUserProjectsWhereUserCollab");
                PreparedStatement st = conn.prepareStatement(query);
                st.setLong(1, userId);
                ResultSet rs = st.executeQuery(query);
                while (rs.next()) {
                    UserProject userProj = userProjectFromResultSet(rs);
                    if (userProj != null) {
                        result.add(userProj);
                    }
                }
            }
        }
        return result;
    }
    /**
     * List all the projects where the User is collaborator
     * @param userId id of the user
     * @return List of participations
     * @throws SQLException in case of error
     */
    public List<Project> selectProjectsWhereUserCollaborator(long userId) throws SQLException{
        List<Project> result = new ArrayList<>();
        try(Connection conn = dbConnect.getConnection()) {
            if (conn != null) {
                String query = queries.get("selectProjectsWhereUserCollaborator");
                PreparedStatement st = conn.prepareStatement(query);
                st.setLong(1, userId);
                ResultSet rs = st.executeQuery(query);
                while (rs.next()) {
                    ProjectDao projectDao = new ProjectDao();
                    Project proj = projectDao.projectFromResultSet(rs);
                    if (proj != null) {
                        result.add(proj);
                    }
                }
            }
        }
        return result;
    }

    /**
     * Inserts a row into table, setting the Admin User to a Project, with its
     * privileges.
     *
     * @param projectId id of the project we want to set the admin
     * @param userId id of the user we want to set as an admin of the project
     * @return number of lines modified: 1 if successfull, 0 in case of error.
     * @throws java.sql.SQLException in case of error
     */
    public int setProjectAdmin(long projectId, long userId) throws SQLException {
        int result = 0;
        try (Connection conn = dbConnect.getConnection()) {
            if (conn != null) {
                String query = queries.get("setProjectAdmin");
                PreparedStatement st = conn.prepareStatement(query);
                st.setLong(1, projectId);
                st.setLong(2, userId);
                result = st.executeUpdate();
            }
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
     * @throws java.sql.SQLException in case of error
     */
    public int addProjectCollaborator(long projectId, long userId) throws SQLException {
        int result = 0;
        try (Connection conn = dbConnect.getConnection()) {
            if (conn != null) {
                String query = queries.get("addProjectCollaborator");
                PreparedStatement st = conn.prepareStatement(query);
                st.setLong(1, projectId);
                st.setLong(2, userId);
                result = st.executeUpdate();
            }
        }
        return result;
    }

    /**
     * Deletes a row from table, deleting the collaborator from the project.
     *
     * @param userId id of user we want to delete from project
     * @param projectId id of the project we want to delete the user from
     * @return number of lines modified: 1 is successfull, 0 in case of error.
     * @throws java.sql.SQLException in case of error
     */
    public int deleteCollaborator(long userId, long projectId) throws SQLException {
        int result = 0;
        try (Connection conn = dbConnect.getConnection()) {
            if (conn != null) {
                String query = queries.get("deleteCollaborator");
                PreparedStatement st = conn.prepareStatement(query);
                st.setLong(1, userId);
                st.setLong(2, projectId);
                result = st.executeUpdate();
            }
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
     * @throws java.sql.SQLException in case of error
     */
    public int changeCollaboratorPrivileges(long privilegesId, long userId, long projectId) throws SQLException {
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
        }
        return result;
    }
}
