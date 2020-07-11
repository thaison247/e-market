package DB;

import java.sql.*;

public class DBConnection {
	public static Connection createConnection() throws ClassNotFoundException{
		Connection conn = null;
		
		String url = "jdbc:mysql://localhost:3306/market?useUnicode=true&characterEncoding=utf-8";
		String username = "root";
		String password = "1712730";
		
		// load driver
		Class.forName("com.mysql.jdbc.Driver");
		
		try {
			//connect to database
			conn = DriverManager.getConnection(url,username,password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return conn;
	}
}
