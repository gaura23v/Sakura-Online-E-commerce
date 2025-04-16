package com.company.servlet;

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
 * Servlet implementation class CartServlet
 */
@WebServlet("/view-cart")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);

		if (session != null && session.getAttribute("UserID") != null) {
			int userId = (Integer) session.getAttribute("UserID");
				System.out.println(userId+" In the CartServlet");
			CartDAO cartDAO = new CartDAO();
			List<Products> cartItems = cartDAO.getCartItems(userId);

			request.setAttribute("cartItems", cartItems);
			request.getRequestDispatcher("cart.jsp").forward(request, response);
		} else {
			response.sendRedirect("login.jsp");
		}
	}


}
