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


@WebServlet("/HomeServlet")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public static int uid;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Note> nList=new ArrayList<Note>();
		List<Note> tList=new ArrayList<Note>();
		
		DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy"); 
		
		try {
			Connection con = DatabaseConnection.initializeDatabase();
			Statement stmt = con.createStatement();
			
			ResultSet nrs=stmt.executeQuery("SELECT * FROM note WHERE uid='"+uid+"'");
			while(nrs.next()){
				int nid=nrs.getInt(1);
				String note=nrs.getString(2);
				String description=nrs.getString(3);
				String status=nrs.getString(4);
				String sdate=dateFormat.format(nrs.getDate(5));
				String edate=dateFormat.format(nrs.getDate(6));
				String rdate=dateFormat.format(nrs.getDate(7));
				int uid=nrs.getInt(8);
				
				System.out.println(note);
				
				Note nnote=new Note(nid,note,description,status,sdate,edate,rdate,uid);
				nList.add(nnote);
			}
			
			LocalDate pdate=java.time.LocalDate.now();
			
			ResultSet trs=stmt.executeQuery("SELECT * FROM note WHERE uid='"+uid+"' AND sdate ='"+pdate+"'");
			while(trs.next()){
				int nid=trs.getInt(1);
				String note=trs.getString(2);
				String description=trs.getString(3);
				String status=trs.getString(4);
				String sdate=dateFormat.format(trs.getDate(5));
				String edate=dateFormat.format(trs.getDate(6));
				String rdate=dateFormat.format(trs.getDate(7));
				int uid=trs.getInt(8);
				
				Note tnote=new Note(nid,note,description,status,sdate,edate,rdate,uid);
				tList.add(tnote);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		HttpSession session=request.getSession();
	    session.setAttribute("notes", nList);
	    session.setAttribute("tasks", tList);
	    RequestDispatcher dispatcher=request.getRequestDispatcher("/home.jsp");
	    dispatcher.forward(request, response);

	}

}
