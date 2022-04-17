package com.registerExample;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * @author Pandi
 */

public class LoginValidate {

	public boolean validateUserLogin(String contact, String pwd) {
		boolean flag = false;
		Connection con = null;
		try {
			RegisterValidate regObj = new RegisterValidate();
			con = regObj.createConnection();
			if (con != null) {
				Statement stat = con.createStatement();
				String qry = "SELECT * FROM personal_details WHERE contactno = '" + contact + "' AND password = '" + pwd
						+ "' ";
				//String qry = "SELECT * FROM personal_details WHERE contactno = '" + contact + "' ";
				ResultSet rs = stat.executeQuery(qry);
				if (rs.next()) {
					flag = true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return flag;
	}

}
