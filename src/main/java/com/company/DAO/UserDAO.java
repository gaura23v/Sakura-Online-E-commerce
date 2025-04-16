package com.company.DAO;

import com.company.Util.Products;
import com.company.Util.User;

public interface UserDAO {
	boolean isValidUser(String username, String password);
	boolean registerData(User user);
	Products viewDetails(int id);
	int getUserId(String username, String Pass);
}
