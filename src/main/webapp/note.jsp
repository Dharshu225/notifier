<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>    
    
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
    		table {
    			margin-left:auto;
    			margin-right:auto;
			    font-family: arial, sans-serif;
			    border-collapse: collapse;
			    width: 60%;
			}
			
			td, th {
			    border: 1px solid #dddddd;
			    text-align: left;
			    padding: 10px;
			}
			
			th{
				width:30%;
			}
			
			tr:nth-child(even) {
			    background-color: #dddddd;
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
    	</style>
</head>
<body>
	<% Object fname=session.getAttribute("fname"); 
	Object not=session.getAttribute("notification");%>
	
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
		
		<div class="container">
            <h3 style="text-align:center;">View Note</h3>
            
            <c:forEach items="${sessionScope.noteList}" var="user">
            	
            	<table>
            	
				  <tr>
				    <th>Note</th>
				    <td>: <c:out value="${user.note}"></c:out></td>
				  </tr>
				   <tr>
				    <th>Description</th>
				    <td>: <c:out value="${user.description}"></c:out></td>
				  </tr>
				   <tr>
				    <th>Status</th>
				    <td>: <c:out value="${user.status}"></c:out></td>
				  </tr>
				   <tr>
				    <th>Start Date</th>
				    <td>: <c:out value="${user.sdate}"></c:out></td>
				  </tr>
				   <tr>
				    <th>End Date</th>
				    <td>: <c:out value="${user.edate}"></c:out></td>
				  </tr>
				   <tr>
				    <th>Remainder Date</th>
				    <td>: <c:out value="${user.rdate}"></c:out></td>
				  </tr>
				  
				</table>
				
            </c:forEach>
            <button id="cancel" class="btn-danger" onclick="location.href='home.jsp';">Back</button>
        </div>		
		
</body>
</html>


