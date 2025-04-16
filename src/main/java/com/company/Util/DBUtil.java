package com.company.Util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
	private static final String url ="jdbc:mysql://localhost:3306/sakuraonlineecommerce";		
	private static final String username = "root";
	private static final String password = "(Gaurav@1234)";
	
	static {
		try {
			//Load the Mysql jdbc Driver
			Class.forName("com.mysql.cj.jdbc.Driver");	
			System.out.println("File Found");
		}
		catch(ClassNotFoundException e){
			System.out.println("File not Found");
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection() throws SQLException {
		
		System.out.println("Connection Created");
		return DriverManager.getConnection(url,username,password);
		
	}
}
