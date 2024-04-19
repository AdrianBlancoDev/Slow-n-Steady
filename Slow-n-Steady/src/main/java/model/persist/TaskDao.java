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
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.DbConnect;
import model.Task;

/**
 *
 * @author anxnimus
 */
public class TaskDao {

    private final DbConnect dbConnect;
    private final Map<String, String> queries;

    public TaskDao() {
        dbConnect = new DbConnect();
        queries = new HashMap<>();
        initQueries();
    }

    /**
     * Puts in the hasmap all needed queries for the DAO.
     */
    private void initQueries() {
        //Select all Tasks of a Project
        queries.put("selectTasksByProject", "SELECT * FROM task WHERE project_id = ?;");
        //Select all Tasks of a Sprint of a Project
        queries.put("selectTaskBySprintByProject", "SELECT * FROM task WHERE project_id = ? AND sprint_id = ?;");
        //Select All Project Tasks by State
        queries.put("selectTasksByState", "SELECT * FROM task WHERE project_id = ? AND state_id = ?;");
        //Select All Tasks of a Sprint of a Project by State
        queries.put("selectTasksBySprintByProject", "SELECT * FROM task WHERE project_id = ? AND sprint_id = ? AND state_id = ?;");
        //Create Task
        queries.put("addTask", "INSERT INTO task VALUES (null, ?, ?, ?, ?, ?, ?, ?);");
        //Delete Task by ID
        queries.put("deleteTask", "DELETE FROM task WHERE id = ?;");
        //Modify Task
        queries.put("modifyTask", "UPDATE task SET name = ?, description = ?, timeEstimacy = ?, prioity = ?, projectId = ?, sprintId = ?, stateId = ? WHERE id = ?;");
    }

    /**
     * Method that obtains a User object with the data obtained from the queries
     *
     * @param rs resultset obtained from queries
     * @return Task object with that data
     * @throws SQLException in case of error
     */
    private Task taskFromResultSet(ResultSet rs) throws SQLException {
        Task task;
        //We read the user attributes fetched from the queries
        long id = rs.getLong("id");
        String name = rs.getString("name");
        String description = rs.getString("description");
        String timeEstimacy = rs.getString("time_estimacy");
        int priority = rs.getInt("weight");
        long projectId = rs.getLong("project_id");
        long sprintId = rs.getLong("sprint_id");
        long stateId = rs.getLong("state_id");
        task = new Task(id, name, description, timeEstimacy, priority, projectId, sprintId, stateId);
        return task;
    }

    /**
     * Fetches all tasks of a project, given the project ID.
     *
     * @param projectId whose tasks we are looking for
     * @return a list with the found tasks, or null in case any error takes
     * place.
     */
    public List<Task> selectProjectTasks(long projectId) {
        List<Task> result = new ArrayList<>();
        try (Connection conn = dbConnect.getConnection()) {
            String query = queries.get("selectTasksByProject");
            PreparedStatement st = conn.prepareStatement(query);
            st.setLong(1, projectId);
            ResultSet rs = st.executeQuery(query);
            while (rs.next()) {
                Task task = taskFromResultSet(rs);
                if (task != null) {
                    result.add(task);
                }
            }
        } catch (Exception e) {
            result = null;
        }
        return result;
    }

    /**
     * Fetches all tasks of a sprint of a project, given both sprintId and
     * projectId
     *
     * @param projectId id of the project
     * @param sprintId id of the sprint of the project
     * @return a list with the found tasks, or null in case any error takes
     * place.
     */
    public List<Task> selectSprintProjectTasks(long projectId, long sprintId) {
        List<Task> result = new ArrayList<>();
        try (Connection conn = dbConnect.getConnection()) {
            String query = queries.get("selectTaskBySprintByProject");
            PreparedStatement st = conn.prepareStatement(query);
            st.setLong(1, projectId);
            st.setLong(2, sprintId);
            ResultSet rs = st.executeQuery(query);
            while (rs.next()) {
                Task task = taskFromResultSet(rs);
                if (task != null) {
                    result.add(task);
                }
            }
        } catch (Exception e) {
            result = null;
        }
        return result;
    }

