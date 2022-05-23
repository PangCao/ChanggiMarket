package dao;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import com.mysql.jdbc.Connection;

import dto.recipelist;
import dto.foodprice;
public class RecipeDao {
	private RecipeDao rd = new RecipeDao();
	private static ArrayList<recipelist> foodlist = new ArrayList<recipelist>();
	
	public static ArrayList<recipelist> getFoodlist() {
		return foodlist;
	}
	private static ArrayList<foodprice> foodprice = new ArrayList<foodprice>();
	
	public static ArrayList<foodprice> getFoodprice() {
		return foodprice;
	} 
	public Connection conn() {
		Connection conn = null;
		String url = "jdbc:mysql://localhost:3306/changgimarket?ServerTimezone=Asia/Seoul&useSSL=false";
		String user = "root";
		String pw = "1234";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = (Connection) DriverManager.getConnection(url, user, pw);
		} catch (Exception e) {
			e.getMessage();
		}
		return conn;
	}
}
