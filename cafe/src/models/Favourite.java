package models;

import java.sql.Timestamp;

public class Favourite {

	private int id;
	private Menu menu;
	private User user;
	private String name;
	private int quantum;
	private Timestamp createDate;

	public Timestamp getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

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
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getQuantum() {
		return quantum;
	}

	public void setQuantum(int quantum) {
		this.quantum = quantum;
	}

	public Favourite(int id, Menu menu, User user, String name, int quantum) {
		super();
		this.id = id;
		this.menu = menu;
		this.user = user;
		this.name = name;
		this.quantum = quantum;
	}

	public Favourite(int id, Menu menu, User user, String name, int quantum, Timestamp createDate) {
		super();
		this.id = id;
		this.menu = menu;
		this.user = user;
		this.name = name;
		this.quantum = quantum;
		this.createDate = createDate;
	}
	

	public Favourite(Menu menu, User user, String name, int quantum) {
		super();
		this.menu = menu;
		this.user = user;
		this.name = name;
		this.quantum = quantum;
	}

	public Favourite() {
		super();
	}

}
