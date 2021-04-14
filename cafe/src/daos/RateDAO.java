package daos;

import java.sql.SQLException;

import models.Menu;
import models.Rate;
import models.User;
import utils.DBConnectionUtil;

public class RateDAO extends AbstractDAO{

	public int save(Rate rate) {
		con = DBConnectionUtil.getConnection();
		String sql = "INSERT INTO rate(MenuID,Name,QuanTum,TotalRating,UserID) VALUE(?,?,?,?,?)";
		int result = 0;
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, rate.getMenu().getId());
			pst.setInt(2, rate.getName());
			pst.setInt(3, rate.getQuantum());
			pst.setFloat(4, rate.getTotalRating());
			pst.setInt(5, rate.getUserID().getId());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public Rate findOneRate(int id) {
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM rate WHERE MenuID = ? ORDER BY Id DESC LIMIT 1";
		Rate objRate = null;
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if(rs.next()) {
				objRate = new Rate(rs.getInt("Id"), 
						new Menu(rs.getInt("MenuID")), 
						rs.getInt("Name"),
						rs.getInt("QuanTum"),
						rs.getFloat("TotalRating"),
						new User(rs.getInt("UserID")),
						rs.getTimestamp("CreateDate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return objRate;
	}

	public Rate checkUserID(Rate rate) {
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM rate WHERE UserID = ? AND MenuID = ?";
		Rate objRate = null;
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1,rate.getUserID().getId());
			pst.setInt(2, rate.getMenu().getId());
			rs = pst.executeQuery();
			if(rs.next()) {
				objRate = new Rate(rs.getInt("Id"),
						new Menu(rs.getInt("MenuID")), 
						rs.getInt("Name"),
						rs.getInt("QuanTum"),
						rs.getFloat("TotalRating"),
						new User(rs.getInt("UserID")),
						rs.getTimestamp("CreateDate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return objRate;
	}

	public Rate findOneRateLast() {
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM rate ORDER BY Id DESC";
		Rate objRate = null;
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) {
				objRate = new Rate(rs.getInt("Id"),
						new Menu(rs.getInt("MenuID")), 
						rs.getInt("Name"),
						rs.getInt("QuanTum"),
						rs.getFloat("TotalRating"),
						new User(rs.getInt("UserID")),
						rs.getTimestamp("CreateDate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return objRate;
	}

	public int countID() {
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT COUNT(*) AS count FROM rate";
		int result = 0;
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) {
				result = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

}
