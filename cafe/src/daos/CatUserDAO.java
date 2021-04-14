package daos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.CatUser;
import utils.DBConnectionUtil;

public class CatUserDAO extends AbstractDAO{

	public List<CatUser> findAll() {
		List<CatUser> catUsersList = new ArrayList<CatUser>();
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM catuser ORDER BY Id DESC";
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				CatUser objCatUser = new CatUser(rs.getInt("Id"),rs.getString("Name"));
				catUsersList.add(objCatUser);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return catUsersList;
	}

	public int add(CatUser catUser) {
		con = DBConnectionUtil.getConnection();
		String sql = "INSERT INTO catuser(Name) VALUES(?)";
		int result = 0;
		int idValue = 0;
		try {
			pst = con.prepareStatement(sql,st.RETURN_GENERATED_KEYS);
			pst.setString(1, catUser.getName());
			result = pst.executeUpdate();
			rs = pst.getGeneratedKeys();
			if(rs.next()) {
				idValue = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return idValue;
	}

	public CatUser findNameCreate(CatUser catUser) {
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM catuser WHERE Name = ?";
		CatUser result = null;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1,catUser.getName());
			rs = pst.executeQuery();
			if(rs.next()) {
				result = new CatUser(rs.getInt("Id"), rs.getString("Name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public CatUser findById(int id) {
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM catuser WHERE Id = ?";
		CatUser catUser = null;
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if(rs.next()) {
				catUser = new CatUser(rs.getInt("Id"), rs.getString("Name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return catUser;
	}

	public CatUser finCatUserEdit(CatUser catUser) {
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM catuser WHERE Name = ? AND id != ?";
		CatUser objCatUser = null;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, catUser.getName());
			pst.setInt(2, catUser.getId());
			rs = pst.executeQuery();
			if(rs.next()) {
				objCatUser = new CatUser(rs.getInt("Id"), rs.getString("Name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return objCatUser;
	}

	public int update(CatUser catUser) {
		con = DBConnectionUtil.getConnection();
		String sql = "UPDATE catuser SET Name = ? WHERE Id = ?";
		int result = 0;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, catUser.getName());
			pst.setInt(2, catUser.getId());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	
	
}
