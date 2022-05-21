package dto;

import java.io.Serializable;

public class cartlist implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private String foodName;
	private String[] foods;
	private String[] foodunit;
	private String[] foodprice;
	private String filename;
	
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	public String[] getFoods() {
		return foods;
	}
	public void setFoods(String[] foods) {
		this.foods = foods;
	}
	public String[] getFoodunit() {
		return foodunit;
	}
	public void setFoodunit(String[] foodunit) {
		this.foodunit = foodunit;
	}
	public String[] getFoodprice() {
		return foodprice;
	}
	public void setFoodprice(String[] foodprice) {
		this.foodprice = foodprice;
	}
	
}
