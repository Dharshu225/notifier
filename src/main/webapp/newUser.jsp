<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>New User Registration</title>
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

    	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    	
		<style>
            body{
				font-family:Helvetica;
				font-weight:normal;
			}
			
	    	.container{
	    		border-radius:5px;
	        	width: 375px;
	            padding:20px;
	            margin-left: auto;
	            margin-right: auto;
	            background-color:rgb(235, 235, 235);
	            position:relative;
	      	}
	        h3{
	        	margin-top:0px;
	            text-align: center;
	            margin-bottom:18px;
	        }
	        input[type=text], input[type=password] {
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
        </style>
	</head>
	<body>
		<br><br>
		<div class="container">
            <h3>New User Registration</h3>
            <form onsubmit="return validate();" action="NewUserServlet" method="post">
            
                <label for="firstName">FirstName</label><br>
                <input type="text" id="firstName" name="firstName"><br>
                <div id="firstName_error" style="display:none; color:red; font-size:13px;">Please enter Firstname</div>
                
                <label for="email">E-mail</label><br>
                <input type="text" id="email" name="email"><br>
                <div id="email_error" style="display:none; color:red; font-size:13px;">Please enter Email</div>
                <div id="check_email_error" style="display:none; color:red; font-size:13px;">Please enter valid Email</div>
                
                <label for="password">Password</label><br>
            	<input type="password" id="password" name="password"><br>
            	<div id="password_error" style="display:none; color:red; font-size:13px;">Please enter Password</div>
            	<div id="check_password_error" style="display:none; color:red; font-size:13px;">Password must be 6 to 12 characters</div>
            	
                <label for="cpassword">Confirm Password</label><br>
            	<input type="password" id="cpassword" name="cpassword"><br>
            	<div id="cpassword_error" style="display:none; color:red; font-size:13px;">Please enter Confirm Password</div>
            	<div id="check_cpassword_error" style="display:none; color:red; font-size:13px;">Password and Confirm Password must be same</div>
            	
                <button id="register" class="submit-button btn-success">Register</button>
                
            </form>
            <button id="cancel" class="btn-danger" onclick="location.href='index.jsp';">Cancel</button>
        </div><br><br>
        <script>
            function validateEmail(email) { //Validates the email address
                var emailRegex = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                return emailRegex.test(email);
            }
            function validate(){
            	var x=true;
            	var temp=true;
            	var firstname=document.getElementById("firstName").value;
            	var email=document.getElementById("email").value;
            	var password=document.getElementById("password").value;
            	var cpassword=document.getElementById("cpassword").value;
            	if(firstname==""){
            		temp=false;
       				document.getElementById("firstName_error").style.display='block';
            	}else{
            		document.getElementById("firstName_error").style.display='none';
            	}
            	if(email==""){
            		temp=false;
       				document.getElementById("email_error").style.display='block';
            	}else if (!validateEmail(email)){ 
            		temp=false;
       				document.getElementById("check_email_error").style.display='block';
                }else{
       				document.getElementById("userName_error").style.display='none';
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