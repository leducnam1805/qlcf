package models;

public class User {

	private int id;
	private String name;
	private String pass;
	private int phone;
	private String email;
	private String address;
	private CatUser catUser;

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

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public CatUser getCatUser() {
		return catUser;
	}

	public void setCatUser(CatUser catUser) {
		this.catUser = catUser;
	}

	public User(int id) {
		super();
		this.id = id;
	}

	public User(int id, String name, String pass, int phone, String email, String address, CatUser catUser) {
		super();
		this.id = id;
		this.name = name;
		this.pass = pass;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.catUser = catUser;
	}

	public User(String name, String pass, int phone, String email, String address, CatUser catUser) {
		super();
		this.name = name;
		this.pass = pass;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.catUser = catUser;
	}

	public User(String name, int phone, String email, String address, CatUser catUser) {
		super();
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.catUser = catUser;
	}

	public User(String pass, String email) {
		super();
		this.pass = pass;
		this.email = email;
	}

	public User(String name, String pass, String email) {
		super();
		this.name = name;
		this.pass = pass;
		this.email = email;
	}

	public User(int id, String name, int phone, String email, String address, CatUser catUser) {
		super();
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.catUser = catUser;
	}

	
	
}
