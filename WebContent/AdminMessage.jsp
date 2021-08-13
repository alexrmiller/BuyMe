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
	
	<h2>Message Creation</h2>
	<form method="post" action="AdminMessageProcess">
		<table>
		<tr>
		<td>
		Response to:<input type="text" name="Username" readonly>
		</td>
		</tr>
		<tr>
		<td>
		<input type="text" name="Answer" required>
		</td>
		</tr>
		</table>
		</select>&nbsp;<br> <input type="submit" value="Respond"> 	
	</form>
</body>
</html>