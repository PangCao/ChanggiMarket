package dao;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import com.mysql.jdbc.Connection;
import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.*;

import dto.Boardlist;

public class BoardDao {
	private BoardDao() {};
	private static BoardDao dao = new BoardDao();
	public static BoardDao getDao() {
		return  dao;
	}
	
	
	public void bulletin(HttpServletRequest request) {
		String page = request.getParameter("page");
		String search = request.getParameter("search");
		Connection dbconn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Boardlist> al = new ArrayList<Boardlist>();
		try {
			dbconn = conn();
			if (search == null || search.equals("")) {
				String sql = "select * from bulletin order by b_id desc";
				pstmt = dbconn.prepareStatement(sql);
				rs = pstmt.executeQuery();
			}
			else {
				String sql = "select * from bulletin where title=? order by b_id desc";
				pstmt = dbconn.prepareStatement(sql);
				pstmt.setString(1, search);
				rs = pstmt.executeQuery();
			}
			while (rs.next()) {
				Boardlist bl = new Boardlist();
				String id = rs.getString("b_id");
				String title = rs.getString("b_title");
				String writer = rs.getString("b_writer");
				String content = rs.getString("b_content");
				String[] img = rs.getString("b_img").split(",");
				String date = rs.getString("b_date");
				int hit = rs.getInt("b_hit");
				bl.setId(id);
				bl.setTitle(title);
				bl.setWriter(writer);
				bl.setContent(content);
				bl.setImg(img);
				bl.setDate(date);
				bl.setHit(hit);
				al.add(bl);
			}
			request.setAttribute("notice", al);
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
			catch (Exception e) {
				e.printStackTrace();
			}
				
		}
	}
	public void bulletinview(HttpServletRequest request) {
		String id = request.getParameter("id");
		
		Connection dbconn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PreparedStatement pstmt_sub = null;
		
		try {
			dbconn = conn();		
			
			String sql = "select * from bulletin where b_id=?";
			pstmt = dbconn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Boardlist bl = new Boardlist();
				String title = rs.getString("b_title");
				String writer = rs.getString("b_writer");
				String content = rs.getString("b_content");
				String[] img = rs.getString("b_img").split(",");
				String date = rs.getString("b_date");
				int hit = rs.getInt("b_hit");
				bl.setId(id);
				bl.setTitle(title);
				bl.setWriter(writer);
				bl.setContent(content);
				bl.setImg(img);
				bl.setDate(date);
				bl.setHit(hit+1);
				sql = "update bulletin set b_hit=? where b_id=?";
				pstmt_sub = dbconn.prepareStatement(sql);
				pstmt_sub.setInt(1, hit+1);
				pstmt_sub.setString(2, id);
				pstmt_sub.executeUpdate();
				request.setAttribute("viewInfo", bl);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if (pstmt_sub != null) {
					pstmt_sub.close();
				}
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
	
	public void noticeview(HttpServletRequest request) {
		String id = request.getParameter("id");
		
		Connection dbconn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PreparedStatement pstmt_sub = null;
		
		try {
			dbconn = conn();		
			
			String sql = "select * from notice where n_id=?";
			pstmt = dbconn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Boardlist bl = new Boardlist();
				String title = rs.getString("n_title");
				String writer = rs.getString("n_writer");
				String content = rs.getString("n_content");
				String[] img = rs.getString("n_img").split(",");
				String date = rs.getString("n_date");
				int hit = rs.getInt("n_hit");
				bl.setId(id);
				bl.setTitle(title);
				bl.setWriter(writer);
				bl.setContent(content);
				bl.setImg(img);
				bl.setDate(date);
				bl.setHit(hit+1);
				sql = "update notice set n_hit=? where n_id=?";
				pstmt_sub = dbconn.prepareStatement(sql);
				pstmt_sub.setInt(1, hit+1);
				pstmt_sub.setString(2, id);
				pstmt_sub.executeUpdate();
				request.setAttribute("viewInfo", bl);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if (pstmt_sub != null) {
					pstmt_sub.close();
				}
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
	public void bulletinbopage(HttpServletRequest request) {
		Connection dbconn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String search = request.getParameter("search");
		
		try {
			dbconn = conn();
			if (search == null || search.equals("")) {
				String sql = "select count(*) from bulletin";
				pstmt = dbconn.prepareStatement(sql);
				rs = pstmt.executeQuery();
			}
			else {
				String sql = "select count(*) from bulletin where b_title=?";
				pstmt = dbconn.prepareStatement(sql);
				pstmt.setString(1, search);
				rs = pstmt.executeQuery();
			}
			rs.next();
			int page = rs.getInt(1);
			request.setAttribute("totalpage", page);
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
	}
	
	public void bopage(HttpServletRequest request) {
		Connection dbconn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String search = request.getParameter("search");
		
		try {
			dbconn = conn();
			if (search == null || search.equals("")) {
				String sql = "select count(*) from notice";
				pstmt = dbconn.prepareStatement(sql);
				rs = pstmt.executeQuery();
			}
			else {
				String sql = "select count(*) from notice where n_title=?";
				pstmt = dbconn.prepareStatement(sql);
				pstmt.setString(1, search);
				rs = pstmt.executeQuery();
			}
			rs.next();
			int page = rs.getInt(1);
			request.setAttribute("totalpage", page);
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
	}
	
	public void notice(HttpServletRequest request) {
		String page = request.getParameter("page");
		String search = request.getParameter("search");
		Connection dbconn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Boardlist> al = new ArrayList<Boardlist>();
		try {
			dbconn = conn();
			if (search == null || search.equals("")) {
				String sql = "select * from notice order by n_id desc";
				pstmt = dbconn.prepareStatement(sql);
				rs = pstmt.executeQuery();
			}
			else {
				String sql = "select * from notice where title=? order by n_id desc";
				pstmt = dbconn.prepareStatement(sql);
				pstmt.setString(1, search);
				rs = pstmt.executeQuery();
			}
			while (rs.next()) {
				Boardlist bl = new Boardlist();
				String id = rs.getString("n_id");
				String title = rs.getString("n_title");
				String writer = rs.getString("n_writer");
				String content = rs.getString("n_content");
				String[] img = rs.getString("n_img").split(",");
				String date = rs.getString("n_date");
				int hit = rs.getInt("n_hit");
				bl.setId(id);
				bl.setTitle(title);
				bl.setWriter(writer);
				bl.setContent(content);
				bl.setImg(img);
				bl.setDate(date);
				bl.setHit(hit);
				al.add(bl);
			}
			request.setAttribute("notice", al);
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
			catch (Exception e) {
				e.printStackTrace();
			}
				
		}
	}
	public void bulletinwriter(HttpServletRequest request) {

		String realFolder = request.getRealPath("resources/images");
		MultipartRequest multi = null;
		try {
			multi = new MultipartRequest(request, realFolder, 10 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		String title = multi.getParameter("title");
		String id = multi.getParameter("id");
		String contents = multi.getParameter("contents");
		String filenames = "";
		Enumeration files = multi.getFileNames();
		int cnt = 0;
		while(files.hasMoreElements()) {
			String fname = (String)files.nextElement();
			if (multi.getFilesystemName(fname) != null) {
				if (cnt == 0) {
					filenames += multi.getFilesystemName(fname);
					cnt++;
				}
				else {
					filenames += ","+multi.getFilesystemName(fname);
				}
			}
		}	
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String date = format.format(Calendar.getInstance().getTime());
		
		
		Connection dbconn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "insert into bulletin (b_title, b_writer, b_content, b_img, b_date) values (?,?,?,?,?)"; 
			dbconn = conn();
			pstmt = dbconn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, id);
			pstmt.setString(3, contents);
			pstmt.setString(4, filenames);
			pstmt.setString(5, date);
			pstmt.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if(dbconn != null) {
					dbconn.close();
				}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public void noticewriter(HttpServletRequest request) {

		String realFolder = request.getRealPath("resources/images");
		MultipartRequest multi = null;
		try {
			multi = new MultipartRequest(request, realFolder, 10 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		String title = multi.getParameter("title");
		String id = multi.getParameter("id");
		String contents = multi.getParameter("contents");
		String filenames = "";
		Enumeration files = multi.getFileNames();
		int cnt = 0;
		while(files.hasMoreElements()) {
			String fname = (String)files.nextElement();
			if (multi.getFilesystemName(fname) != null) {
				if (cnt == 0) {
					filenames += multi.getFilesystemName(fname);
					cnt++;
				}
				else {
					filenames += ","+multi.getFilesystemName(fname);
				}
			}
		}	
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String date = format.format(Calendar.getInstance().getTime());
		
		
		Connection dbconn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "insert into notice (n_title, n_writer, n_content, n_img, n_date) values (?,?,?,?,?)"; 
			dbconn = conn();
			pstmt = dbconn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, id);
			pstmt.setString(3, contents);
			pstmt.setString(4, filenames);
			pstmt.setString(5, date);
			pstmt.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if(dbconn != null) {
					dbconn.close();
				}
			}
			catch(Exception e) {
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
