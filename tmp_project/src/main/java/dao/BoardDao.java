package dao;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Enumeration;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import com.mysql.jdbc.Connection;
import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.*;
public class BoardDao {
	private BoardDao() {};
	private static BoardDao dao = new BoardDao();
	public static BoardDao getDao() {
		return  dao;
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
		while(files.hasMoreElements()) {
			String fname = (String)files.nextElement();
			filenames += multi.getFilesystemName(fname);
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
