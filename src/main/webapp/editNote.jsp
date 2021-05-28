<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" name="viewport" content="width=device-width, initial-scale=1" >
		<title>Edit Note</title>
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
    		.container{
    			font-weight:normal;
	    		border-radius:5px;
	        	width: 375px;
	            padding:20px;
	            margin-left: auto;
	            margin-right: auto;
	            background-color:rgb(235, 235, 235);
	            position:relative;
	            font-size:15px;
	      	}
	        h3{
	        	margin-top:0px;
	            text-align: center;
	            margin-bottom:18px;
	        }
	        input[type=text], input[type=password] ,input[type=date],#status{
	        	border:none;
	        	box-shadow: 5px 5px 5px grey;
	            width: 100%;
	        	padding: 7px;
	            margin-bottom:10px;
	       	}
	       	button{
	       		margin-top:10px;
	       		border-radius:5px;
	       		padding:5px;
	       		cursor:pointer;
	       	}
	       	#cancel{
	       		position:absolute;
	       		bottom:21px;
	       		right:20px;
	       	}
	       	label{
	       		font-size:15px;
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
            <h3>New Note</h3>
            <form onsubmit="return validate()" action="EditNoteServlet" method="post">
                
                <label for="description">Description</label><br>
                <input type="text" id="description" name="description"><br>
                <div id="description_error" style="display:none; color:red; font-size:13px;">Please enter Description</div>
                
                <label for="status">Status</label><br>
                <select id="status" name="status">
                	<option value="">Select</option>
                	<option value="Not Started">Not Started</option>
                	<option value="Ongoing">Ongoing</option>
                	<option value="Completed">Completed</option>
                </select><br>
            	<div id="status_error" style="display:none; color:red; font-size:13px;">Please enter Status</div>
            	
                <label for="sdate">Start Date</label><br>
            	<input type="date" id="sdate" name="sdate"><br>
            	<div id="sdate_error" style="display:none; color:red; font-size:13px;">Please enter Start Date</div>
            	
            	<label for="edate">End Date</label><br>
            	<input type="date" id="edate" name="edate"><br>
            	<div id="edate_error" style="display:none; color:red; font-size:13px;">Please enter End Date</div>
            	
            	<label for="rdate">Remainder Date</label><br>
            	<input type="date" id="rdate" name="rdate"><br>
            	<div id="rdate_error" style="display:none; color:red; font-size:13px;">Please enter Remainder Date</div>
            	
            	<input type="hidden" name="nid" value="<%= request.getParameter("nid") %>">
                <button id="create" class="submit-button btn-success">Update</button>
                
            </form>
            <button id="cancel" class="btn-danger" onclick="location.href='home.jsp';">Cancel</button>
        </div><br><br>
		
		<script>
            function validate(){
            	var temp=true;
            	var note=document.getElementById("note").value;
            	var description=document.getElementById("description").value;
            	var status=document.getElementById("status").value;
            	var sdate=document.getElementById("sdate").value;
            	var edate=document.getElementById("edate").value;
            	var rdate=document.getElementById("rdate").value;
            	
            	if(description==""){
            		temp=false;
       				document.getElementById("description_error").style.display='block';
            	}else{
       				document.getElementById("description_error").style.display='none';
                }
            	if(status==""){
            		temp=false;
       				document.getElementById("status_error").style.display='block';
            	}else{
            		document.getElementById("status_error").style.display='none';
            	}
            	if(sdate==""){
            		temp=false;
       				document.getElementById("sdate_error").style.display='block';
            	}else{
            		document.getElementById("sdate_error").style.display='none';
            	}
            	if(edate==""){
            		temp=false;
       				document.getElementById("edate_error").style.display='block';
            	}else{
            		document.getElementById("edate_error").style.display='none';
            	}
            	if(rdate==""){
            		temp=false;
       				document.getElementById("rdate_error").style.display='block';
            	}else{
            		document.getElementById("rdate_error").style.display='none';
            	}
            	return temp;
            }
        </script>
	</body>
</html>