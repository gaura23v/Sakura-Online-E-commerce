package com.company.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.company.Util.DBUtil;
import com.company.Util.Products;

public class CartDAO {

	public boolean addToCart(int UserId, int ProductId , int Quantity) {
		
		String CheckProductQuery = " SELECT quantity FROM cart WHERE user_id = ? AND product_id = ?";
		
		boolean success = false;
		
		try(Connection con = DBUtil.getConnection();
			PreparedStatement pstmt = con.prepareStatement(CheckProductQuery)){
			
			pstmt.setInt(1, UserId);
			pstmt.setInt(2, ProductId);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				int newQty = rs.getInt("quantity") + Quantity;
				String Query1 = "UPDATE cart SET quantity = ? WHERE user_id = ? AND product_id = ?";
				PreparedStatement UpdateQty = con.prepareStatement(Query1);
				UpdateQty.setInt(1, newQty);
				UpdateQty.setInt(2,UserId);
				UpdateQty.setInt(3, ProductId);				
				
				success = UpdateQty.executeUpdate() > 0;
			}else {
				
				String Query2 = "INSERT INTO cart (user_id, product_id, quantity) VALUES (?,?,?)";
				PreparedStatement insertprod = con.prepareStatement(Query2);
				insertprod.setInt(1, UserId);
				insertprod.setInt(2, ProductId);
				insertprod.setInt(3, Quantity);
				
				success = insertprod.executeUpdate( ) > 0;
	
			}
			
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return success;
	}

	public List<Products> getCartItems(int userId) {
		List<Products> cartItems = new ArrayList<>();

        String query = "SELECT p.Product_id, p.Product_Name, p.price, p.path, c.quantity " +
                       "FROM cart c " +
                       "JOIN Product_details p ON c.product_id = p.product_id " +
                       "WHERE c.user_id = ?";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement pstmt = con.prepareStatement(query)) {

            pstmt.setInt(1, userId);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Products product = new Products();
                product.setId(rs.getInt("product_id"));
                product.setName(rs.getString("Product_Name"));
                product.setPrice(rs.getDouble("price"));
                product.setPath(rs.getString("path"));  // Adjust if your column is named differently
                product.setQuantity(rs.getInt("quantity"));   // Comes from cart table

                cartItems.add(product);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return cartItems;
	}

	public boolean updateCartQuantity(int userId, int productId, int quantity) {
		String query = "UPDATE cart SET quantity = ? WHERE user_id = ? AND product_id = ?";
	    try (Connection con = DBUtil.getConnection();
	         PreparedStatement stmt = con.prepareStatement(query)) {

	        stmt.setInt(1, quantity);
	        stmt.setInt(2, userId);
	        stmt.setInt(3, productId);

	        return stmt.executeUpdate() > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return false;
		
	}
	
	
	public boolean removeFromCart(int userId, int productId) {
	    String query = "DELETE FROM cart WHERE user_id = ? AND product_id = ?";
	    try (Connection con = DBUtil.getConnection();
	         PreparedStatement stmt = con.prepareStatement(query)) {

	        stmt.setInt(1, userId);
	        stmt.setInt(2, productId);

	        return stmt.executeUpdate() > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return false;
	}
	
	
	
}
