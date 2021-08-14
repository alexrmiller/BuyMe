<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Items</title>
		
	</head>
	
	<body>
	<h2>Explore some products</h2>
	<p>use the search bar to find the items available to bid</p>
	<form method="get" name="frm1" action="ProductNameProcess.jsp" >
		<table>
		<tr>
		<td>
		Search:
		</td>
		<td>
		<input type="text" name="Search with Product name">
		</td>
		</tr>
		</table>
		</form>
	<form method="get" name="frm1" action="SellerNameProcess.jsp" >
		<table>
		<tr>
		<td>
		Search:
		</td>
		<td>
		<input type="text" name="Search with Seller name">
		</td>
		</tr>
		</table>
		</form>
	<p>type an integer of the highest bid you'd be willing to purchase</p>
	<form method="get" name="frm1" action="HighestBidProcess.jsp" >
		<table>
		<tr>
		<td>
		Search:
		</td>
		<td>
		<input type="text" name="Search with a Highest Bid">
		</td>
		</tr>
		</table>
		</form>
	<form action="Main.jsp">
	<table>
	<tr>
	</tr>
	<tr>
	<td>
	</select>&nbsp;<input type="submit" value="Return to Main Menu"> 
	</td>
	</tr>
	</table>
	</form>
</body>
</html>
