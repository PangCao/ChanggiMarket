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

import dao.loginDao;

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
		loginDao dao = loginDao.getDao();
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		if (command.equals("/login/signup.lo")) {
			dao.signup(request);
			response.sendRedirect("http://localhost:8080/tmp_project/login/login.jsp?signup=1");
		}
		else if (command.equals("/login/idchk.lo")) {
			int chkresult = dao.idchk(request);
			response.sendRedirect("http://localhost:8080/tmp_project/login/idmailchk.jsp?idchk="+chkresult);
		}
		else if (command.equals("/login/emailchk.lo")) {
			int chkresult = dao.emailchk(request);
			response.sendRedirect("http://localhost:8080/tmp_project/login/idmailchk.jsp?emailchk="+chkresult);
		}
		else if (command.equals("/login/sellnumchk.lo")) {
			int chkresult = dao.sellnumchk(request);
			response.sendRedirect("http://localhost:8080/tmp_project/login/idmailchk.jsp?sellnumchk="+chkresult);
		}
		else if (command.equals("/login/seller_signup.lo")) {
			dao.seller_signup(request);
			response.sendRedirect("http://localhost:8080/tmp_project/login/login.jsp?signup=1");
		}
		else if (command.equals("/login/login.lo")) {
			boolean ans = dao.login(request);
			if(ans) {
				RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
				rd.forward(request, response);
			}
			else {
				response.sendRedirect("/tmp_project/login/login.jsp?error=1");
			}
		}
		else if (command.equals("/login/logout.lo")) {
			dao.logout(request);
			response.sendRedirect("http://localhost:8080/tmp_project/index.jsp");			
		}
		else if (command.equals("/login/pwchk.lo")) {
			int pwchkans = dao.pwchk(request);
			if (pwchkans == 1) {
				RequestDispatcher rd = request.getRequestDispatcher("/login/modimypage.jsp");
				rd.forward(request, response);
			}
			else {
				response.sendRedirect("http://localhost:8080/tmp_project/login/modimypagechk.jsp?error=1");	
			}
		}
		else if (command.equals("/login/modi.lo")) {
			int ans = dao.modi(request);
			if (ans == 1) {
				response.sendRedirect("http://localhost:8080/tmp_project/login/modimypagechk.jsp?error=2");
			}
		}
	}
}
