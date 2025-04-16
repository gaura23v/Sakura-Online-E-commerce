<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.company.Util.Products" %>

<!DOCTYPE html>
<html>
<head>
    <title>Cart Checkout</title>
    <link rel="stylesheet" type="text/css" href="CSSfiles/checkout.css">
</head>
<body>
    <div class="checkout-container">
        <h2>Cart Checkout</h2>

        <form action="Place-Order" method="post">
            <%
                List<Products> cartItems = (List<Products>) request.getAttribute("cartItems");
                double totalAmount = 0;
                for (Products item : cartItems) {
                    totalAmount += item.getPrice() * item.getQuantity();
            %>
            <div class="product-box">
                <img src="images/<%= item.getPath() %>" alt="<%= item.getName() %>">
                <div class="product-info">
                    <h3><%= item.getName() %></h3>
                    <p>Quantity: <%= item.getQuantity() %></p>
                    <p>Price: ₹<%= item.getPrice() %></p>
                </div>
            </div>
            <input type="hidden" name="productIds" value="<%= item.getId() %>">
            <input type="hidden" name="quantities" value="<%= item.getQuantity() %>">
            <% } %>

            <p><strong>Total Payable: ₹<%= totalAmount %></strong></p>

            <h4>Shipping Details</h4>
            <div class="shipping-details">
                <div class="input-group">
                    <label for="name">Full Name:</label> 
                    <input type="text" id="name" name="fullname" required>
                </div>
                <div class="input-group">
                    <label for="mobile">Mobile Number:</label> 
                    <input type="text" id="mobile" name="mobile" required>
                </div>
                <div class="input-group full-width">
                    <label for="address">Address:</label>
                    <textarea id="address" name="address" required></textarea>
                </div>
                <div class="input-group">
                    <label for="city">City:</label> 
                    <input type="text" id="city" name="city" required>
                </div>
                <div class="input-group">
                    <label for="state">State:</label> 
                    <input type="text" id="state" name="state" required>
                </div>
                <div class="input-group">
                    <label for="pincode">Pincode:</label> 
                    <input type="text" id="pincode" name="pincode" required>
                </div>
            </div>
            <button type="submit">Place Order</button>
        </form>
    </div>
</body>
</html>
