package com.company.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.company.DAO.OderItemDAO;
import com.company.Util.Products;

/**
 * Servlet implementation class PlaceOrder
 */
@WebServlet("/PlaceOrder")
public class PlaceOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static OderItemDAO  orderItemDAO = new OderItemDAO();    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlaceOrder() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		String productIdStr = request.getParameter("productId");
		int productId = Integer.parseInt(productIdStr);
		
		String quantityStr = request.getParameter("quantity");
		int quantity = Integer.parseInt(quantityStr);
		
		System.out.println("In place-Order productId: "+productId+" quantity: "+quantity);
		
		String fullName = request.getParameter("fullname");
		String mobile = request.getParameter("mobile");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String pincode = request.getParameter("pincode");
		
		Products product = orderItemDAO.getSingleProductDetails(productId);
	    if (product != null) {
	    	
	    	int Price = (int) product.getPrice();
	    	double totalPrice = Price * quantity;
	    	System.out.println("\n"+productId+"\n "+quantity+"\n "+totalPrice+"\n " +mobile +" \n"+ address+" \n"+ city+" \n"+ state+"\n "+ pincode+"\n ");
            // Store the product in request scope
            request.setAttribute("product", product);
            request.setAttribute("fullName", fullName);
            request.setAttribute("mobile", mobile);
            request.setAttribute("address", address);
            request.setAttribute("city", city);
            request.setAttribute("state", state);
            request.setAttribute("pincode", pincode);
            request.setAttribute("totalAmount", totalPrice);
            // Forward to the JSP page (not redirect)
            //int UserID = (Integer) session.getAttribute("UserID");
            
            request.getRequestDispatcher("conformation.jsp").forward(request, response);
        } else {
            // Handle product not found
           // request.setAttribute("errorMessage", "Product not found with ID: " + UserID);
        	System.out.println("Somthing Went Wrong");
        }
		
	}

}
