<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.BigAuction.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Start Page</title>
	</head>
	
	<body>
		<style>
		@import url(https://fonts.googleapis.com/css?family=Roboto:300);
        header .header{
          background-color: #fff;
          height: 45px;
        }
        header a img{
          width: 134px;
        margin-top: 4px;
        }
        .login-page {
          width: 360px;
          padding: 8% 0 0;
          margin: auto;
        }
        .login-page .form .login{
          margin-top: -31px;
        margin-bottom: 26px;
        }
        .form {
          position: relative;
          z-index: 1;
          background: #FFFFFF;
          max-width: 360px;
          margin: 0 auto 100px;
          padding: 45px;
          text-align: center;
          box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
        }
        .form input {
          font-family: "Roboto", sans-serif;
          outline: 0;
          background: #f2f2f2;
          width: 100%;
          border: 0;
          margin: 0 0 15px;
          padding: 15px;
          box-sizing: border-box;
          font-size: 14px;
        }
        .form button {
          font-family: "Roboto", sans-serif;
          text-transform: uppercase;
          outline: 0;
          background-color: #328f8a;
          background-image: linear-gradient(45deg,#328f8a,#08ac4b);
          width: 100%;
          border: 0;
          padding: 15px;
          color: #FFFFFF;
          font-size: 14px;
          -webkit-transition: all 0.3 ease;
          transition: all 0.3 ease;
          cursor: pointer;
        }
        .form .message {
          margin: 15px 0 0;
          color: #b3b3b3;
          font-size: 12px;
        }
        .form .message a {
          color: #4CAF50;
          text-decoration: none;
        }

        .container {
          position: relative;
          z-index: 1;
          max-width: 300px;
          margin: 0 auto;
        }

        body {
          background-color: #328f8a;
          background-image: linear-gradient(45deg,#328f8a,#08ac4b);
          font-family: "Roboto", sans-serif;
          -webkit-font-smoothing: antialiased;
          -moz-osx-font-smoothing: grayscale;
        }

		</style>
		<div class="login-page">
                  <div class="form">
                    <div class="login">
                      <div class="login-header">
                        <h3>LOGIN</h3>
                        <p>Online auction system</p>
                      </div>
                    </div>
                    <form class="login-form" method="post" action="logincheck.jsp">
                      <input type="text" name="username" placeholder="username"/>
                      <input type="password" name="password" placeholder="password"/>
                      <button type="submit"  value="Login">login</button>
                      <p class="message">Not registered? <a href="#">Create an account</a></p>
                    </form>
                  </div>
                </div>

		<br>
		<h1>New User</h1>
		<form method="post" action="newaccount.jsp">
			<table>
				<tr><td>Email</td></tr>
				<tr><td><input type="text" name="email"></td></tr>
				<tr><td>Username</td></tr>
				<tr><td><input type="text" name="username"></td></tr>
				<tr><td>Password</td></tr>
				<tr><td><input type="password" name="password"></td></tr>
			</table>
			<input type="submit" value="Create Account">
		</form>
	<br>

</body>
</html>