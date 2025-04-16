<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Checkout</title>
<link rel="stylesheet" type="text/css" href="CSSfiles/checkout.css">
</head>
<body>
	<div class="checkout-container">
		<h2>Checkout</h2>

		<%
		HttpSession session1 = request.getSession(false);
		if (session1 != null && session1.getAttribute("UserID") != null) {
			int UserID = (Integer) session1.getAttribute("UserID");
		%>

		<%
		if (request.getAttribute("product") != null) {
			com.company.Util.Products product = (com.company.Util.Products) request.getAttribute("product");
		%>

		<div class="product-box">
			<img src="images/<%=product.getPath()%>" alt="<%=product.getName()%>">
			<div class="product-info">
				<h3><%=product.getName()%></h3>
				<p>
					Price: ₹<span id="price"><%=product.getPrice()%></span>
				</p>

				<form action="PlaceOrder" method="post">
					<label for="quantity">Quantity:</label> 
					<input type="number" id="quantity" name="quantity" value="1" min="1" onchange="updateTotal()"> 
					<input type="hidden" name="productId" value="<%=product.getId()%>">
					<p>
						Total: ₹<span id="total"></span>
					</p>

					<hr>
					<hr>
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
		</div>

		<%
		} else {
		%>
		<p>No product details available.</p>
		<%
		}
		%>

		<%
		} else {
		response.sendRedirect("login.jsp");
		}
		%>

		<script>
			function updateTotal() {
				let price = parseFloat(document.getElementById("price").innerText);
				let qty = parseInt(document.getElementById("quantity").value);
				document.getElementById("total").innerText = (price * qty)
						.toFixed(2);
			}
			window.onload = updateTotal;
		</script>
</body>
</html>
