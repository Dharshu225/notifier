<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.Dharshiny.notifier.dto.Note"%>

<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>

<%@ page import="java.io.*, java.util.*,java.text.*" %> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" name="viewport" content="width=device-width, initial-scale=1" >
		<title>Note</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.7/css/all.css">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    	<style>
    		body{
    			font-family: Helvetica;
    			margin:5px;
    		}
			.header{
    			background-color:DarkSlateGray;
    			color:GhostWhite;
    			padding:15px 15px 15px 10px;
    			margin-bottom:10px;
    		}
    		span{
    			color:GhostWhite;
				font-size:25px;
				cursor:pointer;
    		}
    		
			button{
	       		margin-top:10px;
	       		border-radius:5px;
	       		padding:5px;
	       		cursor:pointer;
	       		margin-left:850px;
	       	}
	       	.badge {
			  position: absolute;
			  top: -10px;
			  right: -10px;
			  padding: 5px 8px;
			  border-radius: 50%;
			  background-color: red;
			}
			.notes{
    			width:50%;
    			margin:8px;
    			padding:10px;
    			margin-left:auto;
    			margin-right:auto;
    			background-color:Beige;
    		}
    		.notes a{
    			color:Black;
    			text-decoration:underline;
    		}
    		button{
	       		margin-top:10px;
	       		border-radius:5px;
	       		padding:5px;
	       		cursor:pointer;
	       		margin-left:950px;
	       	}
    	</style>
</head>
<body>
	<% Object fname=session.getAttribute("fname"); 
	Object not=session.getAttribute("notification");
	%>
	
		<div id='main'>
			<div class='header'>
				<h1 style="text-align:center;">Notifier</h1>
				<div class='section'>
					<a href="LogoutUserServlet" title="Logout"><span style="float:right;" class="glyphicon glyphicon-log-in"></span></a>
					
					<a href='home.jsp' title="Home"><span style="margin-right:10px;"><i class="fa fa-home"></i></span></a>
					
					<span style="font-size:20px;">Welcome <b><%=session.getAttribute("fname")%></b></span>
					
					<a href='updateProfile.jsp' title="Update Profile"><span style="float:right; margin-left:10px; margin-right:10px;"><i class="fa fa-edit"></i></span></a>
					
					<a href="newNote.jsp" title="New Note"><span style="float:right;  margin-right:10px;"><i class="fa fa-plus"></i></span></a>
					
					<a href="NotifyServlet" class="dropdown-toggle glyphicon glyphicon-bell"
					style="color:GhostWhite; float:right;  margin-right:18px; margin-top: 2px; font-size:25px; text-decoration:none;" title="Notification">
					<span class="badge"><%=session.getAttribute("notification")%></span>
					</a>
				
				</div>
			</div>
			
		</div>
		
		<% List<Note> note=(List<Note>)session.getAttribute("noteList");  %>
		
		<div class="body">
				<h3 style="text-align:center;">Notification</h3>
				<% if(note.isEmpty()){%>
					<h4>No remainder available...</h4>
				<% } %>
				
				<c:forEach items="${sessionScope.noteList}" var="user">
			
					<div class="notes">
						<h4><a href='ViewNoteServlet?nid=<c:out value="${user.nid}" />' ><c:out value="${user.note}"></c:out></a> - <c:out value="${user.status}"></c:out></h4>
						
						<p><b>Start : </b><c:out value="${user.sdate}"></c:out> &nbsp; &nbsp;  <b>End : </b><c:out value="${user.edate}"></c:out> </p>
					</div>
				</c:forEach>
				<button id="cancel" class="btn-danger" onclick="location.href='home.jsp';">Back</button>
		</div>
		
</body>
</html>