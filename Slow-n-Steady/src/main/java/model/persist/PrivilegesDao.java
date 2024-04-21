/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.persist;

import java.util.HashMap;
import java.util.Map;
import model.DbConnect;

/**
 *
 * @author anxnimus
 */
public class PrivilegesDao {
    private final DbConnect dbConnect;
    private final Map<String, String> queries;
    
    public PrivilegesDao(){
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
        
        
    }
}
