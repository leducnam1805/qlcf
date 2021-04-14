package models;

import java.sql.Timestamp;
import java.util.List;

public class OrderProduct {

	private int id;
	private User userID;
	private List<Item> item;
	private String total;
	private Boolean status;
	private Timestamp createDate;
	private Timestamp lastUpdate;
	private CatOrder catOrder;
	
	public CatOrder getCatOrder() {
		return catOrder;
	}

	public void setCatOrder(CatOrder catOrder) {
		this.catOrder = catOrder;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUserID() {
		return userID;
	}

	public void setUserID(User userID) {
		this.userID = userID;
	}

	public List<Item> getItem() {
		return item;
	}

	public void setItem(List<Item> item) {
		this.item = item;
	}

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
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


	public OrderProduct(int id, User userID, List<Item> item, String total, Boolean status, Timestamp createDate,
			Timestamp lastUpdate) {
		super();
		this.id = id;
		this.userID = userID;
		this.item = item;
		this.total = total;
		this.status = status;
		this.createDate = createDate;
		this.lastUpdate = lastUpdate;
	}

	public OrderProduct(User userID, String total) {
		super();
		this.userID = userID;
		this.total = total;
	}

	public OrderProduct(int id, User userID, List<Item> item, String total) {
		super();
		this.id = id;
		this.userID = userID;
		this.item = item;
		this.total = total;
	}

	public OrderProduct(int id, User userID, List<Item> item, String total, Boolean status, Timestamp createDate,
			Timestamp lastUpdate, CatOrder catOrder) {
		super();
		this.id = id;
		this.userID = userID;
		this.item = item;
		this.total = total;
		this.status = status;
		this.createDate = createDate;
		this.lastUpdate = lastUpdate;
		this.catOrder = catOrder;
	}

	public OrderProduct(User userID, String total, CatOrder catOrder) {
		super();
		this.userID = userID;
		this.total = total;
		this.catOrder = catOrder;
	}

	public OrderProduct(int id, User userID, String total, Boolean status, Timestamp createDate, Timestamp lastUpdate,
			CatOrder catOrder) {
		super();
		this.id = id;
		this.userID = userID;
		this.total = total;
		this.status = status;
		this.createDate = createDate;
		this.lastUpdate = lastUpdate;
		this.catOrder = catOrder;
	}

	public OrderProduct(int id) {
		super();
		this.id = id;
	}

	public OrderProduct() {
		super();
	}
	
}
