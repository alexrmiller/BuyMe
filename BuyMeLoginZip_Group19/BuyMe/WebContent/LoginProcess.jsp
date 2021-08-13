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

		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			String LoginQuery = "SELECT * FROM users Where Username=? and Password=?";
			
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(LoginQuery);

			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, request.getParameter("Username"));
			ps.setString(2, request.getParameter("Password"));
			
			//Run the query against the database.
			ResultSet result = ps.executeQuery();
			
			if(result.next()){
				if(result.getBoolean("isAdmin")){
				out.print("User: " + result.getString("Username") + " logged in. They are an admin.");
				}
				else{
				out.print("User: " + result.getString("Username") + " logged in. They are not an admin.");	
				}
			}
			else{
				out.print("not a user in our system. Please try again");
			}

			//close the connection.
			con.close();

		} catch (Exception e) {
			out.print(e);
			out.print("selection failed :()");
		}
	%>
	<form action="Login.jsp">
	<table>
	<tr>
	</tr>
	<tr>
	<td>
	</select>&nbsp;<input type="submit" value="Logout"> 
	</td>
	</tr>
	</table>
	</form>

</body>
</html>