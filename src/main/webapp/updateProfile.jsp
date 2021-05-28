<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" name="viewport" content="width=device-width, initial-scale=1" >
		<title>Update Profile</title>
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
            <h3>Update Profile</h3>
            <form onsubmit="return validate();" action="UpdateUserServlet" method="post">
            
                <label for="firstName">FirstName</label><br>
                <input type="text" id="firstName" name="firstName"><br>
                <div id="firstName_error" style="display:none; color:red; font-size:13px;">Please enter Firstname</div>
                
                <label for="password">Password</label><br>
            	<input type="password" id="password" name="password"><br>
            	<div id="password_error" style="display:none; color:red; font-size:13px;">Please enter Password</div>
            	<div id="check_password_error" style="display:none; color:red; font-size:13px;">Password must be 6 to 12 characters</div>
            	
                <label for="cpassword">Confirm Password</label><br>
            	<input type="password" id="cpassword" name="cpassword"><br>
            	<div id="cpassword_error" style="display:none; color:red; font-size:13px;">Please enter Confirm Password</div>
            	<div id="check_cpassword_error" style="display:none; color:red; font-size:13px;">Password and Confirm Password must be same</div>
            	
                <button id="register" class="submit-button btn-success">Update</button>
                
            </form>
            <button id="cancel" class="btn-danger" onclick="location.href='home.jsp';">Cancel</button>
        </div><br><br>
        <script>
        
            function validate(){
            	var x=true;
            	var temp=true;
            	var firstname=document.getElementById("firstName").value;
            	var password=document.getElementById("password").value;
            	var cpassword=document.getElementById("cpassword").value;
            	
            	if(firstname==""){
            		temp=false;
       				document.getElementById("firstName_error").style.display='block';
            	}else{
            		document.getElementById("firstName_error").style.display='none';
            	}
     
            	if(password==""){
            		x=false;
            		temp=false;
       				document.getElementById("password_error").style.display='block';
            	}else{
            		if(password.length<6 || password.length>12){
            			temp=false;
            			document.getElementById("check_password_error").style.display='block';
            		}else{
            			document.getElementById("password_error").style.display='none';
            		}
            	}
            	
            	if(cpassword==""){
            		x=false;
            		temp=false;
       				document.getElementById("cpassword_error").style.display='block';
            	}else{
            		document.getElementById("cpassword_error").style.display='none';
            	}
            	
            	if(x==true && password!=cpassword){
            		temp=false;
       				document.getElementById("check_cpassword_error").style.display='block';
            	}else{
            		document.getElementById("check_cpassword_error").style.display='none';
            	}
                return temp;
            }
        </script>

</body>
</html>