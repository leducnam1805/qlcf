package models;

import java.sql.Timestamp;

public class Product {
	private int id;
	private Menu menu;
	private String image;
	private long price;
	private String detail;
	private String description;
	private Timestamp createDate;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public long getPrice() {
		return price;
	}

	public void setPrice(long price) {
		this.price = price;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Timestamp getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

	public Product(int id, Menu menu, String image, long price, String detail, String description,
			Timestamp createDate) {
		super();
		this.id = id;
		this.menu = menu;
		this.image = image;
		this.price = price;
		this.detail = detail;
		this.description = description;
		this.createDate = createDate;
	}

	public Product(Menu menu, String image, long price, String detail, String description, Timestamp createDate) {
		super();
		this.menu = menu;
		this.image = image;
		this.price = price;
		this.detail = detail;
		this.description = description;
		this.createDate = createDate;
	}

	public Product(int id, String image, long price, String detail, String description) {
		super();
		this.id = id;
		this.image = image;
		this.price = price;
		this.detail = detail;
		this.description = description;
	}

	public Product(Menu menu, String image, long price, String detail, String description) {
		super();
		this.menu = menu;
		this.image = image;
		this.price = price;
		this.detail = detail;
		this.description = description;
	}

	public Product(int id) {
		super();
		this.id = id;
	}

	public Product() {
		super();
	}

}
