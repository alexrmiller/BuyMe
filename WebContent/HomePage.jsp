<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Home Page</title>
		
	</head>
	<body>
	
	<%//TO DO: invalidate when logging out %>
	<h2>Welcome to BuyMe!</h2>
	<p>choose what you'd like to do</p>
	
	<%
	//Admin section of the home page
	if((Boolean)session.getAttribute("isAdmin")){
		%>
		
		<form action="Login.jsp">
		<table>
		<tr>
		<td>
		</select>&nbsp;<br> <input type="submit" value="Logout"> 	
		</td>
		</tr>
		</table>
		</form>
		
		<form method="get" name="GenerateReports" action="Reports.jsp">
		<table>
		<tr>
		<td>
		</select>&nbsp;<br> <input type="submit" value="Generate report"> 
		</td>
		</tr>
		</table>
		</form>
		
		<form method="get" name="CreateCRep" action="CreateCRep.jsp">
		<table>
		<tr>
		<td>
		</select>&nbsp;<br> <input type="submit" value="Create Customer Rep">
		</td> 
		</tr>
		</table>
		</form>
		
		<%
	}
	//Customer Rep section of the home page
	else if((Boolean)session.getAttribute("isCRep")){
		%>
		
		<form action="Login.jsp">
		<table>
		<tr>
		<td>
		</select>&nbsp;<br> <input type="submit" value="Logout"> 	
		</td>
		</tr>
		</table>
		</form>
		
		<form method="get" name="RemoveBid" action="removeBids.jsp">
		<table>
		<tr>
		<td>
		</select>&nbsp;<br> <input type="submit" value="Remove bid">
		</td> 
		</tr>
		</table>
		</form>
		
		<form method="get" name="View" action="ViewAdminMessages.jsp">
		<table>
		<tr>
		<td>
		</select>&nbsp;<br> <input type="submit" value="View Messages"> 
		</td>
		</tr>
		</table>
		</form>
		
		
		<form  method="get" name="ChangePass" action="ChangePassword.jsp">
		<table>
		<tr>
		<td>
		</select>&nbsp;<br> <input type="submit" value="Update User Information"> 
		</td>
		</tr>
		</table>
		</form>
		<%
	}
	
	//Normal User section of the home page
	else{
		%>
		
		<form action="Login.jsp">
		<table>
		<tr>
		<td>
		</select>&nbsp;<br> <input type="submit" value="Logout"> 	
		</td>
		</tr>
		</table>
		</form>
		
		<form name="SellItems" action="Sell.jsp">
		<table>
		<tr>
		<td>
		</select>&nbsp;<br> <input type="submit" value="Sell Items"> 
		</td>
		</tr>
		</table>
		</form>
		
		<form method="get" name="ViewItems" action="ItemList.jsp">
		<table>
		<tr>
		<td>
		</select>&nbsp;<br> <input type="submit" value="View Items">
		</td> 
		</tr>
		</table>
		</form>
		
		<form  method="get" name="ViewNotifications" action="UserNotifications.jsp">
		<table>
		<tr>
		<td>
		</select>&nbsp;<br> <input type="submit" value="View Notifications"> 
		</td>
		</tr>
		</table>
		</form>
		
		<form  method="get" name="MessageReps" action="MessageCustomerReps.jsp">
		<table>
		<tr>
		<td>
		</select>&nbsp;<br> <input type="submit" value="Message Customer Reps">
		</td>
		</tr>
		</table>
		</form>
		
		<%
	}
	%>
	
	

</body>
</html>