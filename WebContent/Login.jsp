<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Login</title>
		
	</head>
	
	<body>
	<h2>Welcome to Buy Me</h2>
	<p>please log in!</p>
	<form method="get" name="frm1" action="LoginProcess.jsp" >
		<table>
		<tr>
		<td>
		Username:
		</td>
		<td>
		<input type="text" name="Username" required>
		</td>
		</tr>
		<tr>
		</tr>
		<tr>
		<td>
		Password:
		</td>
		<td>
		<input type="text" name="Password" required>
		</td>
		</tr>
		<tr>
		<td>
		</select>&nbsp;<br> <input type="submit" value="Login" onclick="checkAndSubmit()"> 
		</td>
		</tr>
		</table>		
	</form>
	<form action="SignUp.jsp">
	<table>
	<tr>
	</tr>
	<tr>
	<td>
	Don't have an account? </select>&nbsp;<input type="submit" value="Sign up"> 
		</td>
	</tr>
	</table>
	</form>

</body>
</html>