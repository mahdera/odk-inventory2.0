/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package et.edu.aau.odkinventory.server.classes;

import java.sql.*;

/**
 *
 * @author mahder
 */
public class DBConnection {
    private static Connection con;
    private static Statement stmt;
    private static ResultSet rSet;
    private static final String DATABASE_DRIVER = "com.mysql.jdbc.Driver";
    private static final String DATABASE_URL = "jdbc:mysql://localhost:8889/odk_prod?useUnicode=true&characterEncoding=UTF-8";
    private static boolean connected;

    public DBConnection() {
        
    }

    private static void connect() throws Exception {
        Class.forName(DATABASE_DRIVER).newInstance();
        con = DriverManager.getConnection(DATABASE_URL, "root", "root");
        if(con != null){
        		stmt = con.createStatement();
        		connected = true;
        }else{
        		connected = false;
        }
    }

    public static Connection getDatabaseConnection() throws Exception{
        connect();
        Connection connection = getCon();
        return connection;
    }

    public static void disconnectDatabase() {
        try {
            stmt.close();
            con.close();
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        } 
    }

    public static boolean isConnected() {
        return connected;
    }

    public static void writeToDatabaseSec(PreparedStatement pStmt){
    		try{
    			pStmt.executeUpdate();
    		}catch(Exception e){
    			e.printStackTrace();
    		}
    }
    
    public static ResultSet readFromDatabaseSec(PreparedStatement pStmt){
    		ResultSet rSet = null;
    		try{
    			rSet = pStmt.executeQuery();
    		}catch(Exception e){
    			e.printStackTrace();
    		}
    		return rSet;
    }
    
    public static PreparedStatement getPreparedStatement(String sqlStr){
    		PreparedStatement preparedStatement = null;
    		try{
    			connect();
    			preparedStatement = getCon().prepareStatement(sqlStr);
    		}catch(Exception e){
    			e.printStackTrace();
    		}
    		return preparedStatement;
    }

    public static Connection getCon() {
        return con;
    }

    public static void setCon(Connection con) {
        DBConnection.con = con;
    }

    public static ResultSet readFromDatabase(String query) {
        try {
            connect();
            rSet = stmt.executeQuery(query);
        } catch (Exception sqle) {
            sqle.printStackTrace();
        }
        return rSet;
    }
    
    public static void writeToDatabase(String command) {
        try {
            connect();
            stmt.executeUpdate(command);
        } catch (Exception sqle) {
            sqle.printStackTrace();
        }
    }
    
}//end class

