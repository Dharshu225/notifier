package com.Dharshiny.notifier;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dharshiny.notifier.dto.DatabaseConnection;
import com.Dharshiny.notifier.LoginServlet;


@WebServlet("/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
			int uid=LoginServlet.uid;
			
			Connection con = DatabaseConnection.initializeDatabase();
			Statement stmt = con.createStatement();
			
			String firstName,password;
			password=request.getParameter("password");
			firstName=request.getParameter("firstName");
			
			stmt.executeUpdate("UPDATE user SET firstName='"+firstName+"',password='"+password +"' WHERE uid="+uid);
			
			HttpSession session=request.getSession();  
	        	session.setAttribute("fname",firstName);
			RequestDispatcher dispatcher=request.getRequestDispatcher("home.jsp");
			dispatcher.forward(request, response);
			return;
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
