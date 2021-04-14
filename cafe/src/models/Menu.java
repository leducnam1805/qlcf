package models;

public class Menu {
	
	private int id;
	
	private String name;
	
	private int parentID;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getParentID() {
		return parentID;
	}

	public void setParentID(int parentID) {
		this.parentID = parentID;
	}

	public Menu() {
		super();
	}

	public Menu(int id, String name, int parentID) {
		super();
		this.id = id;
		this.name = name;
		this.parentID = parentID;
	}

	public Menu(String name, int parentID) {
		super();
		this.name = name;
		this.parentID = parentID;
	}

	public Menu(String name) {
		super();
		this.name = name;
	}

	public Menu(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public Menu(int id) {
		super();
		this.id = id;
	}
	
	
}
