<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Bid Request</title>
	</head>
	
	<body>
        <%
        try
        {
            ApplicationDB db = new ApplicationDB();	
		    Connection con = db.getConnection();
            Statement stmt = con.createStatement();
            String query = "UPDATE item SET Leaderboard = ?, Auction_Leader = ? WHERE iditem = ?";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, request.getParameter("Bid"));
            ps.setString(2, (String) session.getAttribute("username"));
            ps.setString(3, request.getParameter("ID"));

            ps.executeUpdate();
         
             stmt = con.createStatement();
             query = "INSERT INTO auction_history(i_iditem, i_username, bid) " + "VALUES(?, ?, ?)";
             ps = con.prepareStatement(query);

            ps.setString(1, request.getParameter("ID"));
            ps.setString(2, (String) session.getAttribute("username"));
            ps.setString(3, request.getParameter("Bid"));

            ps.executeUpdate();
            con.close();

            out.print("Bid Request Successful");
        }
        catch (Exception e)
        {
			out.print(e);
			out.print("Bid Request Failed");
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