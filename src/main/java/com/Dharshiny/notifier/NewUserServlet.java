package com.Dharshiny.notifier;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Dharshiny.notifier.dto.DatabaseConnection;

@WebServlet("/NewUserServlet")
public class NewUserServlet extends HttpServlet {

	/**
	 * 
	 */
	
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
			Connection con = DatabaseConnection.initializeDatabase();
			Statement stmt = con.createStatement();
			
			String firstName,password,email;
			email=request.getParameter("email");
			password=request.getParameter("password");
			firstName=request.getParameter("firstName");
			
			ResultSet rs=stmt.executeQuery("SELECT uid from user WHERE email='"+email+"'");
			
			int count=0;
			
			if(rs.next()){
				count++;
			}
			
			if(count==0){
				stmt.executeUpdate("INSERT INTO user(email,firstName,password) VALUES ('"+ email+"','"+firstName+"','"+password +"')");
				
				request.setAttribute("success", "Successfully registered!");
				RequestDispatcher dispatcher=request.getRequestDispatcher("index.jsp");
				dispatcher.forward(request, response);
				return;
			}
			else{
				request.setAttribute("fail", "Email already exists!");
				RequestDispatcher dispatcher=request.getRequestDispatcher("index.jsp");
				dispatcher.forward(request, response);
				return;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
