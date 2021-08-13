<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>SignUp</title>
	</head>
	
	<body>
	
	<h2>Sign Up</h2>
	<p>Welcome to Buy Me!</p>
	<form method="get" action="SignUpProcess.jsp">
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
		Email:
		</td>
		<td>
		<input type="text" name="Email" required>
		</td>
		</tr>
		<tr>
		<td>
		Address:
		</td>
		<td>
		<input type="text" name="Address">
		</td>
		</tr>
		<tr>
		<td>
		Credit Card:
		</td>
		<td>
		<input type="text" name="CreditCard">
		</td>
		</tr>
		</table>
		</select>&nbsp;<br> <input type="submit" value="Sign Up"> 	
	</form>
	<form action="Login.jsp">
		<table>
		<tr>
		<td>
		</select>&nbsp;<input type="submit" value="Back to Login"> 
		</td>
		</tr>
		</table>
	</form>
</body>
</html>