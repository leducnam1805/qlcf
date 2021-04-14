package models;

import java.sql.Timestamp;

public class Item {

	private int id;
	private OrderProduct orderProduct;
	private Product product;
	private int quantity;
	private long price;
	private Timestamp createDate;
	private Timestamp lastUpdate;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public OrderProduct getOrderProduct() {
		return orderProduct;
	}

	public void setOrderProduct(OrderProduct orderProduct) {
		this.orderProduct = orderProduct;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public long getPrice() {
		return price;
	}

	public void setPrice(long price) {
		this.price = price;
	}

	public Timestamp getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

	public Timestamp getLastUpdate() {
		return lastUpdate;
	}

	public void setLastUpdate(Timestamp lastUpdate) {
		this.lastUpdate = lastUpdate;
	}

	public Item(int id, OrderProduct orderProduct, Product product, int quantity, long price, Timestamp createDate,
			Timestamp lastUpdate) {
		super();
		this.id = id;
		this.orderProduct = orderProduct;
		this.product = product;
		this.quantity = quantity;
		this.price = price;
		this.createDate = createDate;
		this.lastUpdate = lastUpdate;
	}

	public Item(int id, Product product, int quantity, long price, Timestamp createDate, Timestamp lastUpdate) {
		super();
		this.id = id;
		this.product = product;
		this.quantity = quantity;
		this.price = price;
		this.createDate = createDate;
		this.lastUpdate = lastUpdate;
	}

	public Item(OrderProduct orderProduct, Product product, int quantity, long price) {
		super();
		this.orderProduct = orderProduct;
		this.product = product;
		this.quantity = quantity;
		this.price = price;
	}

	public Item() {
		super();
	}

}
