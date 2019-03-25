package com.company.controller;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class MySQLConnTest {
	private static final String Driver = "com.mysql.cj.jdbc.Driver";
	private static final String URL = "jdbc:mysql://127.0.0.1:3306/springdb?"
			+ "useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
	private static final String User = "spring";
	private static final String Pass = "1234";
	
	@Test
	public void testConnection() throws Exception {
		Class.forName(Driver);
		try (Connection con = DriverManager.getConnection(URL, User, Pass)){
			System.out.println(con);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
