package models;

public class Permission {

	private int id;
	private CatUser catUser;
	private Boolean addPer;
	private Boolean editPer;
	private Boolean delPer;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public CatUser getCatUser() {
		return catUser;
	}

	public void setCatUser(CatUser catUser) {
		this.catUser = catUser;
	}

	public Boolean getAddPer() {
		return addPer;
	}

	public void setAddPer(Boolean addPer) {
		this.addPer = addPer;
	}

	public Boolean getEditPer() {
		return editPer;
	}

	public void setEditPer(Boolean editPer) {
		this.editPer = editPer;
	}

	public Boolean getDelPer() {
		return delPer;
	}

	public void setDelPer(Boolean delPer) {
		this.delPer = delPer;
	}

	public Permission() {
		super();
	}

	public Permission(int id, CatUser catUser, Boolean addPer, Boolean editPer, Boolean delPer) {
		super();
		this.id = id;
		this.catUser = catUser;
		this.addPer = addPer;
		this.editPer = editPer;
		this.delPer = delPer;
	}

}
