package control;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;

public class BoardController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String context_p = request.getContextPath();
		String command = uri.substring(context_p.length());
		BoardDao dao = BoardDao.getDao();
		
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		
		if (command.equals("/community/notice_write.bo")) {
			dao.noticewriter(request);
			RequestDispatcher rd = request.getRequestDispatcher("/community/notice.bo");
			rd.forward(request, response);
		}
		else if (command.equals("/community/notice.bo")) {
			dao.notice(request);
			dao.bopage(request);
			RequestDispatcher rd = request.getRequestDispatcher("/community/notice.jsp?category=notice");
			rd.forward(request, response);
		}
		else if (command.equals("/community/notice_view.bo")) {
			dao.noticeview(request);
			dao.bopage(request);
			String page = request.getParameter("page");
			RequestDispatcher rd = request.getRequestDispatcher("/community/notice_view.jsp?category=notice&page="+page);
			rd.forward(request, response);
		}
		else if (command.equals("/community/bulletin.bo")) {
			dao.bulletin(request);
			dao.bulletinbopage(request);			
			RequestDispatcher rd = request.getRequestDispatcher("/community/notice.jsp?category=bulletin");
			rd.forward(request, response);
		}
		else if (command.equals("/community/bulletin_view.bo")) {
			dao.bulletinview(request);
			dao.bulletinbopage(request);
			String page = request.getParameter("page");
			RequestDispatcher rd = request.getRequestDispatcher("/community/notice_view.jsp?category=bulletin&page="+page);
			rd.forward(request, response);
		}
		else if (command.equals("/community/bulletin_write.bo")) {
			dao.bulletinwriter(request);
			RequestDispatcher rd = request.getRequestDispatcher("/community/bulletin.bo");
			rd.forward(request, response);
		}
	}

}
