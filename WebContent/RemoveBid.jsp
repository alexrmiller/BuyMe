<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Auction History</title>
</head>

<body>
	<%
		try {
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();
			String query = "SELECT * FROM auction_history Where i_iditem=?";
			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, request.getParameter("ID"));

			ResultSet itemResult = ps.executeQuery();

			%>
			<table>
			<%while(itemResult.next()){
				%>
				<tr>
				<td>
				<%out.print("User: " + itemResult.getString("i_username") + " bid: $"
						+ itemResult.getString("bid") + "\r\n");%>
				</td>
				</tr>
				<%
			}
			%>
			</table>
			<%
			con.close();
		} catch (Exception e) {
			out.print(e);
			out.print("History Request Failed");
		}
	%>

	<form method="get" action="HomePage.jsp">
		<input type="submit" value="Go Back to Main">
	</form>

	<form method="get" action="Login.jsp">
		<input type="submit" value="Logout">
	</form>
</body>
</html>