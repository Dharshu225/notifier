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


/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public static List<String> luser=new ArrayList<String>();
	public static int uid;
	public String firstName;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userName,password;
		List<Note> nList=new ArrayList<Note>();
		List<Note> tList=new ArrayList<Note>();
		List<Note> notList=new ArrayList<Note>();
		
		userName=request.getParameter("userName");
		password=request.getParameter("password");
		DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy"); 
		
		try {
			Connection con = DatabaseConnection.initializeDatabase();
			Statement stmt = con.createStatement();
			ResultSet rs=stmt.executeQuery("SELECT * FROM user WHERE email='"+userName+"'");
			while(rs.next()){
				uid=rs.getInt(1);
				luser.add(rs.getString(2));
				luser.add(rs.getString(3));
				luser.add(rs.getString(4));
			}
			
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
			
			trs=stmt.executeQuery("SELECT * FROM note WHERE uid='"+uid+"' AND rdate ='"+pdate+"'");
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
				notList.add(tnote);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(luser.get(2).equals(password)){
			firstName=luser.get(1);
			HttpSession session=request.getSession();  
	        session.setAttribute("fname",firstName);
	        session.setAttribute("notes", nList);
	        session.setAttribute("tasks", tList);
	        session.setAttribute("notification", notList.size());
	        
	        RequestDispatcher dispatcher=getServletContext().getRequestDispatcher("/home.jsp");
	        dispatcher.forward(request, response);
		}
		else{
			System.out.println("Invalid user");
			response.sendRedirect("index.jsp");
			return;
		}
		
		/*LoginService login=new LoginService();
		boolean result=login.authenticate(userName,password);
		if(result){
			User user=login.getUserDetails(userName);
			request.setAttribute("user", user);
			RequestDispatcher dispatcher=request.getRequestDispatcher("home.jsp");
			dispatcher.forward(request, response);
			return;
		}else{
			response.sendRedirect("index.jsp");
			return;
		}*/
		
		/*<%for(int i=0;i<note.size();i++){ %>
		<div class="note">
			<div class="sec1">
				<h4><%out.print(note.get(i).getNote()); %> - <%out.print(note.get(i).getStatus()); %></h4>
				<p><%out.print(note.get(i).getDescription()); %></p>
				<p><b>Start : </b><%out.print(note.get(i).getSdate()); %> &nbsp; &nbsp;  <b>End : </b><%out.print(note.get(i).getEdate()); %> &nbsp; &nbsp; <b>Remainder : </b><%out.print(note.get(i).getRdate());%></p>
			</div>
			
			<div class="sec2" style="float:right">
			
				<c:url var="editURL" value="editNote.jsp">
				   <c:param name="nid" value="${note.get(i).getNid()}"/>
				</c:url>
				
				<a href='<c:out value="${editURL}" />' style="margin-right:15px;">Edit</a>
				<a href="#" style="margin-left:15px;">Delete</a>
			</div>
		</div>
	<%} %> */
	}

}