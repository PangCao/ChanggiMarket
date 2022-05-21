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
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;

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
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		CartDao dao = CartDao.getDao();
		
		if (command.equals("/recipe/addCart.ca")) {
			dao.addCart(request);
			RequestDispatcher rd = request.getRequestDispatcher("/recipe/recipe.jsp");
			rd.forward(request, response);
		}
		else if (command.equals("/recipe/goCart.ca")) {
			dao.addCart(request);
			RequestDispatcher rd = request.getRequestDispatcher("/cart/cart.jsp");
			rd.forward(request, response);
		}
	}
	
	

}
