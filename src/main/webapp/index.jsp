<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import='com.Dharshiny.notifier.NewUserServlet'%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Login</title>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	
	<style>
		body{
			font-family:Helvetica;
			font-weight:normal;
		}
		
    	.container{
    		border-radius:10px;
        	width: 350px;
            padding:20px;
            margin-left: auto;
            margin-right: auto;
            background-color:rgb(235, 235, 235);
            position:relative;
      	}
        h2{
        	margin-top:0px;
            text-align: center;
        }
        input[type=text], input[type=password] {
        	border:none;
        	box-shadow: 5px 5px 5px grey;
            width: 100%;
        	padding: 7px;
            margin-bottom:10px;
       	}
       	input[type=checkbox]{
       		margin-top:5px;
       	}
       	button{
       		margin-top:10px;
       		border-radius:5px;
       		padding:5px;
       		cursor:pointer;
       	}
	    #newUser{
	    	position:absolute;
	       	bottom:20px;
	       	right:20px;
	  	}
	  	i{
	  		margin-top:5px;
	  		font-size:13px;
	  	}
	  	 
  	</style>
</head>
<body>
	<br>
	<div class="container" id="container">
    	<h2>Login</h2>
       	<form onsubmit="return validate()" action="LoginServlet" method="post">
        	<label for="userName">Email</label>
            <input type="text" id="userName" name="userName">
            <div id="userName_error" style="display:none; color:red; font-size:13px;">Username cannot be empty</div>
            <label for="password">Password</label>
            <input type="password" id="password" name="password">
            <div id="password_error" style="display:none; color:red; font-size:13px;">Password cannot be empty</div>
            <input type="checkbox" id="showPass" onclick="showPassword()" ><i>Show Password</i><br>
            <button id="login" class="submit-button btn-success">Login</button>
      	</form>
      	<button id="newUser" class="btn-info" onclick="location.href='newUser.jsp';">New User</button>
   	</div><br>
	
	<%String s1=(String)request.getAttribute("fail");
   	if(s1!=null){%>
   	
   	<h5 style="text-align:center; color:red; font-size:15px;">Email already exist!</h5>
   	<%} %>
   	
   	<%String s2=(String)request.getAttribute("success");
   	if(s2!=null){%>
   	
   	<h5 style="text-align:center; color:green; font-size:15px;">Successfully registered!</h5>
   	<%} %>
   	
   	<%String s3=(String)request.getAttribute("invalid");
   	if(s3!=null){%>
   	
   	<h5 style="text-align:center; color:red; font-size:15px;">Invalid Username or Password!</h5>
   	<%} %>
	
   	<script>
   		function validate(){
   			var temp=true;
   			var username=document.getElementById("userName").value;
   			var password=document.getElementById("password").value;
   			if(username==""){
   				temp=false;
   				document.getElementById("userName_error").style.display='block';
   			}else{
   				document.getElementById("userName_error").style.display='none';
   			}
   			if(password==""){
   				temp=false;
   				document.getElementById("password_error").style.display='block';
   			}else{
   				document.getElementById("password_error").style.display='none';
   			}
   			
   			return temp;
   		}
   		
   		function showPassword(){
   			var x = document.getElementById("password");
	   		  if (x.type === "password") {
	   		    x.type = "text";
	   		  } else {
	   		    x.type = "password";
	   		  }
   		}
   	</script>
</body>
</html>
