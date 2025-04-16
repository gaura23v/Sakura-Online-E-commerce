package com.company.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.company.DAO.ProductDAO;
import com.company.Util.Products;

/**
 * Servlet implementation class PlaceCartOrderServlet
 */
@WebServlet("/Place-Order")
public class PlaceCartOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlaceCartOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fullName = request.getParameter("fullname");
        String mobile = request.getParameter("mobile");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String pincode = request.getParameter("pincode");

        String[] productIds = request.getParameterValues("productIds");
        String[] quantities = request.getParameterValues("quantities");

        List<Products> orderedItems = new ArrayList<>();
        double totalAmount = 0;

        for (int i = 0; i < productIds.length; i++) {
            int id = Integer.parseInt(productIds[i]);
            int qty = Integer.parseInt(quantities[i]);
            Products product = ProductDAO.getProductById(id); // assuming this exists
            product.setQuantity(qty);
            orderedItems.add(product);
            totalAmount += product.getPrice() * qty;
        }

        request.setAttribute("orderedItems", orderedItems);
        request.setAttribute("fullName", fullName);
        request.setAttribute("mobile", mobile);
        request.setAttribute("address", address);
        request.setAttribute("city", city);
        request.setAttribute("state", state);
        request.setAttribute("pincode", pincode);
        request.setAttribute("totalAmount", totalAmount);

        RequestDispatcher dispatcher = request.getRequestDispatcher("CartOrderConfirmation.jsp");
        dispatcher.forward(request, response);
	}

}
