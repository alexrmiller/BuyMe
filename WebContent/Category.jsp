<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="java.util.concurrent.ThreadLocalRandom" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Search Results</title>
	</head>
	
	<body>
        <%
        try
        {
            ApplicationDB db = new ApplicationDB();	
		        Connection con = db.getConnection();
            Statement stmt = con.createStatement();
            String query = "SELECT Product_Name, iditem FROM category, item WHERE iditem = id, type = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, request.getParameter("Type"));
            out.print(ps.executeUpdate());
            con.close();
            out.print("End of search results");
        }
        catch (Exception e)
        {
			out.print(e);
			out.print("Search results failed unexeptedly");
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
