package control;

import java.io.IOException;
import java.sql.*;

import dto.foodprice;
import dto.recipelist;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;

import dao.RecipeDao;

public class RecipeController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String context_p = request.getContextPath();
		String command = uri.substring(context_p.length());
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		if (command.equals("/recipe/recipes.re")) {
			recipes(request);
			price(request);
			count(request);
			RequestDispatcher rd = request.getRequestDispatcher("/recipe/recipes.jsp");
			rd.forward(request, response);
		}
		else if (command.equals("/recipe/recipe.re")) {
			sel_recipe(request);
			price(request);
			RequestDispatcher rd = request.getRequestDispatcher("/recipe/recipe.jsp");
			rd.forward(request, response);
		}
	}
	public void sel_recipe(HttpServletRequest request) {
		Connection dbconn = null;
		String sql = "select * from recipe where r_id=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int id = Integer.parseInt(request.getParameter("id"));
		try {
			dbconn = conn();
			pstmt = dbconn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			recipelist rp = new recipelist();
			if (rs.next()) {
				rp.setR_id(rs.getInt("r_id"));
				rp.setR_category(rs.getString("r_category"));
				rp.setR_name(rs.getString("r_name"));
				rp.setR_desc(rs.getString("r_desc"));
				rp.setR_product(rs.getString("r_product"));
				rp.setR_unit(rs.getString("r_unit"));
				rp.setR_tip(rs.getString("r_tip"));
				rp.setR_img(rs.getString("r_img"));
			}
			request.setAttribute("sel_recipe", rp);
		} catch (Exception e) {
			// TODO: handle exception
		}
		finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (dbconn != null) {
					dbconn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	public void count(HttpServletRequest request) {
		Connection dbconn = null;
		String sql = "select count(*) from recipe";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			dbconn = conn();
			pstmt = dbconn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			request.setAttribute("cnt", count);
		} catch (Exception e) {
			// TODO: handle exception
		}
		finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (dbconn != null) {
					dbconn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public void recipes(HttpServletRequest request) {

		
		int page = Integer.valueOf(request.getParameter("page"));
		int min = (page-1)*20;
		int max = page*20;
		Connection dbconn = null;
		String sql = "select * from recipe where r_id >= ? order by r_id desc limit "+max;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			dbconn = conn();
			pstmt = dbconn.prepareStatement(sql);
			pstmt.setInt(1, min);
			rs = pstmt.executeQuery();
			ArrayList<recipelist> fl = new ArrayList<recipelist>();
			for (int i = 0; i <= 20; i++) {
				if(rs.next()) {
					recipelist rp = new recipelist();
					rp.setR_id(rs.getInt("r_id"));
					rp.setR_category(rs.getString("r_category"));
					rp.setR_name(rs.getString("r_name"));
					rp.setR_desc(rs.getString("r_desc"));
					rp.setR_product(rs.getString("r_product"));
					rp.setR_unit(rs.getString("r_unit"));
					rp.setR_tip(rs.getString("r_tip"));
					rp.setR_img(rs.getString("r_img"));
					fl.add(rp);				
				}
			}
			request.setAttribute("food", fl);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (dbconn != null) {
					dbconn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	public void price(HttpServletRequest request) {
		Connection dbconn = null;
		String sql = "select * from foodlist";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			dbconn = conn();
			pstmt = dbconn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			ArrayList<foodprice> foodprice = RecipeDao.getFoodprice();
			while (rs.next()) {
				foodprice fp = new foodprice();
				fp.setF_name(rs.getString("f_name"));
				fp.setF_price(rs.getInt("f_price"));
				foodprice.add(fp);				
			}
			request.setAttribute("foodprice", foodprice);
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (dbconn != null) {
					dbconn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
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
