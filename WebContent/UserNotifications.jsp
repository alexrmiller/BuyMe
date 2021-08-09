<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Notifications</title>

</head>

<body>
	<h2>Notifications</h2>

	<%	
		try{
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();

			//Create a SQL statement to see if credentials is a normal user
			Statement stmt = con.createStatement();

			//Make a SELECT query from the users table using the inputted username and password
			String NotificationQuery = "select notification from usernotifications, user where user.username = usernotifications.username and user.username = ?";

			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(NotificationQuery);

			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, (String)session.getAttribute("username"));

			//Run the query against the database.
			ResultSet result = ps.executeQuery();
			
			while(result.next()){
				
				out.print(result.getString("notification"));
				out.print("\n");
			}
} catch (Exception e) {
	out.print(e);
	out.print("selection failed :()");
}
	%>

</body>
</html>