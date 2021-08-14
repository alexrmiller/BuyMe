<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Items</title>
</head>
<body>
	<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();
		//Make an insert statement for the Sells table:
		String itemQuery = "SELECT * FROM item Where Product_Name=%?%";
		
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(itemQuery);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, request.getParameter("Search"));
		
		//Run the query against the DB
		out.print(ps.executeQuery());
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		
		out.print("Those are all our listed products containing: "+ request.getParameter("Search") + " in its name");
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("Error viewing listed products");
	}
%>
	<form action="HomePage.jsp">
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
