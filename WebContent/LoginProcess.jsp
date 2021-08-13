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
		session.setAttribute("isCRep", false);
		session.setAttribute("isAdmin", false);

		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();

			//Create a SQL statement to see if credentials is a normal user
			Statement Userstmt = con.createStatement();

			//Make a SELECT query from the users table using the inputted username and password
			String UserLoginQuery = "SELECT * FROM user Where username=? and password=?";

			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement userPs = con.prepareStatement(UserLoginQuery);

			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			userPs.setString(1, request.getParameter("Username"));
			userPs.setString(2, request.getParameter("Password"));

			//Run the query against the database.
			ResultSet result = userPs.executeQuery();

			//if there is a user then create a session for him 
			if (result.next()) {
				session.setAttribute("username", result.getString("username"));
				response.sendRedirect("HomePage.jsp");
				
			//no user found in the user table... search the admin table
			} else {
				//do the same thing as above but through the admin users.
				try {
					//Create a SQL statement
					Statement Adminstmt = con.createStatement();

					//Make a SELECT query from the admin table using the inputted username and password
					String AdminLoginQuery = "SELECT * FROM admin Where username=? and password=?";

					//Create a Prepared SQL statement allowing you to introduce the parameters of the query
					PreparedStatement adminPs = con.prepareStatement(AdminLoginQuery);

					//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
					adminPs.setString(1, request.getParameter("Username"));
					adminPs.setString(2, request.getParameter("Password"));

					//Run the query against the database.
					ResultSet adminResult = adminPs.executeQuery();

					//the data was that of an admin. Create a session for them with the proper credentials (isAdmin)
					if (adminResult.next()) {
						if(adminResult.getBoolean("isAdmin")){
							
							session.setAttribute("isAdmin", true);
							session.setAttribute("username", adminResult.getString("username"));
							response.sendRedirect("HomePage.jsp");
						}
						else{
							session.setAttribute("isCRep", true);
							session.setAttribute("username", adminResult.getString("username"));
							response.sendRedirect("HomePage.jsp");
						}
							
					}
					
					//there was no user nor admin with those credentials. Take them to a logout screen.
					else {
						out.print("invalid credentials. Please try again");
						%>
						<form action="Login.jsp">
						<table>
							<tr>
							</tr>
							<tr>
								<td></select>&nbsp;<input type="submit" value="Retry login"></td>
							</tr>
						</table>
					</form>

				</body>
				</html>
				<%
					}
					
				//catch if there are any errors on admin login
				} catch (Exception e) {
					out.print(e);
					out.print("selection failed :()");
				}

			}

			//close the connection.
			con.close();

		//catch if there are any errors on user login
		} catch (Exception e) {
			out.print(e);
			out.print("selection failed :()");
		}
	%>
	