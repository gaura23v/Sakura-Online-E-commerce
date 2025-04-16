package com.company.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.company.DAO.UserDAOImp;
import com.company.Util.Products;

/**
 * Servlet implementation class ProductDetails
 */
@WebServlet("/ProductDetails")
public class ProductDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static UserDAOImp userDAO = new UserDAOImp();   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDetails() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idParam = request.getParameter("viewDetails");
        int id = Integer.parseInt(idParam);
        
        // Get the product details
        Products product = userDAO.viewDetails(id);
        
        System.out.println("Id of product is = " + id); 
        
        if (product != null) {
            // Store the product in request scope
            request.setAttribute("product", product);
            
            // Forward to the JSP page (not redirect)
            request.getRequestDispatcher("product-details.jsp").forward(request, response);
        } else {
            // Handle product not found
            request.setAttribute("errorMessage", "Product not found with ID: " + id);
            //request.getRequestDispatcher("error.jsp").forward(request, response);
        }
	}

}
