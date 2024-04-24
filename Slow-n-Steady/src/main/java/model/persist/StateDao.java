package model.persist;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import model.DbConnect;
import model.State;

public class StateDao {

    private final DbConnect dbConnect;
    private final Map<String, String> queries;

    public StateDao() {
        dbConnect = new DbConnect();
        queries = new HashMap<>();
        initQueries();
    }

    /**
     * Puts into the Queries HashMap all the queries we need for the diferent
     * operations we want to do with State.
     */
    private void initQueries() {
        //List State By Id
        queries.put("selectStateById", "SELECT * FROM state WHERE id = ?;");
        //List State By its Name
        queries.put("selectStateByName", "SELECT * FROM state WHERE name = ?;");
        //Create State
        queries.put("createState", "INSERT INTO state VALUES (null, ?);");
        //Modify State
        queries.put("modifyState", "UPDATE state SET name = ? WHERE id = ?;");
        //Delete State
        queries.put("deleteState", "DELETE FROM state WHERE id = ?;");
    }

    /**
     * Method that obtains a State object with the data obtained from the
     * queries.
     *
     * @param rs resultset obtained from queries
     * @return State object with that data
     * @throws SQLException in case of error
     */
    private State stateFromResultSet(ResultSet rs) throws SQLException {
        State state;
        //We read the state attributes fetched from the queries
        long id = rs.getLong("id");
        String name = rs.getString("name");
        state = new State(id, name);
        return state;
    }
    
    /**
     * Method that looks for certain State from database given its id.
     * @param stateId id of the state we are looking for
     * @return found State or null in case of error.
     * @throws java.sql.SQLException
     */
    public State selectStateById(long stateId) throws SQLException {
        State result = null;
        try (Connection conn = dbConnect.getConnection()) {
            if (conn != null) {
                String query = queries.get("selectStateById");
                PreparedStatement st = conn.prepareStatement(query);
                st.setLong(1, stateId);
                ResultSet rs = st.executeQuery();
                if (rs.next()) {
                    result = stateFromResultSet(rs);
                }
            }
        }
        return result;
    }
    
    /**
     * Method that looks for certain State from database given its name.
     * @param stateName name of the state we are looking for
     * @return found State or null in case of error.
     * @throws java.sql.SQLException
     */
    public State selectStateByName(String stateName) throws SQLException {
        State result = null;
        try (Connection conn = dbConnect.getConnection()) {
            if (conn != null) {
                String query = queries.get("selectStateByName");
                PreparedStatement st = conn.prepareStatement(query);
                st.setString(1, stateName);
                ResultSet rs = st.executeQuery();
                if (rs.next()) {
                    result = stateFromResultSet(rs);
                }
            }
        }
        return result;
    }
    
    /**
     * Method that creates a new State into database, given a State object with 
     * all its data.
     * @param state object containing the new data
     * @return number of lines modified: 1 if successfull, 0 in case any error 
     * takes place.
     * @throws java.sql.SQLException
     */
    public int createState(State state) throws SQLException{
        int result = 0;
        try(Connection conn = dbConnect.getConnection()) {
            if (conn != null) {
                String query = queries.get("createState");
                PreparedStatement st = conn.prepareStatement(query);
                st.setString(1, state.getName());
                result = st.executeUpdate();
            }
        }
        return result;
    }
}
