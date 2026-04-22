package Com.ExpeseApp;

import java.sql.Date;

public class ExpDao {
	private double amount;
	private String Category;
	private	String info;
	private Date Today;
	private int id;
	private double expamount;
	
	public void setExpamount(double expamount) {
		this.expamount = expamount;
	}

	public double getExpamount() {
		return expamount;
	}

	public ExpDao() {
		super();
	}

	public ExpDao(double amount, String category, String info, Date today, int id,double expamount) {
		super();
		this.amount = amount;
		Category = category;
		this.info = info;
		Today = today;
		this.id = id;
		this.expamount=expamount;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public String getCategory() {
		return Category;
	}

	public void setCategory(String category) {
		Category = category;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public Date getToday() {
		return Today;
	}

	public void setToday(Date today) {
		Today = today;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

}