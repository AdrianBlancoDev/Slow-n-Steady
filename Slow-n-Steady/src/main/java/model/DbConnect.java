/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author anxnimus
 */
public class DbConnect {

    public static final String FILE_PATH = "dbConnection.properties";

    public static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    public static final String PROTOCOL = "jdbc:mysql:";
    public static String HOST = "localhost";
    public static String BD_NAME = "sns_db";
    public static String USER = "root";
    public static String PASSWORD = "adminadmin";

    public static String BD_URL;

    public static void loadDriver() throws ClassNotFoundException {
        getConnectionProperties();
        BD_URL = String.format("%s//%s/%s%s", PROTOCOL, HOST, BD_NAME, "?autoReconnect=true&useSSL=false");
    }

    private static void getConnectionProperties() throws ClassNotFoundException {
        //getConnectionProperties(); better if connection properties are read from a configuration file
        Class.forName(DRIVER);
    }

    /**
     * gets and returns a connection to database
     *
     * @return connection
     * @throws PersistException in case of connexion error
     */
    public Connection getConnection() {
        Connection conn = null;
        try {
            loadDriver();
            conn = DriverManager.getConnection(BD_URL, USER, PASSWORD);
        } catch (SQLException ex) {
            Logger.getLogger(DbConnect.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DbConnect.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conn;
    }

}
