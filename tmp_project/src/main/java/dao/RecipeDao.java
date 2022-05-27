package dao;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;

import dto.recipelist;
import dto.cartlist;
import dto.foodprice;
public class RecipeDao {
	private static RecipeDao rd = new RecipeDao();
	
	public static RecipeDao getDao() {
		return rd;
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
	
	public void addCartIcon(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<foodprice> fp = (ArrayList<foodprice>)request.getAttribute("foodprice");
		String id = request.getParameter("id");
		Connection dbconn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		HttpSession session = request.getSession();
		if (session.getAttribute("myCart") == null) {
			ArrayList<cartlist> al = new ArrayList<cartlist>();
			session.setAttribute("myCart", al);
		}
		
		try {
			dbconn = conn();
			String sql = "select * from recipe where r_id=?";
			pstmt = dbconn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			cartlist cl = new cartlist();
			if (rs.next()) {
				String name = rs.getString("r_name");
				String r_foods = rs.getString("r_product");
				String r_foodnum = rs.getString("r_unit");
				String file = rs.getString("r_img");
				String[] foods = r_foods.split(",");
				String[] foodnum = r_foodnum.split(",");
				String[] foodprice = new String[foods.length];
				
				for (int i = 0; i < foods.length; i++) {
					for (int j = 0; j < fp.size(); j++) {
						foodprice fpdto = fp.get(j);
						if(fpdto.getF_name().equals(foods[i])) {
							foodprice[i] = String.valueOf(fpdto.getF_price());
							break;
						}
					} 
				}
				cl.setFoodName(name);
				cl.setFoods(foods);
				cl.setFoodunit(foodnum);
				cl.setFoodprice(foodprice);
				cl.setFilename(file);
				ArrayList<cartlist> al = (ArrayList<cartlist>)session.getAttribute("myCart");
				al.add(cl);	
			}

		}
		catch(Exception e) {
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
			}
			catch(Exception e) {
				e.printStackTrace();
			}
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
			ArrayList<foodprice> foodprice = new ArrayList<foodprice>(); 
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
}
