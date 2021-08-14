<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		List<String> list = new ArrayList<String>();
		HttpSession mySession = request.getSession();

		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();

			//Create a SQL statement to see if credentials is a normal user
			Statement DeleteUserstmt = con.createStatement();

			//Make a SELECT query from the users table using the inputted username and password
			String DeleteUserQuery = "Delete from user where username=?";

			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(DeleteUserQuery);

			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, request.getParameter("Username"));

			//Run the query against the database.
			boolean result = ps.execute();
			
				%>
				<form action="HomePage.jsp">
	<table>
	<tr>
	<td>
	User deleted
	</td>
	</tr>
	<tr>
	<td>
	</select>&nbsp;<input type="submit" value="Back to Homepage"> 
		</td>
	</tr>
	</table>
	</form>
			<%

			con.close();

		//catch if there are any errors on user login
		} catch (Exception e) {
			out.print(e);
			out.print("selection failed :()");
		}
	%>
</body>
</html>
