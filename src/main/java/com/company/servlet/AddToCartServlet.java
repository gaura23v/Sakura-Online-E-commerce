package com.company.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.company.DAO.CartDAO;
import com.company.DAO.ProductDAO;
import com.company.Util.Products;

/**
 * Servlet implementation class AddToCartServlet
 */
@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static CartDAO cartDAO = new CartDAO() ;  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		int UserId =Integer.parseInt( request.getParameter("UserId"));
		int ProductId =Integer.parseInt(request.getParameter("productId"));
		
		boolean success = cartDAO.addToCart(UserId, ProductId, 1);
	
		if(success) {
			
			if (session != null && session.getAttribute("UserID") != null) {
				int userId = (Integer) session.getAttribute("UserID");
					System.out.println(userId+" In the CartServlet");
				CartDAO cartDAO = new CartDAO();
				List<Products> cartItems = cartDAO.getCartItems(userId);

				request.setAttribute("cartItems", cartItems);
				request.getRequestDispatcher("cart.jsp").forward(request, response);
			} 
			
			
			//response.sendRedirect("cart.jsp");
		}else {
			System.out.println("Product Not Added To Cart");
			response.getWriter().write("Failed to add to cart.");
		}
	}

}
