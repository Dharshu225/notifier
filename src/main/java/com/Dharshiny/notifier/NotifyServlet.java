package com.Dharshiny.notifier;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dharshiny.notifier.dto.DatabaseConnection;
import com.Dharshiny.notifier.dto.Note;

@WebServlet("/NotifyServlet")
public class NotifyServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
			
			int uid=LoginServlet.uid;
			List<Note> notifyList=new ArrayList<Note>();
			DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy"); 
			
			Connection con = DatabaseConnection.initializeDatabase();
			Statement stmt = con.createStatement();
			
			String note,description,status,sdate,edate,rdate;
			
			LocalDate pdate=java.time.LocalDate.now();
			
			ResultSet nrs=stmt.executeQuery("SELECT * FROM note WHERE uid='"+uid+"' AND rdate ='"+pdate+"'");
			while(nrs.next()){
				int Nid=nrs.getInt(1);
				note=nrs.getString(2);
				description=nrs.getString(3);
				status=nrs.getString(4);
				sdate=dateFormat.format(nrs.getDate(5));
				edate=dateFormat.format(nrs.getDate(6));
				rdate=dateFormat.format(nrs.getDate(7));
				uid=nrs.getInt(8);
				
				Note notes=new Note(Nid,note,description,status,sdate,edate,rdate,uid);
				notifyList.add(notes);
				
			}
			
			HttpSession session=request.getSession();  
			session.setAttribute("noteList", notifyList);
			
			RequestDispatcher dispatcher=request.getRequestDispatcher("notification.jsp");
			dispatcher.forward(request, response);
			return;
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
