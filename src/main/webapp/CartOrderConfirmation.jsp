<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.company.Util.Products" %>

<!DOCTYPE html>
<html>
<head>
    <title>Order Confirmation</title>
    <link rel="stylesheet" type="text/css" href="CSSfiles/Cartconfirmation.css">
    <style>
        #message {
            position: absolute;
            top: 150%;
            left: 50%;
            transform: translate(-40%, 400%);
            padding: 20px;
            background-color: white;
            border: 1px solid black;
            z-index: 100;
            color: green;
        }
    </style>
</head>
<body>
    <div class="confirmation-container">
    
        <h2>Review Your Order</h2>

        <%
            List<Products> orderedItems = (List<Products>) request.getAttribute("orderedItems");
            Products product = (Products) request.getAttribute("product"); // for single product

            String fullName = (String) request.getAttribute("fullName");
            String mobile = (String) request.getAttribute("mobile");
            String address = (String) request.getAttribute("address");
            String city = (String) request.getAttribute("city");
            String state = (String) request.getAttribute("state");
            String pincode = (String) request.getAttribute("pincode");

            double total = (Double) request.getAttribute("totalAmount");

            if (orderedItems != null) {
                for (Products item : orderedItems) {
        %>
        <div class="product-img">
            <img src="images/<%= item.getPath() %>" alt="<%= item.getName() %>">
            <h3><%= item.getName() %> (x<%= item.getQuantity() %>)</h3>
        </div>
        <% } } else if (product != null) { %>
        <div class="product-img">
            <img src="images/<%= product.getPath() %>" alt="<%= product.getName() %>">
            <h3><%= product.getName() %></h3>
        </div>
        <% } %>

        <div class="summary-box">
            <p>Total Payable: ₹<strong><%= total %></strong></p>
            <h4>Shipping To:</h4>
            <p><%= fullName %></p>
            <p><%= mobile %></p>
            <p><%= address %>, <%= city %>, <%= state %> - <%= pincode %></p>

            <form onsubmit="handleConfirm(event)">
                <button type="submit" class="order-button">Confirm Order</button>
                <button type="button" class="order-button"><a href="MainPage.jsp">Back to Home</a></button>
                <div id="message" style="display: none;"></div>
            </form>
        </div>
    </div>

    <script>
        function handleConfirm(event) {
            event.preventDefault();
            document.getElementById('message').innerHTML = '🎉 Order Placed Successfully!';
            document.getElementById('message').style.display = 'block';
        }
    </script>
</body>
</html>
