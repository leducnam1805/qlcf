package daos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.CatUser;
import models.User;
import utils.DBConnectionUtil;

public class UserDAO extends AbstractDAO{

	public List<User> findAll() {
		con = DBConnectionUtil.getConnection();
		List<User> userList = new ArrayList<User>();
		String sql = "SELECT user.*,catuser.Name AS cName FROM user"
				+ " INNER JOIN catuser ON user.CatUserID = catuser.Id";
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				User user = new User(rs.getInt("Id"), rs.getString("Name"),rs.getString("Pass"),
						rs.getInt("Phone"), rs.getString("Email"), rs.getString("Address"),
						new CatUser(rs.getInt("CatUserID"), rs.getString("cName")));
				userList.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return userList;
	}

	public User checkEmail(User user) {
		con = DBConnectionUtil.getConnection();
		User objUser = null;
		String sql = "SELECT user.*,catuser.Name AS cName FROM user"
				+ " INNER JOIN catuser ON user.CatUserID = catuser.Id"
				+ " WHERE Email = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, user.getEmail());
			rs = pst.executeQuery();
			if(rs.next()) {
				objUser = new User(rs.getInt("Id"), rs.getString("Name"),rs.getString("Pass"),
						rs.getInt("Phone"), rs.getString("Email"), rs.getString("Address"), 
						new CatUser(rs.getInt("CatUserID"), rs.getString("cName")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return objUser;
	}

	public int add(User user) {
		con = DBConnectionUtil.getConnection();
		String sql = "INSERT INTO user(Name,Phone,Email,Address,CatUserID) VALUE(?,?,?,?,?)";
		int result = 0;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, user.getName());
			pst.setInt(2, user.getPhone());
			pst.setString(3, user.getEmail());
			pst.setString(4, user.getAddress());
			pst.setInt(5, user.getCatUser().getId());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public User findEmailPass(String email, String pass) {
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT user.*,catuser.Name AS cName FROM user"
				+ " INNER JOIN catuser ON user.CatUserID = catuser.Id"
				+ " WHERE Email = ? AND Pass = ?";
		User objUser = null;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, email);
			pst.setString(2, pass);
			rs = pst.executeQuery();
			if(rs.next()) {
				objUser = new User(rs.getInt("Id"), rs.getString("Name"),
						rs.getInt("Phone"), rs.getString("Email"), rs.getString("Address"),
						new CatUser(rs.getInt("CatUserID"), rs.getString("cName")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return objUser;
	}

	public User viewAll(String email) {
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT user.*,catuser.Name AS cName FROM user"
				+ " INNER JOIN catuser ON user.CatUserID = catuser.Id"
				+ " WHERE Email = ?";
		User objUser = null;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, email);
			rs = pst.executeQuery();
			if(rs.next()) {
				objUser = new User(rs.getInt("Id"), rs.getString("Name"),
						rs.getInt("Phone"), rs.getString("Email"), rs.getString("Address"),
						new CatUser(rs.getInt("CatUserID"), rs.getString("cName")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return objUser;
	}

	public int register(User user) {
		con = DBConnectionUtil.getConnection();
		String sql = "INSERT INTO user(Name,Pass,Email) VALUE(?,?,?)";
		int result = 0;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, user.getName());
			pst.setString(2, user.getPass());
			pst.setString(3, user.getEmail());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public User findById(int id) {
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT user.*,catuser.Name AS cName FROM user"
				+ " INNER JOIN catuser ON user.CatUserID = catuser.Id"
				+ " WHERE user.Id = ?";
		User user = null;
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if(rs.next()) {
				user = new User(rs.getInt("Id"), rs.getString("Name"),rs.getString("Pass"),
						rs.getInt("Phone"), rs.getString("Email"),
						rs.getString("Address"), new CatUser(rs.getInt("CatUserID"),rs.getString("cName")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

	public int update(User user) {
		con = DBConnectionUtil.getConnection();
		String sql = "UPDATE user SET Pass = ?,Phone = ?,Email = ?,Address = ?, CatUserID = ? WHERE Id = ?";
		int result = 0;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, user.getPass());
			pst.setInt(2, user.getPhone());
			pst.setString(3, user.getEmail());
			pst.setString(4, user.getAddress());
			pst.setInt(5, user.getCatUser().getId());
			pst.setInt(6, user.getId());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

}
