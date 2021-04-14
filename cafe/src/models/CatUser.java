package models;

public class CatUser {

	private int id;
	private String name;

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

	public CatUser(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public CatUser(String name) {
		super();
		this.name = name;
	}

	public CatUser(int id) {
		super();
		this.id = id;
	}

}
