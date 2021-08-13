<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Notifications</title>
</head>
<body>
	<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();
		userid
		//Make an insert statement for the Sells table:
		String ViewAlertsQuery = "SELECT a_interested FROM alert Where al_username=?";
		
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(AlertsQuery);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, userid);
		
		//Run the query against the DB
		out.print(ps.executeQuery());
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		
		out.print("Your all caught Up!");
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("Error viewing your notifications");
	}
%>

	<form action="Login.jsp">
	<table>
	<tr>
	</tr>
	<tr>
	<td>
	</select>&nbsp;<input type="submit" value="Back to Login"> 
	</td>
	</tr>
	</table>
	</form>
</body>
</html>
