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
		else if (command.equals("/community/one_qna.bo")) {
			dao.one(request);
			dao.onebopage(request);
			RequestDispatcher rd = request.getRequestDispatcher("/community/one_qna.jsp");
			rd.forward(request, response);
		}
		else if (command.equals("/community/one_write.bo")) {
			dao.onewriter(request);
			RequestDispatcher rd = request.getRequestDispatcher("/community/one_qna.bo");
			rd.forward(request, response);
		}
		else if (command.equals("/community/one_view.bo")) {
			dao.oneview(request);
			dao.onebopage(request);
			String page = request.getParameter("page");
			RequestDispatcher rd = request.getRequestDispatcher("/community/notice_view.jsp?category=1:1 문의&page="+page);
			rd.forward(request, response);
		}
		else if (command.equals("/community/review_write.bo")) {
			dao.reviewwriter(request);
			response.sendRedirect("http://localhost:8080/tmp_project/community/review.bo?page=1");
		}
		else if (command.equals("/community/review_view.bo")) {
			dao.recipe_view(request);
			dao.review_bopage(request);
			String page = request.getParameter("page");
			RequestDispatcher rd = request.getRequestDispatcher("/community/notice_view.jsp?category=나만의 레시피&page="+page);
			rd.forward(request, response);
		}
		else if (command.equals("/community/review.bo")) {
			dao.review(request);
			dao.review_bopage(request);
			RequestDispatcher rd = request.getRequestDispatcher("/community/recipe_review.jsp");
			rd.forward(request, response);
		}
		else if (command.equals("/community/faq.bo")) {
			dao.faq(request);
			dao.faq_bopage(request);
			RequestDispatcher rd = request.getRequestDispatcher("/community/faq.jsp");
			rd.forward(request, response);
		}
		else if (command.equals("/community/review_like.bo")) {
			int likechk = dao.likechk(request);
			String page = request.getParameter("page");
			if (likechk == 1) {
				response.sendRedirect("http://localhost:8080/tmp_project/community/review.bo?likechk=1&page="+page);
			}
			else if (likechk == -1) {
				response.sendRedirect("http://localhost:8080/tmp_project/community/review.bo?likechk=-1&page="+page);
			}
			else {
				dao.likeup(request);
				response.sendRedirect("http://localhost:8080/tmp_project/community/review.bo?page="+page);
			}
		}
	}
	
}
