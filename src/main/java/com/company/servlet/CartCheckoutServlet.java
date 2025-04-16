package com.company.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.company.DAO.CartDAO;
import com.company.Util.Products;

/**
 * Servlet implementation class CartCheckoutServlet
 */
@WebServlet("/Cart-Checkout")
public class CartCheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartCheckoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("UserID") != null) {
			int userId = (Integer) session.getAttribute("UserID");
				System.out.println(userId+" In the CartServlet");
			CartDAO cartDAO = new CartDAO();
			List<Products> cartItems = cartDAO.getCartItems(userId);

			request.setAttribute("cartItems", cartItems);
			request.getRequestDispatcher("checkout-ForCartItem.jsp").forward(request, response);
        } else {
            response.sendRedirect("view-cart"); // fallback if cart is empty
        }
	}

}
