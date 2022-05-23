package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import dto.customer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;

public class LoginController extends HttpServlet{
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
		
		if (command.equals("/login/signup.lo")) {
			signup(request);
			RequestDispatcher rd = request.getRequestDispatcher("/login/login.jsp");
			rd.forward(request, response);
		}
		else if (command.equals("/login/seller_signup.lo")) {
			seller_signup(request);
			RequestDispatcher rd = request.getRequestDispatcher("/login/login.jsp");
			rd.forward(request, response);
		}
		else if (command.equals("/login/login.lo")) {
			boolean ans = login(request);
			if(ans) {
				RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
				rd.forward(request, response);
			}
			else {
				response.sendRedirect("/tmp_project/login/login.jsp?error=1");
			}
		}
		else if (command.equals("/login/idchk.lo")) {
			
		}
	}

	public int checkId(HttpServletRequest request) {
		Connection dbconn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String id = request.getParameter("id");
		int re_idchk = 2;
		
		try {
			String sql = "select * from seller where s_id=?";
			pstmt = dbconn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				re_idchk = 1;
			}
			else {
				re_idchk = 0;
			}
			
		}
		catch (Exception e) {
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
		return re_idchk;
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
	
	public void signup(HttpServletRequest request) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String addr3 = request.getParameter("addr3");
		String gender = request.getParameter("gender");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		String smark = request.getParameter("smark");
		String emark = request.getParameter("emark");
		
		String birth = year + "-" + month + "-" + day;
		String addr = "("+addr1+")"+addr2+" "+addr3;
		
		boolean smarkvalue = false, emarkvalue = false;
		if (smark.equals("on")) {
			smarkvalue = true;
		}
		if (emark.equals("on")) {
			emarkvalue = true;
		}
		Connection dbconn = null;
		PreparedStatement pstmt = null;
		
		try {
			dbconn = conn();
			String sql = "insert into customer values (?,?,?,?,?,?,?,?,?,?,?,?)";

			pstmt = dbconn.prepareStatement(sql);

			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			pstmt.setString(5, phone);
			pstmt.setString(6, addr);
			pstmt.setString(7, gender);
			pstmt.setString(8, birth);
			pstmt.setBoolean(9, smarkvalue);
			pstmt.setBoolean(10, emarkvalue);
			pstmt.setInt(11, 0);
			pstmt.setString(12, "bronze");
			
			pstmt.executeUpdate();

		}
		catch (Exception e) {
			e.getMessage();
		}
		finally {
			if (pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (dbconn != null) {
				try {
					dbconn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
	
	public void seller_signup(HttpServletRequest request) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String number = request.getParameter("number");
		String ownername = request.getParameter("ownername");
		String mail = request.getParameter("mail");
		String phone = request.getParameter("phone");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String addr3 = request.getParameter("addr3");
		String smark = request.getParameter("smark");
		String emark = request.getParameter("emark");
		
		String addr = "("+addr1+")"+addr2+" "+addr3;
		
		boolean smarkvalue = false, emarkvalue = false;
		if (smark.equals("on")) {
			smarkvalue = true;
		}
		if (emark.equals("on")) {
			emarkvalue = true;
		}
		Connection dbconn = null;
		PreparedStatement pstmt = null;
		
		try {
			dbconn = conn();
			String sql = "insert into seller values (?,?,?,?,?,?,?,?,?,?)";

			pstmt = dbconn.prepareStatement(sql);

			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, number);
			pstmt.setString(5, ownername);
			pstmt.setString(6, mail);
			pstmt.setString(7, phone);
			pstmt.setString(8, addr);
			pstmt.setBoolean(9, smarkvalue);
			pstmt.setBoolean(10, emarkvalue);	
			
			pstmt.executeUpdate();

		}
		catch (Exception e) {
			e.getMessage();
		}
		finally {
			if (pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (dbconn != null) {
				try {
					dbconn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
	
	public boolean login(HttpServletRequest request) {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		Connection dbconn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rt = null;
		boolean login_ans= false;
		
		try {
			dbconn = conn();
			String sql = "select c_id, c_name, c_addr, c_point, c_class from customer where c_id = (?) and c_password= (?)";
			HttpSession session = request.getSession();
			pstmt = dbconn.prepareStatement(sql);		
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rt = pstmt.executeQuery();
			String sqlans =null;
			System.out.println("여기");
			System.out.println(id);
			if (rt.next()) {
				customer dto = new customer();
				sqlans = rt.getString(1);
				dto.setId(rt.getString(1));
				dto.setName(rt.getString(2));
				dto.setAddr(rt.getString(3));
				dto.setPoint(rt.getInt(4));
				dto.setC_class(rt.getString(5));
				login_ans=true;
				if (session.getAttribute("user") == null) {
					session.setAttribute("user", dto);
				}
			}
			if (session.getAttribute("userid") == null) {
				session.setAttribute("userid", sqlans);		
			}
			
			sql = "select s_id from seller where s_id = (?) and s_password= (?)";

			pstmt2 = dbconn.prepareStatement(sql);		
			pstmt2.setString(1, id);
			pstmt2.setString(2, pw);
			rt = pstmt2.executeQuery();
			String sqlans2 =null;
			if (rt.next()) {
				sqlans2 = rt.getString(1);
				login_ans=true;
			}
			if(session.getAttribute("seller") == null) {
				session.setAttribute("seller", sqlans2);
			}
			
		}
		catch (Exception e) {
			System.out.println("여기2");
			e.printStackTrace();
		}
		finally {
			if (pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt2 != null) {
				try {
					pstmt2.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (dbconn != null) {
				try {
					dbconn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return login_ans;
	}
	

}
