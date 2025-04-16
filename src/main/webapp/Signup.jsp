<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sign Up Page</title>
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
            <h2>Sign Up</h2>
            <form action="Signup" method="post">
                <div class="input-group">
                    <label for="username">Username</label>
                    <input type="text" id="username"  name="username" placeholder="Type your username" required>
                </div>
                <div class="input-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" placeholder="Type your email" required>
                </div>
                <div class="input-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="Create a password" required>
                </div>
                <button type="submit" class="login-btn">Sign Up</button>
            </form>
            
            <%
		String error = request.getParameter("error");
		
		if(error != null && error.equals("1")){ %>
		
			<p style="color: red;">Registration failed. Please try again.</p>
			
		<% } %> 
            <div class="signup-link">
                <p>Already have an account?</p>
                <a href="login.jsp">Login</a>
            </div>
        </div>
    </div>
</body>
</html>