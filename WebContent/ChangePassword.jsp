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
	<h2>Update User account:</h2>
	<form method="post" action="ChangePasswordProcess.jsp">
	<%try{
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();

			//Create a SQL statement to see if credentials is a normal user
			Statement stmt = con.createStatement();

			//Make a SELECT query from the users table using the inputted username and password
			String UserQuery = "select username from user";

			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(UserQuery);

			//Run the query against the database.
			ResultSet result = ps.executeQuery();
			%>
			<label>Change User:</label>
			<select name=Username id=UsernameDdl>
			
			<%while(result.next()){
				%>
				<option value="<%out.print(result.getString("username"));%>">
				<%out.print(result.getString("username"));%>
				</option>
			
			
				<%
			}
			%>
			</select>
			<%
} catch (Exception e) {
	out.print(e);
	out.print("selection failed :()");
}
	%>

	<table>
	<tr>
	<td>
	New Username: 
	<input type=text name=newUsername>
	</td>
	</tr>
	<tr>
	<td>
	New Password: 
	<input type=text name=newPassword>
	</td>
	</tr>
	<tr>
	<td>
	</select>&nbsp;<input type="submit" value="Update User Info">
	</td>
	</tr>
	</table>
	</form>	

</body>
</html>