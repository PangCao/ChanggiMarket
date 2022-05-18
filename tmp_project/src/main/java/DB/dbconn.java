package DB;
import java.sql.*;

public class dbconn {

		Connection conn = null;

	public Connection conn() throws ClassNotFoundException {
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
	
	public void connClose() {
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
