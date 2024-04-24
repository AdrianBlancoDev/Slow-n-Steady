/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.persist;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.DbConnect;
import model.Privileges;

/**
 *
 * @author anxnimus
 */
public class PrivilegesDao {

    private final DbConnect dbConnect;
    private final Map<String, String> queries;

    public PrivilegesDao() {
        dbConnect = new DbConnect();
        queries = new HashMap<>();
        initQueries();
    }

    /**
     * Puts into the Queries HashMap all the queries we need for the diferent
     * operations we want to do with Privileges.
     */
    private void initQueries() {
        //Select All Privileges
        queries.put("selectAllPrivileges", "SELECT * FROM privilege;");
        //Select Privilege By Id
        queries.put("selectPrivilegeById", "SELECT * FROM privilege WHERE id = ?;");
        //Select Privilege By Role
        queries.put("selectPrivilegeByRole", "SELECT * FROM privilege WHERE role = ?;");
    }

    /**
     * Method that obtains a Privileges object with the data obtained from the
     * queries.
     *
     * @param rs result set obtained from a query
     * @return Priviliges object with rs data
     * @throws SQLException in case of error
     */
    private Privileges privilegesFromResultSet(ResultSet rs) throws SQLException {
        Privileges privileges;
        //We read the user attributes fetched from the queries
        long id = rs.getLong("id");
        String role = rs.getString("role");
        boolean create = rs.getBoolean("create");
        boolean read = rs.getBoolean("read");
        boolean update = rs.getBoolean("update");
        boolean delete = rs.getBoolean("delete");
        privileges = new Privileges(id, role, create, read, update, delete);
        return privileges;
    }

    /**
     * Lists all existant privileges from the database
     *
     * @return a list with all the privileges or null in case any error takes
     * place
     * @throws java.sql.SQLException
     */
    public List<Privileges> selectAllPrivileges() throws SQLException {
        List<Privileges> result = new ArrayList<>();
        try (Connection conn = dbConnect.getConnection()) {
            if (conn != null) {
                String query = queries.get("selectAllPrivileges");
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery(query);
                while (rs.next()) {
                    Privileges privileges = privilegesFromResultSet(rs);
                    if (privileges != null) {
                        result.add(privileges);
                    }
                }
            }
        }
        return result;
    }
    
    /**
     * Method that looks for certain Privileges from database given its id.
     * @param privilegesId of the Privileged we are looking for.
     * @return found Privileges or null in case any error takes place.
     * @throws java.sql.SQLException
     */
    public Privileges selectPrivilegesById(long privilegesId) throws SQLException {
        Privileges result = null;
        try (Connection conn = dbConnect.getConnection()) {
            if (conn != null) {
                String query = queries.get("selectPrivilegeById");
                PreparedStatement st = conn.prepareStatement(query);
                st.setLong(1, privilegesId);
                ResultSet rs = st.executeQuery();
                if (rs.next()) {
                    result = privilegesFromResultSet(rs);
                }
            }
        }
        return result;
    }
    
    /**
     * Methot that looks for certain Privileges from database given the role.
     * @param role role of the Privileges
     * @return found Privileges or null in case any error takes place.
     * @throws java.sql.SQLException
     */
    public Privileges selectPrivilegesByRole(String role) throws SQLException{
        Privileges result = null;
        try (Connection conn = dbConnect.getConnection()) {
            if (conn != null) {
                String query = queries.get("selectPrivilegeByRole");
                PreparedStatement st = conn.prepareStatement(query);
                st.setString(1, role);
                ResultSet rs = st.executeQuery();
                if (rs.next()) {
                    result = privilegesFromResultSet(rs
                    );
                }
            }
        }
        return result;
    }
}
