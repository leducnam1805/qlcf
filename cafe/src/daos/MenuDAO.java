package daos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Menu;
import utils.DBConnectionUtil;

public class MenuDAO extends AbstractDAO {

	public List<Menu> findAll() {
		List<Menu> menuList = new ArrayList<Menu>();
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM menu ORDER BY Id DESC";
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				Menu objMenu = new Menu(rs.getInt("id"), rs.getString("name"), rs.getInt("parentID"));
				menuList.add(objMenu);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return menuList;
	}

	public int add(Menu menu) {
		con = DBConnectionUtil.getConnection();
		String sql = "INSERT INTO menu(Name,ParentID) VALUES(?,?)";
		int result = 0;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, menu.getName());
			pst.setInt(2, menu.getParentID());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public Menu findNameCreate(Menu menu) {
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM menu WHERE Name = ?";
		Menu result = null;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1,menu.getName());
			rs = pst.executeQuery();
			if(rs.next()) {
				result = new Menu(rs.getInt("Id"), 
						rs.getString("name"),
						rs.getInt("ParentId"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<Menu> findParentID(int parentID) {
		List<Menu> menuList = new ArrayList<Menu>();
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM menu WHERE ParentID = ?"
				+ " ORDER BY Id DESC";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, parentID);
			rs = pst.executeQuery();
			while(rs.next()) {
				Menu objMenu = new Menu(rs.getInt("Id"),
						rs.getString("Name"),
						rs.getInt("ParentID"));
				menuList.add(objMenu);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return menuList;
	}

	public List<Menu> findAllSearch() {
		List<Menu> menuList = new ArrayList<Menu>();
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM menu WHERE ParentID = 0 ORDER BY Id DESC";
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				Menu objMenu = new Menu(rs.getInt("id"), rs.getString("name"), rs.getInt("parentID"));
				menuList.add(objMenu);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return menuList;
	}

	public List<Menu> findAllSearchParent(int parentID) {
		List<Menu> menuList = new ArrayList<Menu>();
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM menu WHERE ParentID = ? ORDER BY Id DESC";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, parentID);
			rs = pst.executeQuery();
			while (rs.next()) {
				Menu objMenu = new Menu(rs.getInt("id"), rs.getString("name"), rs.getInt("parentID"));
				menuList.add(objMenu);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return menuList;
	}

	public Menu findByID(int id) {
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM menu WHERE Id = ?";
		Menu objMenu = null;
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if(rs.next()) {
				objMenu = new Menu(rs.getInt("Id"), rs.getString("Name"), rs.getInt("ParentID"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return objMenu;
	}

	public int update(Menu menu) {
		con = DBConnectionUtil.getConnection();
		String sql = "UPDATE menu SET Name = ? WHERE Id = ?";
		int result = 0;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, menu.getName());
			pst.setInt(2, menu.getId());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

}