    /**
     * Fetches all tasks of a project given the project and state of the tasks
     *
     * @param projectId id of the project whose tasks we are fetching
     * @param stateId state of the tasks we want to list
     * @return a list of Tasks found, or null in case any error takes place.
     */
    public List<Task> selectProjectTasksByState(long projectId, long stateId) {
        List<Task> result = new ArrayList<>();
        try (Connection conn = dbConnect.getConnection()) {
            String query = queries.get("selectTasksByState");
            PreparedStatement st = conn.prepareStatement(query);
            st.setLong(1, projectId);
            st.setLong(2, stateId);
            ResultSet rs = st.executeQuery(query);
            while (rs.next()) {
                Task task = taskFromResultSet(rs);
                if (task != null) {
                    result.add(task);
                }
            }
        } catch (Exception e) {
            result = null;
        }
        return result;
    }

    /**
     * Fetches all tasks of a sprint of a project, given the current state
     *
     * @param projectId id of the project
     * @param sprintId id of the sprint of the project
     * @param stateId id of the state of the tasks
     * @return a list of Tasks found, or null in case any error takes place.
     */
    public List<Task> selectSprintProjectTasksByState(long projectId, long sprintId, long stateId) {
        List<Task> result = new ArrayList<>();
        try (Connection conn = dbConnect.getConnection()) {
            String query = queries.get("selectTasksByState");
            PreparedStatement st = conn.prepareStatement(query);
            st.setLong(1, projectId);
            st.setLong(2, sprintId);
            st.setLong(3, stateId);
            ResultSet rs = st.executeQuery(query);
            while (rs.next()) {
                Task task = taskFromResultSet(rs);
                if (task != null) {
                    result.add(task);
                }
            }
        } catch (Exception e) {
            result = null;
        }
        return result;
    }

    /**
     * Creates a new Task, given a Task object with all its data.
     *
     * @param task with the data we want to insert
     * @return 1 if successfull, 0 in case any error takes place.
     */
    public int createTask(Task task) {
        int result = 0;
        try (Connection conn = dbConnect.getConnection()) {
            String query = queries.get("addTask");
            PreparedStatement st = conn.prepareStatement(query);
            st.setString(1, task.getName());
            st.setString(2, task.getDescription());
            st.setString(3, task.getTimeEstimacy());
            st.setInt(4, task.getPriority());
            st.setLong(5, task.getProjectId());
            st.setLong(6, task.getSprintId());
            st.setLong(7, task.getStateId());
            result = st.executeUpdate();
        } catch (SQLException ex) {
            result = 0;
        }
        return result;
    }

    /**
     * Deletes a task, given the task ID
     *
     * @param taskId of the task we want to delete
     * @return 1 if successfull, 0 in case of error.
     */
    public int deleteTask(long taskId) {
        int result = 0;
        try (Connection conn = dbConnect.getConnection()) {
            String query = queries.get("deleteTask");
            PreparedStatement st = conn.prepareStatement(query);
            st.setLong(1, taskId);
            result = st.executeUpdate();
        } catch (SQLException ex) {
            result = 0;
        }
        return result;
    }
    /**
     * Modifies an existant task, given its id and a new Task Object with the
     * updated data
     * @param taskId id of the task we want to modify
     * @param updatedTask task object with new data
     * @return 1 if successfull, 0 in case any error takes place.
     */
    public int modifyTask(int taskId, Task updatedTask) {
        int result = 0;
        try (Connection conn = dbConnect.getConnection()) {
            String query = queries.get("modifyTask");
            PreparedStatement st = conn.prepareStatement(query);
            st.setString(1, updatedTask.getName());
            st.setString(2, updatedTask.getDescription());
            st.setString(3, updatedTask.getTimeEstimacy());
            st.setInt(4, updatedTask.getPriority());
            st.setLong(5, updatedTask.getProjectId());
            st.setLong(6, updatedTask.getSprintId());
            st.setLong(7, updatedTask.getStateId());
            st.setLong(8, taskId);
            result = st.executeUpdate();
        } catch (SQLException ex) {
            result = 0;
        }
        return result;
    }
}