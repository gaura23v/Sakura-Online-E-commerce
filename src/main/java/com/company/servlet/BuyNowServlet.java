package com.company.servlet;

import java.io.IOException;

import com.company.DAO.OderItemDAO;
import com.company.Util.Products;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class BuyNowServlet
 */
@WebServlet("/BuyNowServlet")
public class BuyNowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static OderItemDAO  orderItemDAO = new OderItemDAO(); 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyNowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
	      
		String productIdStr = request.getParameter("productId");
	    String quantityStr = request.getParameter("quantity");
	    
	    int UserID = Integer.parseInt(request.getParameter("UserId"));
	    int productId = Integer.parseInt(productIdStr);
	    int quantity = Integer.parseInt(quantityStr);

	    Products product = orderItemDAO.getSingleProductDetails(productId);
	    
	    if (product != null) {
            // Store the product in request scope
            request.setAttribute("product", product);
            
            // Forward to the JSP page (not redirect)
            request.setAttribute("UserID", UserID);
			/*
			 * request.setAttribute("productId", productId);
			 * request.setAttribute("quantity", quantity);
			 */
            
            request.getRequestDispatcher("Checkout-forBuyNow.jsp").forward(request, response);
        } else {
            // Handle product not found
            request.setAttribute("errorMessage", "Product not found with ID: " + UserID);
        }
	    
	    
		/*
		 * double Success = orderItemDAO.getProductPrice(productId);
		 * 
		 * try { OderItemDAO orderDAO = new OderItemDAO(); int orderId =
		 * orderDAO.createSingleProductOrder(UserID, productId, quantity);
		 * 
		 * response.sendRedirect("order-success.jsp?orderId=" + orderId); } catch
		 * (Exception e) { e.printStackTrace();
		 * response.getWriter().write("Error placing order."); }
		 */
		
		System.out.println("productId: "+productId+" "+ "quantity: "+quantity+" "+ "UserID: "+ UserID);
	}

}
