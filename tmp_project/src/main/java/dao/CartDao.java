package dao;
import dto.cartlist;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class CartDao {
	
	private CartDao() {};
	private static CartDao dao = new CartDao();
	public static CartDao getDao() {
		return  dao;
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
		cl.setFoodunit(foods);
		cl.setFoodprice(foodprice);
		cl.setFilename(file);
		ArrayList<cartlist> al = (ArrayList<cartlist>)session.getAttribute("myCart");
		al.add(cl);
	}
	
}
