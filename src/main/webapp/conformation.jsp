<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.company.Util.Products" %>

<!DOCTYPE html>
<html>
<head>
    <title>Order Confirmation</title>
    <link rel="stylesheet" type="text/css" href="CSSfiles/conformation.css">
    
    <style>
  #message {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-40%, 400%);
    padding: 20px;
    background-color: white;
    border: 1px solid black;
    z-index: 100;
    color: Green;
  }
</style>
</head>
<body>
<div class="confirmation-container">

    <h2>Review Your Order</h2>

    <%
        Products product = (Products) request.getAttribute("product");
    
        String fullName = (String) request.getAttribute("fullName");
        String mobile = (String) request.getAttribute("mobile");
        String address = (String) request.getAttribute("address");
        String city = (String) request.getAttribute("city");
        String state = (String) request.getAttribute("state");
        String pincode = (String) request.getAttribute("pincode");
        
        double total = (Double) request.getAttribute("totalAmount");
    %>

    <div class="product-img">
        <img src="images/<%= product.getPath() %>" alt="<%= product.getName() %>">
    </div>

    <div class="summary-box">
        <h3>Product: <%= product.getName() %></h3>
        <p>Total Payable: ₹<strong><%= total %></strong></p>

        <h4>Shipping To:</h4>
        <p><%= fullName %></p>
        <p><%= mobile %></p>
        <p><%= address %>, <%= city %>, <%= state %> - <%= pincode %></p>

         <form onsubmit="handleConfirm(event)">
		    <button type="submit" id="myButton" class="order-button">Confirm Order</button>
		    <button type="submit" class="order-button" ><a href="MainPage.jsp">Back to Home</a></button>
		    <div id="message" style="display: none;"></div>
		 </form>
		        
    </div>

<!--     <div id="success-msg" class="hidden">🎉 Order Successfully Placed!</div>  -->

</div>

<script>
    function handleConfirm(event) {
        event.preventDefault(); // Prevent form submission

        const messageBox = document.getElementById('message');
        messageBox.innerHTML = '🎉 Order Placed Successfully!';
        messageBox.style.display = 'block';
    }
</script>
</body>
</html>
