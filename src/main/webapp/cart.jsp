<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.company.Util.Products" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html>
<head>
    <title>Your Cart</title>
    <link rel="stylesheet" type="text/css" href="CSSfiles/cart.css">
</head>
<body>
<div class="cart-container">

	 <div class="header">
			<div>
				<h2>Your Shopping Cart</h2>
			</div>
			
			<div class="item-details">
				<button type="button" ><a href="MainPage.jsp">Back to Home</a></button>
			</div>
	  </div>  
    
    

    <%
        HttpSession session1 = request.getSession(false);
        if (session1 == null || session1.getAttribute("UserID") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<Products> cartItems = (List<Products>) request.getAttribute("cartItems");
        double grandTotal = 0;

        if (cartItems != null && !cartItems.isEmpty()) {
            for (Products product : cartItems) {
                double itemTotal = product.getPrice() * product.getQuantity();
                grandTotal += itemTotal;
    %>
    <div class="cart-item">
        <img src="images/<%= product.getPath() %>" alt="<%= product.getName() %>">
        <div class="item-details">
            <h3><%= product.getName() %></h3>
            <p>Price: ₹<%= product.getPrice() %></p>
            <p>Item Total: ₹<%= itemTotal %></p>

            <form action="update-cart" method="post" style="display:inline-block;">
                <input type="hidden" name="productId" value="<%= product.getId() %>">
                <label>Quantity:</label>
                <input type="number" name="quantity" value="<%= product.getQuantity() %>" min="1">
                <button type="submit">Update</button>
            </form>

            <form action="remove-from-cart" method="post" style="display:inline-block;">
                <input type="hidden" name="productId" value="<%= product.getId() %>">
                <button type="submit" class="remove-button">Remove</button>
            </form>
        </div>
    </div>
    <% 
            }
    %>

    <div class="cart-total">
        <h3>Total: ₹<%= grandTotal %></h3>
        <form action="Cart-Checkout" method="post">
            <button type="submit">Proceed To Order</button>
        </form>
    </div>

    <% 
        } else { 
    %>
        <p>Your cart is empty.</p>
    <% 
        } 
    %>
</div>
</body>
</html>
