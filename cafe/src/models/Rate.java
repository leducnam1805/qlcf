package models;

import java.sql.Timestamp;

public class Rate {

	private int id;
	private Menu menu;
	private int name;
	private int quantum;
	private float TotalRating;
	private User userID;
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

	public int getName() {
		return name;
	}

	public void setName(int name) {
		this.name = name;
	}

	public int getQuantum() {
		return quantum;
	}

	public void setQuantum(int quantum) {
		this.quantum = quantum;
	}

	public User getUserID() {
		return userID;
	}

	public void setUserID(User userID) {
		this.userID = userID;
	}

	public Timestamp getCreateDate() {
		return createDate;
	}

	public float getTotalRating() {
		return TotalRating;
	}

	public void setTotalRating(float totalRating) {
		TotalRating = totalRating;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

	public Rate(int id, Menu menu, int name, int quantum, User userID, Timestamp createDate) {
		super();
		this.id = id;
		this.menu = menu;
		this.name = name;
		this.quantum = quantum;
		this.userID = userID;
		this.createDate = createDate;
	}

	public Rate(int id, Menu menu, int name, int quantum, User userID) {
		super();
		this.id = id;
		this.menu = menu;
		this.name = name;
		this.quantum = quantum;
		this.userID = userID;
	}

	public Rate(Menu menu, int name, int quantum, User userID) {
		super();
		this.menu = menu;
		this.name = name;
		this.quantum = quantum;
		this.userID = userID;
	}

	public Rate(Menu menu, int name, int quantum, float totalRating, User userID) {
		super();
		this.menu = menu;
		this.name = name;
		this.quantum = quantum;
		TotalRating = totalRating;
		this.userID = userID;
	}

	public Rate(int id, Menu menu, int name, int quantum, float totalRating, User userID, Timestamp createDate) {
		super();
		this.id = id;
		this.menu = menu;
		this.name = name;
		this.quantum = quantum;
		TotalRating = totalRating;
		this.userID = userID;
		this.createDate = createDate;
	}

	public Rate() {
		super();
	}

}
