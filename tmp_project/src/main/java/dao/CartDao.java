package dao;
import dto.cartlist;
import dto.foodprice;
import dto.recipelist;
import DB.dbconn;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;


public class CartDao {
	
	private CartDao() {};
	private static CartDao dao = new CartDao();
	public static CartDao getDao() {
		return  dao;
	}
	
	public void addCartIcon(HttpServletRequest request) {
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
				e.printStackTrace();
			}
		}
	}
	
	public void addCart(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("myCart") == null) {
			ArrayList<cartlist> al = new ArrayList<cartlist>();
			session.setAttribute("myCart", al);
		}
		cartlist cl = new cartlist();
		String name = request.getParameter("name");
		int len = Integer.parseInt(request.getParameter("len"));
		String[] foods = new String[len];
		String[] foodnum = new String[len];
		String[] foodprice = new String[len];
		String file = request.getParameter("file");
		for (int i = 0; i < len; i++) {
			foods[i] = request.getParameter("foods"+i);
			foodnum[i] = request.getParameter("foodnum"+i);
			foodprice[i] = request.getParameter("foodprice"+i);
		}
		cl.setFoodName(name);
		cl.setFoods(foods);
		cl.setFoodunit(foodnum);
		cl.setFoodprice(foodprice);
		cl.setFilename(file);
		ArrayList<cartlist> al = (ArrayList<cartlist>)session.getAttribute("myCart");
		al.add(cl);
	}
	
	public void order(HttpServletRequest request) {
		HttpSession session = request.getSession();	
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String date = format.format(Calendar.getInstance().getTime());
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String c_id = (String)session.getAttribute("userid");
		String foodlen  = request.getParameter("foodlen");
		String[] singfoodlen = new String[Integer.valueOf(foodlen)];
		String[] foodimg = new String[Integer.valueOf(foodlen)];
		String[] foodname = new String[Integer.valueOf(foodlen)];
		String[] singfoodname = new String[Integer.valueOf(foodlen)];
		String[] singfoodprice = new String[Integer.valueOf(foodlen)];
		String[] singfoodunit = new String[Integer.valueOf(foodlen)];
		String cusaddr = request.getParameter("cusaddr");
		String totalsum = request.getParameter("totalsum");
		String shipprice = request.getParameter("shipprice");
		for (int i = 0; i < Integer.valueOf(foodlen); i++) {
			singfoodlen[i] = request.getParameter("singfoodlen"+i);
			foodimg[i] = request.getParameter("foodimg"+i);
			foodname[i] = request.getParameter("foodname"+i);
		}
		for (int j = 0; j < Integer.valueOf(foodlen); j++) {
			int x = Integer.valueOf(singfoodlen[j]);
			for (int y = 0; y < x; y++) {
				if (y == 0) {
					singfoodname[j] = request.getParameter("singfoodname"+j+y);
					singfoodprice[j] = request.getParameter("foodprice"+j+y);
					singfoodunit[j] = request.getParameter("foodunit"+j+y);
				}
				else {
					singfoodname[j] += ","+request.getParameter("singfoodname"+j+y);
					singfoodprice[j] += ","+request.getParameter("foodprice"+j+y);
					singfoodunit[j] += ","+request.getParameter("foodunit"+j+y);
				}
			}
		}
		try {
			conn = conn();
			String sql = "insert into cusorder (o_date, o_id, o_f_name, o_f_img, o_f_singname, o_f_singprice, o_f_singunit, o_addr) values (?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			for (int t = 0; t < Integer.valueOf(foodlen); t++) {
				pstmt.setString(1, date);
				pstmt.setString(2, c_id);
				pstmt.setString(3, foodname[t]);
				pstmt.setString(4, foodimg[t]);
				pstmt.setString(5, singfoodname[t]);
				pstmt.setString(6, singfoodprice[t]);
				pstmt.setString(7, singfoodunit[t]);
				pstmt.setString(8, cusaddr);
				pstmt.addBatch();
				pstmt.clearParameters();
			}
			pstmt.executeBatch();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			
				try {
					if (pstmt != null) {
						pstmt.close();
					}
					if (conn != null) {
						conn.close();
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			
			session.removeAttribute("myCart");
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
