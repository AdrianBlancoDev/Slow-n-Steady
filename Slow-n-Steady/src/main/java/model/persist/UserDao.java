/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.persist;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import model.DbConnect;
import model.User;

/**
 *
 * @author anxnimus
 */
public class UserDao {

    private final DbConnect dbConnect;
    private Map<String, String> queries;

    /**
     * Constructor of DAO of User, that instances a DbConnect option, from where
     * we get the connections to the database.
     */
    public UserDao() {
        dbConnect = new DbConnect();
        queries = new HashMap<>();
        initQueries();
    }

    /**
     * Initializes all the queries needed for the User table.
     */
    private void initQueries() {
        //Register User
        queries.put("insert", "INSERT INTO user VALUES (null, ?, ?, ?);");
        //Search User by ID
        queries.put("selectUserById", "SELECT * FROM user WHERE id = ?;");
        //Search User by Literal Username
        queries.put("selectUserByUsername", "SELECT * FROM user WHERE name = ?;");
        //Search User by Username and Password
        queries.put("selectUserByUsernamePassword", "SELECT * FROM user WHERE name = ? AND password = ?;");
        //Search User by Similar Name
        queries.put("selectUserBySimilarName", "SELECT * FROM user WHERE name LIKE CONCAT('%', ?, '%');");
        //Search User by email
        queries.put("selectUserByMail", "SELECT * FROM user WHERE email = ?;");
        //Update User Password by Email
        queries.put("updateUserPasswordByEmail", "UPDATE user SET password = ? WHERE email = ?;");
    }

    /**
     * Method that obtains a User object with the data obtained from the queries
     *
     * @param rs
     * @return User object with that data
     * @throws SQLException in case of error
     */
    private User userFromResultSet(ResultSet rs) throws SQLException {
        User user;
        //We read the user atributes fetched from the queries
        long id = rs.getLong("id");
        String name = rs.getString("name");
        String email = rs.getString("email");
        String password = rs.getString("password");
        //We instantiate a new User object using the previous attributes
        user = new User(id, name, password, email);
        return user;
    }

    /**
     * Method that registers a User into the User table into Database given his
     * username, password and validation email.
     *
     * @param user with the data
     * @return number of rows modified. If succesfull 1, in case any error takes
     * place, 0.
     * @throws java.sql.SQLException
     */
    public int registerUser(User user) throws SQLException {
        int result = 0;
        try (Connection conn = dbConnect.getConnection()) {
            if (conn != null) {
                String query = queries.get("insert");
                PreparedStatement st = conn.prepareStatement(query);
                st.setString(1, user.getUsername());
                st.setString(2, user.getEmail());
                st.setString(3, user.getPassword());
                result = st.executeUpdate();
            }
        }
        return result;
    }

    /**
     * Method that looks for a User into database from a given id.
     *
     * @param userId id of the user we are looking for
     * @return the found user or null in case no found or an error takes place.
     * @throws java.sql.SQLException
     */
    public User searchUserById(long userId) throws SQLException {
        User result = null;
        try (Connection conn = dbConnect.getConnection()) {
            if (conn != null) {
                String query = queries.get("selectUserById");
                PreparedStatement st = conn.prepareStatement(query);
                st.setLong(1, userId);
                ResultSet rs = st.executeQuery();
                if (rs.next()) {
                    result = userFromResultSet(rs);
                }
            }
        }
        return result;
    }

    /**
     * Method that looks for a User into database given its username and a
     * password.
     *
     * @param username of the user
     * @param password of the user
     * @return the found user or null in case no found or an error takes place.
     * @throws java.sql.SQLException
     */
    public User searchUserByUsernameAndPassword(String username, String password) throws SQLException {
        User result = null;
        try (Connection conn = dbConnect.getConnection()) {
            if (conn != null) {
                String query = queries.get("selectUserByUsernamePassword");
                PreparedStatement st = conn.prepareStatement(query);
                st.setString(1, username);
                st.setString(2, password);
                ResultSet rs = st.executeQuery();
                if (rs.next()) {
                    result = userFromResultSet(rs);
                }
            }
        }
        return result;
    }

    /**
     * Looks for a user into database given its literal username.
     *
     * @param username literal user's
     * @return the found user or null in case no found or an error takes place.
     */
    public User searchUserByUsername(String username) throws SQLException {
        User result = null;
        try (Connection conn = dbConnect.getConnection()) {
            if (conn != null) {
                String query = queries.get("selectUserByUsername");
                PreparedStatement st = conn.prepareStatement(query);
                st.setString(1, username);
                ResultSet rs = st.executeQuery();
                if (rs.next()) {
                    result = userFromResultSet(rs);
                }
            }
        }
        return result;
    }

    /**
     * Looks for a user into database given its literal username.
     *
     * @param username literal user's
     * @return the found user or null in case no found or an error takes place.
     * @throws java.sql.SQLException
     */
    public User searchUserBySimilarUsername(String username) throws SQLException {
        User result = null;
        try (Connection conn = dbConnect.getConnection()) {
            if (conn != null) {
                String query = queries.get("selectUserBySimilarName");
                PreparedStatement st = conn.prepareStatement(query);
                st.setString(1, username);
                ResultSet rs = st.executeQuery();
                if (rs.next()) {
                    result = userFromResultSet(rs);
                }
            }
        }
        return result;
    }

    /**
     * Looks for a user into database given its account email.
     *
     * @param email of the user we are looking for
     * @return found User, null if not found or in case an error takes place.
     * @throws java.sql.SQLException
     */
    public User searchUserByEmail(String email) throws SQLException {
        User result = null;
        try (Connection conn = dbConnect.getConnection()) {
            String query = queries.get("selectUserByMail");
            PreparedStatement st = conn.prepareStatement(query);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                result = userFromResultSet(rs);
            }
        }

        return result;
    }

    /**
     * Given an existant User already verified, modifies its old password with
     * the new one given, using as selector the user verification email.
     *
     * @param user whose password is gonna be modified.
     * @param password new password value
     * @return 1 if successfull, 0 in case any error takes place.
     * @throws java.sql.SQLException
     */
    public int modifyUserPassword(User user, String password) throws SQLException {
        int result = 0;
        try (Connection conn = dbConnect.getConnection()) {
            String query = queries.get("updateUserPasswordByEmail");
            PreparedStatement st = conn.prepareStatement(query);
            st.setString(1, password);
            st.setString(2, user.getEmail());
        }
        return result;
    }
}
