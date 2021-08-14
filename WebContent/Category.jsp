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
            String query = "SELECT Product_Name, iditem FROM item WHERE iditem IN (Select categoryid from category where type = ?)";
            PreparedStatement ps = con.prepareStatement(query);
          	
            ps.setString(1, request.getParameter("Type"));
            ResultSet itemList = ps.executeQuery();
            %>
			<table>
			<tr>
			<td>
			<h2>Items from Category <% request.getParameter("Type"); %></h2>
			</td>
			</tr>
			<%while(itemList.next()){
				%>
				<tr>
				<td>
				<%out.print(itemList.getString("Product_Name") + " has ID of " + itemList.getString("Product_Name"));%>
				</td>
				</tr>
				<%
			}
			%>
			</table>
			<%
            con.close();

        }
        catch (Exception e)
        {
			out.print(e);
			out.print("Search results failed unexeptedly");
		}
        %>

        <form method="get" action="HomePage.jsp">
            <input type="submit" value="Go Back to Main">
        </form>

        <form method="get" action="Login.jsp">
            <input type="submit" value="Log Out">
        </form>
    </body>
</html>