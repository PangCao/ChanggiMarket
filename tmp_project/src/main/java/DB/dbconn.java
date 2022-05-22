package DB;
import java.sql.*;

public class dbconn {

	public static Connection conn = null;

	public static Connection conn() throws ClassNotFoundException {
		String path = "jdbc:mysql://localhost:8080/changgimarket?serverTimezone=Asia/Seoul&useSSL=false";
		String user = "root";
		String pw = "1234";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(path, user, pw);
		}
		catch(SQLException ex) {
			System.out.println(ex.getMessage());
		}
		
		return conn;
	}
	
	public static void connClose(Connection conn) {
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
