<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="java.util.concurrent.ThreadLocalRandom" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Auction Request</title>
	</head>
	
	<body>
        <%
        try
        {
            ApplicationDB db = new ApplicationDB();	
		    Connection con = db.getConnection();
            Statement stmt = con.createStatement();
            String query =
            "INSERT INTO item(iditem, Seller_Username, Product_Name, Leaderboard, Auction_Leader) " + "VALUES(?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);

            String id = String.valueOf(ThreadLocalRandom.current().nextInt());
            
            ps.setString(1, id);
            ps.setString(2, (String) session.getAttribute("Username"));
            ps.setString(3, request.getParameter("ProductName"));
            ps.setString(4, request.getParameter("MinPrice"));
            ps.setString(5, (String) session.getAttribute("Username"));

            ps.executeUpdate();
            con.close();

            ApplicationDB db = new ApplicationDB();	
		    Connection con = db.getConnection();
            Statement stmt = con.createStatement();
            String query = "INSERT INTO category(type, id) " + "VALUES(?, ?)";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, request.getParameter("Type"));
            ps.setString(2, id);

            ps.executeUpdate();
            con.close();

            out.print("Auction Sucessfully Created");
        }
        catch (Exception e)
        {
			out.print(e);
			out.print("Auction Creation Failed");
		}
        %>

        <form method="get" action="Main.jsp">
            <input type="submit" value="Go Back to Main">
        </form>

        <form method="get" action="Login.jsp">
            <input type="submit" value="Log Out">
        </form>
    </body>
</html>
