<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Details</title>
<link rel="stylesheet" href="CSSfiles/ProductDetailsStylesheet.css">
</head>
<body>
	<h1>Product Details</h1>

	<div class="container">

		<%
		//retrive the session Object
		HttpSession session1 = request.getSession(false);

		//check if the session is not null nad also Username is Notnull
		if (session1 != null && session1.getAttribute("UserID") != null) {
			int UserID = (Integer) session1.getAttribute("UserID");
		%>

		<%
		if (request.getAttribute("product") != null) {
		%>
		<%
		com.company.Util.Products product = (com.company.Util.Products) request.getAttribute("product");
		%>

		<div class="product-details">
			<!-- Left side - Product Image -->
			<div class="product-image">
				<img src="images/<%=product.getPath()%>"
					alt="<%=product.getName()%>">
			</div>

			<!-- Right side - Product Information -->
			<div class="product-info">
				<h2 class="product-name"><%=product.getName()%></h2>
				<p class="price">
					Rs.
					<%=product.getPrice()%></p>

				<h3 class="details-header">Details</h3>
				<div class="details-content">
					<%=product.getDescription()%>
				</div>

				<!-- <div class="quantity-container">
					<label for="quantity">Quantity</label> <input type="number"
						id="quantity" class="quantity-input" value="1" min="1">
				</div> -->

				<div class="button-container">
					<form action="BuyNowServlet" method="post" >
						<input type="hidden" name="UserId" value="<%=UserID%>">
						<input type="hidden" name="productId" value="<%=product.getId()%>">
						<input type="hidden" name="quantity" class="hidden-quantity" value="1">
						<button type="submit" class="buy-now">Buy Now</button>
					</form>

					<form action="AddToCartServlet" method="post">
						<input type="hidden" name="UserId" value="<%=UserID%>">
						<input type="hidden" name="productId" value="<%=product.getId()%>"> 
						<input type="hidden" name="quantity" class="hidden-quantity" value="1">
						<button type="submit" class="add-to-cart">Add To Cart</button>
					</form>
				</div>
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
		//redirect to login page
		response.sendRedirect("login.jsp");
		}
		%>
	</div>
</body>
</html>