package com.company.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.company.Util.DBUtil;
import com.company.Util.Products;
import com.company.Util.User;

public class UserDAOImp {
public boolean isValidUser(String username, String password) {
		
		String query = "SELECT * FROM users WHERE Username=? AND Password=?";
		try(Connection con = DBUtil.getConnection();
			PreparedStatement pstmt = con.prepareStatement(query)){
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			
			ResultSet resultSet = pstmt.executeQuery();
			System.out.println("result data send");
			boolean result = resultSet.next();
			System.out.println(result);
			return result;
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	
	
	
	public boolean registerData(User user) {
		System.out.println("F1");
		String query = "INSERT INTO users(Username,Password,Email) VALUES(?,?,?)";
		try(Connection con = DBUtil.getConnection();
			PreparedStatement pstmt = con.prepareStatement(query)){
			
			System.out.println("F2"+" "+user.getUsername()+" "+user.getPassword() +" "+user.getEmail());
			pstmt.setString(1, user.getUsername());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getEmail());
			
			System.out.println("F3");
		    int rows = pstmt.executeUpdate();
		    System.out.println("data Entered Successfully");
			
			return rows>0;
		} catch (Exception e) {
			System.out.println("Entery Failed");
			System.out.println(e.getMessage());
			return false;
		}
		
	}
	
	
	public Products viewDetails(int id) {
        String query = "SELECT Product_Name, Path, Price, Description FROM product_details WHERE Product_id = ?";
        
        try(Connection con = DBUtil.getConnection();
            PreparedStatement pstmt = con.prepareStatement(query)) {
            
            pstmt.setInt(1, id);
            ResultSet resultSet = pstmt.executeQuery();
            
            if(resultSet.next()) {
                Products product = new Products();
                product.setId(id);
                product.setName(resultSet.getString("Product_Name"));
                product.setPath(resultSet.getString("Path"));
                product.setPrice(resultSet.getDouble("Price"));
                product.setDescription(resultSet.getString("Description"));
                
                System.out.println("result data retrieved");
                return product;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return null;
    }
	
	
	public int getUserId(String username, String Pass) {
		int Id = 0;
 		String query = "SELECT User_id FROM Users WHERE Username = ? AND Password = ?";
		try(Connection con = DBUtil.getConnection();
	        PreparedStatement pstmt = con.prepareStatement(query)){
			pstmt.setString(1, username);
			pstmt.setString(2, Pass);
            ResultSet resultSet = pstmt.executeQuery();
            
            if(resultSet.next()) {
            	Id = resultSet.getInt("User_id");
            }
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println("Id of the user = "+Id);
		return Id;
	}
}
