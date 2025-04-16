package com.company.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.company.Util.DBUtil;
import com.company.Util.Products;

public class ProductDAO {

	public static Products getProductById(int productId) {
		String query = " SELECT price, Product_Name, Path FROM product_details WHERE Product_id = ?";
		 
		 try(Connection con = DBUtil.getConnection();
			  PreparedStatement pstmt = con.prepareStatement(query)){
			 
			 pstmt.setInt(1, productId);
			 ResultSet rs = pstmt.executeQuery();
			 
			 if(rs.next()) {
				 Products product = new Products();
				 product.setId(productId);
				 product.setPrice(rs.getDouble("price"));
				 product.setName(rs.getString("Product_Name"));
				 product.setPath(rs.getString("Path"));
				 
				 
				System.out.println("SingleProductDetails details set"); 
				return product;
			 }
			 
		 }catch(Exception e){
			 System.out.println(e.getMessage());
		 }
		return null;
	}

}
