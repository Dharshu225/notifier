package com.Dharshiny.notifier.dto;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
	
	 public static Connection initializeDatabase()
		        throws SQLException, ClassNotFoundException
		    {
		        String dbDriver = "com.mysql.cj.jdbc.Driver";
		        String dbURL = "jdbc:mysql://localhost:3306/notifier";
		        String dbUsername = "root";
		        String dbPassword = "Dharsh@225";
		  
		        Class.forName(dbDriver);
		        Connection con = DriverManager.getConnection(dbURL,
		                                                     dbUsername, 
		                                                     dbPassword);
		        return con;
		    }
	 
}
