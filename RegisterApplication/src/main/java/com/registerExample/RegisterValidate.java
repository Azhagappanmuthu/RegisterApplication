package com.registerExample;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class RegisterValidate {

	public boolean validateUserRegister(String uname, String pwd, String addrs, String contact) {
		boolean flag = false;
		Connection con = null;
		try {
			con = createConnection();
			if (con != null) {
				
				Statement stat = con.createStatement();
				String qry = "SELECT * FROM personal_details WHERE contact = '" + contact + "' ";
				ResultSet rs = stat.executeQuery(qry);
				if (rs.next()) {
					flag = false;
				} else {
					PreparedStatement st = con.prepareStatement(
							"INSERT INTO personal_details (name, password, address, contactno) VALUES (?, ?, ?, ?)");
					st.setString(1, uname);
					st.setString(2, pwd);
					st.setString(3, addrs);
					st.setString(4, contact);
					st.executeUpdate();
					st.close();

					con.close();
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

	public Connection createConnection() {
		System.out.println("Create postgres DataBase Connection");
		Connection connection = null;

		try {

			// Provide database Driver according to your database
			Class.forName("org.postgresql.Driver");

			// Provide URL, database and credentials according to your database
			connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Register", "postgres",
					"postgres");

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		if (connection != null) {
			System.out.println("Connection created successfully....");
		}
		return connection;
	}

}
