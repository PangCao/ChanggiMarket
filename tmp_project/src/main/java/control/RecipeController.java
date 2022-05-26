package control;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.*;

import dto.cartlist;
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

import dao.RecipeDao;

public class RecipeController extends HttpServlet{
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
		RecipeDao dao = RecipeDao.getDao();
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		System.out.println(command);
		if (command.equals("/recipe/recipes.re")) {
			dao.recipes(request);
			dao.price(request);
			dao.count(request);
			RequestDispatcher rd = request.getRequestDispatcher("/recipe/recipes.jsp");
			rd.forward(request, response);
		}
		else if (command.equals("/recipe/recipe.re")) {
			dao.sel_recipe(request);
			dao.price(request);
			RequestDispatcher rd = request.getRequestDispatcher("/recipe/recipe.jsp");
			rd.forward(request, response);
		}
		else if (command.equals("/recipe/addCartIcon.re")) {
			dao.price(request);
			dao.addCartIcon(request, response);
			String id = request.getParameter("id");
			String ct = request.getParameter("r_category");
			ct = URLEncoder.encode(ct, "UTF-8");
			String cupage = request.getParameter("page");
			response.sendRedirect("http://localhost:8080/tmp_project/recipe/recipes.re?chk=true&id="+id+"&r_category="+ct+"&page="+cupage);
		}
	}
	
}
