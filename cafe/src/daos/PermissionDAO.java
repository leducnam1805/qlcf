package daos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.CatUser;
import models.Permission;
import utils.DBConnectionUtil;

public class PermissionDAO extends AbstractDAO{

	public List<Permission> findAll() {
		List<Permission> permissionList = new ArrayList<Permission>();
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM permission"
				+ " INNER JOIN catuser ON permission.CatUserID = catuser.Id";
		
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				Permission objPermission = new Permission(rs.getInt("Id"),
						new CatUser(rs.getInt("CatUserID"), rs.getString("Name")),
						rs.getBoolean("AddPer"), rs.getBoolean("EditPer"),
						rs.getBoolean("DelPer"));
				permissionList.add(objPermission);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return permissionList;
	}

	public int addPer(Permission permission) {
		con = DBConnectionUtil.getConnection();
		String sql = "UPDATE permission SET AddPer = ? WHERE CatUserID = ?";
		int result = 0;
		try {
			pst = con.prepareStatement(sql);
			pst.setBoolean(1, permission.getAddPer());
			pst.setInt(2, permission.getCatUser().getId());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public int editPer(Permission permission) {
		con = DBConnectionUtil.getConnection();
		String sql = "UPDATE permission SET EditPer = ? WHERE CatUserID = ?";
		int result = 0;
		try {
			pst = con.prepareStatement(sql);
			pst.setBoolean(1, permission.getEditPer());
			pst.setInt(2, permission.getCatUser().getId());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public int delPer(Permission permission) {
		con = DBConnectionUtil.getConnection();
		String sql = "UPDATE permission SET delPer = ? WHERE CatUserID = ?";
		int result = 0;
		try {
			pst = con.prepareStatement(sql);
			pst.setBoolean(1, permission.getDelPer());
			pst.setInt(2, permission.getCatUser().getId());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public int addPerCatUser(Permission permission) {
		con = DBConnectionUtil.getConnection();
		String sql = "INSERT INTO permission(CatUserID) VALUE(?)";
		int result = 0;
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, permission.getCatUser().getId());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	
	
}
