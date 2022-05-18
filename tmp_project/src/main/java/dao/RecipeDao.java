package dao;
import java.util.*;
import dto.recipelist;
import dto.foodprice;
public class RecipeDao {
	private RecipeDao rd = new RecipeDao();
	private static ArrayList<recipelist> foodlist = new ArrayList<recipelist>();
	
	public static ArrayList<recipelist> getFoodlist() {
		return foodlist;
	}
	private static ArrayList<foodprice> foodprice = new ArrayList<foodprice>();
	
	public static ArrayList<foodprice> getFoodprice() {
		return foodprice;
	} 
}
