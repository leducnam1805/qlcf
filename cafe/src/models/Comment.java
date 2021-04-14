package models;

import java.sql.Timestamp;

public class Comment {

	private int id;
	private Menu menu;
	private User user;
	private String Name;
	private int quantum;
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

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public int getQuantum() {
		return quantum;
	}

	public void setQuantum(int quantum) {
		this.quantum = quantum;
	}

	public Timestamp getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

	public Comment(int id, Menu menu, User user, String name, int quantum, Timestamp createDate) {
		super();
		this.id = id;
		this.menu = menu;
		this.user = user;
		Name = name;
		this.quantum = quantum;
		this.createDate = createDate;
	}

	public Comment(Menu menu, User user, String name, int quantum) {
		super();
		this.menu = menu;
		this.user = user;
		Name = name;
		this.quantum = quantum;
	}

	public Comment(Menu menu, User user, String name, int quantum, Timestamp createDate) {
		super();
		this.menu = menu;
		this.user = user;
		Name = name;
		this.quantum = quantum;
		this.createDate = createDate;
	}

	public Comment() {
		super();
	}

}
