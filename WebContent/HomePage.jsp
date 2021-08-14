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
	
	<%//TO DO: invalidate when logging out %>
	<h2>Welcome to BuyMe!</h2>
	<p>choose what you'd like to do</p>
	
	<%
	//Admin section of the home page
	if((Boolean)session.getAttribute("isAdmin")){
		%>
		
		<form action="Login.jsp">
		<table>
		<tr>
		<td>
		</select>&nbsp;<br> <input type="submit" value="Logout"> 	
		</td>
		</tr>
		</table>
		</form>
		
		<form method="get" name="GenerateReports" action="Reports.jsp">
		<table>
		<tr>
		<td>
		</select>&nbsp;<br> <input type="submit" value="Generate report"> 
		</td>
		</tr>
		</table>
		</form>
		
		<form method="get" name="CreateCRep" action="CreateCRep.jsp">
		<table>
		<tr>
		<td>
		</select>&nbsp;<br> <input type="submit" value="Create Customer Rep">
		</td> 
		</tr>
		</table>
		</form>
		
		<%
	}
	//Customer Rep section of the home page
	else if((Boolean)session.getAttribute("isCRep")){
		%>
		
		<form action="Login.jsp">
		<table>
		<tr>
		<td>
		</select>&nbsp;<br> <input type="submit" value="Logout"> 	
		</td>
		</tr>
		</table>
		</form>
		
		<form method="get" name="RemoveBid" action="removeBids.jsp">
		<table>
		<tr>
		<td>
		</select>&nbsp;<br> <input type="submit" value="Remove bid">
		</td> 
		</tr>
		</table>
		</form>
		
		<form action="DeleteUser.jsp">
		<table>
		<tr>
		<td>
		</select>&nbsp;<br> <input type="submit" value="Delete Users"> 	
		</td>
		</tr>
		</table>
		</form>
		
		<form method="get" name="View" action="ViewAdminMessages.jsp">
		<table>
		<tr>
		<td>
		</select>&nbsp;<br> <input type="submit" value="View Messages"> 
		</td>
		</tr>
		</table>
		</form>
		
		<form  method="get" name="ChangePass" action="ChangePassword.jsp">
		<table>
		<tr>
		<td>
		</select>&nbsp;<br> <input type="submit" value="Update User Information"> 
		</td>
		</tr>
		</table>
		</form>
		<%
	}
	
	//Normal User section of the home page
	else{
		%>
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

	<h4>Send an Alert</h4>
	<form method="get" action="Alert.jsp">
            <h4>Find an Item!</h4>
            <input type="radio" name="Type" value="Art">
            <label>Art</label>
            <input type="radio" name="Type" value="Cars">
            <label>Cars</label>
            <input type="radio" name="Type" value="Electronics">
            <label>Electronics</label>
            <input type="submit" value="Notify Me!">
        </form>

		
		
		<form  method="get" name="ViewNotifications" action="UserNotifications.jsp">
		<table>
		<tr>
		<td>
		</select>&nbsp;<br> <input type="submit" value="View Notifications"> 
		</td>
		</tr>
		</table>
		</form>
		
		<form  method="get" name="MessageReps" action="MessageCustomerReps.jsp">
		<table>
		<tr>
		<td>
		</select>&nbsp;<br> <input type="submit" value="Message Customer Reps">
		</td>
		</tr>
		</table>
		</form>
		
		<form action="Login.jsp">
		<table>
		<tr>
		<td>
		</select>&nbsp;<br> <input type="submit" value="Logout"> 	
		</td>
		</tr>
		</table>
		</form>
		
		<%
	}
	%>
	
	

</body>
</html>
