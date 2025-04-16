<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<link rel="stylesheet" href="CSSfiles/LoginAndSignup.css">
</head>
<body>
<div class="head">
		<header>
			Welcome To Sakura Online E - commerce
		</header>
	</div>
	
    <div class="container">
        <div class="login-box">
            <h2>Login</h2>
            <form action="login" method="post">
                <div class="input-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" placeholder="Type your username" required>
                </div>
                <div class="input-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="Type your password" required>
                </div>
                
                <button type="submit" class="login-btn">Login</button>
            </form>
            
            <% String error = request.getParameter("error");
	        if(error !=null && error.equals("1")){ %>
	        
        <p style="color:red;">Invalid Username or Password.Please Try again!</p>
        
        <% } %>
        
        <%
		String Register = request.getParameter("registration");
		
		if(Register != null && Register.equals("success")){ %>
		
			<p style="color: orange;">Registration Successful. Please Login.</p>
			
		<% } %>
            
            <div class="signup-link">
                <p>Or Sign Up Using</p>
                <a href="Signup.jsp">Sign Up</a>
            </div>
        </div>
    </div>
</body>
</html>