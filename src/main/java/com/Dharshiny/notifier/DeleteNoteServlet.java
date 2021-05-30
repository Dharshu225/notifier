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

@WebServlet("/DeleteNoteServlet")
public class DeleteNoteServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
			
			int uid=LoginServlet.uid;
			List<Note> nList=new ArrayList<Note>();
			List<Note> notList=new ArrayList<Note>();
			DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy"); 
			
			LocalDate pdate=java.time.LocalDate.now();
			
			Connection con = DatabaseConnection.initializeDatabase();
			Statement stmt = con.createStatement();
			
			String note,description,status,sdate,edate,rdate;
			int nid=Integer.parseInt(request.getParameter("nid"));
			
			int i=stmt.executeUpdate("DELETE FROM note WHERE nid="+nid);
			
			ResultSet nrs=stmt.executeQuery("SELECT * FROM note WHERE uid='"+uid+"'");
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
				nList.add(notes);
			}
			
			ResultSet trs=stmt.executeQuery("SELECT * FROM note WHERE uid='"+uid+"' AND rdate ='"+pdate+"'");
			while(trs.next()){
				int Nid=trs.getInt(1);
				note=trs.getString(2);
				description=trs.getString(3);
				status=trs.getString(4);
				sdate=dateFormat.format(trs.getDate(5));
				edate=dateFormat.format(trs.getDate(6));
				rdate=dateFormat.format(trs.getDate(7));
				uid=trs.getInt(8);
				
				Note tnote=new Note(Nid,note,description,status,sdate,edate,rdate,uid);
				notList.add(tnote);
			}
			
			HttpSession session=request.getSession();  
			session.setAttribute("notes", nList);
			session.setAttribute("notification", notList.size());
			
			if(i>0){
				request.setAttribute("delS", "Successfully deleted note!");
			}
			else{
				request.setAttribute("delF", "Note cannot be deleted!");
			}
			RequestDispatcher dispatcher=request.getRequestDispatcher("home.jsp");
			dispatcher.forward(request, response);
			return;
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
}
