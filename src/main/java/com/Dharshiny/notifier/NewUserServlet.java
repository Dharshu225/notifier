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
			
			stmt.executeUpdate("INSERT INTO user(email,firstName,password) VALUES ('"+ email+"','"+firstName+"','"+password +"')");
			
			RequestDispatcher dispatcher=request.getRequestDispatcher("index.jsp");
			dispatcher.forward(request, response);
			return;
			
			/*LoginService login=new LoginService(firstName,email,password);
			boolean result= login.validity(email);
			if(result){
				RequestDispatcher dispatcher=request.getRequestDispatcher("index.jsp");
				dispatcher.forward(request, response);
				return;
			}else{
				request.setAttribute("errorMessage", "Email already exists!");
				request.getRequestDispatcher("index.jsp").forward(request, response);
				return;
			}*/
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
