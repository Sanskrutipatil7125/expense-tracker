package Com.ExpeseApp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;




public class DataBaseConnection {
	public static Connection GetConneciton() throws SQLException, ClassNotFoundException {
		String url = "jdbc:mysql://localhost:3306/college1";
		String user ="root";
		String pass ="root";
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, user, pass);
		return con;
	}
}
