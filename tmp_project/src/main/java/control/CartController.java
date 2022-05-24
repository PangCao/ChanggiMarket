package control;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CartDao;

public class CartController extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String context_p = request.getContextPath();
		String command = uri.substring(context_p.length());
		CartDao dao = CartDao.getDao();
		
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		if (command.equals("/recipe/addCart.ca")) {
			dao.addCart(request);
			RequestDispatcher rd = request.getRequestDispatcher("/recipe/addCartClose.jsp");
			rd.forward(request, response);
		}
		else if (command.equals("/recipe/goCart.ca")) {
			dao.addCart(request);
			response.sendRedirect("/tmp_project/cart/cart.jsp");
		}
		else if (command.equals("/cart/order.ca")) {
			dao.order(request);
			RequestDispatcher rd = request.getRequestDispatcher("/cart/order_complete.jsp");
			rd.forward(request, response);
		}
		else if (command.equals("/recipe/addCartIcon.ca")) {
			dao.price(request);
			dao.addCartIcon(request);
			RequestDispatcher rd = request.getRequestDispatcher("/recipe/addCartClose.jsp");
			rd.forward(request, response);
		}
		else if (command.equals("/login/mypage.ca")) {
			dao.mypage(request);
			dao.pagecnt(request);
			RequestDispatcher rd = request.getRequestDispatcher("/login/mypage.jsp");
			rd.forward(request, response);
		}
	}
	
	

}