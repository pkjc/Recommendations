package com.recom.utils;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

import com.mysql.jdbc.Driver;

public class DatabaseUtil {

	private static Connection connection = null;
	
	public static Connection getConnection() {
		if (connection != null)
			return connection;
		else {
			try {
				
				Properties prop = new Properties();
				InputStream inputStream = DatabaseUtil.class.getClassLoader()
						.getResourceAsStream("/db.properties");
				prop.load(inputStream);
				
				String driver = prop.getProperty("driver");
				String url = prop.getProperty("url");
				String user = prop.getProperty("user");
				String password = prop.getProperty("password");
				
				System.out.println("DRIVER NAME " + driver);
				
				// Load the JDBC driver
				Class driver_class = Class.forName(driver);
				Driver driver1;
				
				try {
					driver1 = (Driver) driver_class.newInstance();
					DriverManager.registerDriver(driver1);
				} catch (InstantiationException e) {
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				}
				
				connection = DriverManager.getConnection(url, user, password);
				System.out.println("\n CONNECTION " + connection.toString());
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return connection;
		}
	}	
}
