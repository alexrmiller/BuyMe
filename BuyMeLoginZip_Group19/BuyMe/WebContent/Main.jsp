<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>BuyMe</title>
	</head>
	<body>
	
	<h2>Notifications</h2>
	<p>Check up on interested items</p>
	<form method="get" action="NotificationProcess.jsp">
	</form>
</body>
	<body>
        <form method="get" action="Sell.jsp">
            <h4>Sell an Item!</h4>
            <input type="text" name="ProductName" placeholder="Product Name" required>
            <input type="number" name="MinPrice" placeholder="Min Price" required>

            <input type="radio" name="Type" value="Art" required>
            <label>Art</label>
            <input type="radio" name="Type" value="Cars" required>
            <label>Cars</label>
            <input type="radio" name="Type" value="Electronics" required>
            <label>Electronics</label>

            <input type="submit" value="Sell">
        </form>

        <form method="get" action="Bid.jsp">
            <h4>Bid for an Item!</h4>
            <input type="number" name="ID" placeholder="ID" required>
            <input type="number" name="Bid" placeholder="Bid Amount" required>
            <input type="submit" value="Bid">
        </form>

        <form method="get" action="AuctionHistory.jsp">
            <h4>Item Auction History</h4>
            <input type="number" name="ID" placeholder="ID" required>
            <input type="submit" value="Look at History">
        </form>

        <form method="get" action="Category.jsp">
            <h4>Find an Item!</h4>
            <input type="radio" name="Type" value="Art">
            <label>Art</label>
            <input type="radio" name="Type" value="Cars">
            <label>Cars</label>
            <input type="radio" name="Type" value="Electronics">
            <label>Electronics</label>
            <input type="submit" value="Find">
        </form>

        <form method="get" action="Login.jsp">
            <input type="submit" value="Logout">
        </form>
    </body>
</html>
