<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.Dharshiny.notifier.dto.Note"%>

<%@ page import="com.Dharshiny.notifier.LoginServlet" %>    
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>

<%@ page import="java.io.*, java.util.*,java.text.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" name="viewport" content="width=device-width, initial-scale=1" >
		<title>Home</title>
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
    		.column{
    			float:left;
    		}
    		.left{
    			width:80%;
    		}
    		.notes{
    			width:99%;
    			margin:5px;
    			background-color:Beige;
			    display: flex;
    		}
    		.note a{
    			color:Navy;
    		}
    		.sec1{
    			padding:10px;
    			width:85%;
    		}
    		.sec2{
    			padding: 30px 25px;
    			width:15%;
    		}
    		.right{
    			padding-left:10px;
    			width:20%;
    			margin-top:5px;
    			background-color: #efeabd;
    		}
    		
    		.right a, .sec1 a{
    			color:black;
    			text-decoration:underline;
    		}
    		.badge {
			  position: absolute;
			  top: -10px;
			  right: -10px;
			  padding: 5px 8px;
			  border-radius: 50%;
			  background-color: red;
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
		
		<% List<Note> note=(List<Note>)session.getAttribute("notes");  
		List<Note> task=(List<Note>)session.getAttribute("tasks");	%>
		
		<%String s1s=(String)request.getAttribute("editS");
	   	if(s1s!=null){%>
	   	<h5 style="text-align:center; color:green; font-size:15px;">Successfully edited note!</h5>
	   	<%} %>
	   	
	   	<%String s1f=(String)request.getAttribute("editF");
	   	if(s1f!=null){%>
	   	<h5 style="text-align:center; color:red; font-size:15px;">Note cannot be edited!</h5>
	   	<%} %>
	   	
	   	<%String s2s=(String)request.getAttribute("newS");
	   	if(s2s!=null){%>
	   	<h5 style="text-align:center; color:green; font-size:15px;">Successfully added note!</h5>
	   	<%} %>
	   	
	   	<%String s2f=(String)request.getAttribute("newF");
	   	if(s2f!=null){%>
	   	<h5 style="text-align:center; color:red; font-size:15px;">Note cannot be added!</h5>
	   	<%} %>
	   	
	   	<%String s3s=(String)request.getAttribute("delS");
	   	if(s3s!=null){%>
	   	<h5 style="text-align:center; color:green; font-size:15px;">Successfully deleted note!</h5>
	   	<%} %>
	   	
	   	<%String s3f=(String)request.getAttribute("delF");
	   	if(s3f!=null){%>
	   	<h5 style="text-align:center; color:red; font-size:15px;">Note cannot be deleted!</h5>
	   	<%} %>	
	   	
	   	<%String s4s=(String)request.getAttribute("updateS");
	   	if(s4s!=null){%>
	   	<h5 style="text-align:center; color:green; font-size:15px;">Successfully updated profile!</h5>
	   	<%} %>
	   	
	   	<%String s4f=(String)request.getAttribute("updateF");
	   	if(s4f!=null){%>
	   	<h5 style="text-align:center; color:red; font-size:15px;">Profile cannot be updated!</h5>
	   	<%} %>	
		
		<div class="body">
			<div class="column left">
				
				<% if(note.isEmpty()){%>
					<h4>No task available...</h4>
				<% } %>
				
				<c:forEach items="${sessionScope.notes}" var="user">
			
					<div class="column notes">
					<div class="sec1">
						<h4><a href='ViewNoteServlet?nid=<c:out value="${user.nid}" />' ><c:out value="${user.note}"></c:out></a> - <c:out value="${user.status}"></c:out></h4>
						
						<p><b>Start : </b><c:out value="${user.sdate}"></c:out> &nbsp; &nbsp;  <b>End : </b><c:out value="${user.edate}"></c:out> </p>
					</div>
					
					<div class="sec2" style="float:right">
						 
						<a href='editNote.jsp?nid=<c:out value="${user.nid}" />' style="margin-right:15px;">Edit</a>
						<a href='DeleteNoteServlet?nid=<c:out value="${user.nid}" />' style="margin-left:15px;">Delete</a>
					</div>
					</div>
				</c:forEach>
			</div>
			<div class="column right"">
				<h3 style="text-align:center;">Daily Task</h3>
				<% if(task.isEmpty()){%>
					<h5 style="font-size:15px;">No task available...</h5>
				<% } %>
				
				<c:forEach items="${sessionScope.tasks}" var="user">
					<h4><a href='ViewNoteServlet?nid=<c:out value="${user.nid}" />' ><c:out value="${user.note}"></c:out> </a> - <c:out value="${user.status}"></c:out></h4>
					<p><b>Start &nbsp;: </b><c:out value="${user.sdate}"></c:out> </p>
					<p><b>End &nbsp; : </b><c:out value="${user.edate}"></c:out> </p><br>
				</c:forEach>
				
			</div>
		</div>
	</body>
</html>




