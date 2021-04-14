package daos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.CatOrder;
import utils.DBConnectionUtil;

public class CatOrderDAO extends AbstractDAO{
	
	public List<CatOrder> findAll(){
		List<CatOrder> catOrderList = new ArrayList<CatOrder>();
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM catorder ORDER BY Id DESC";
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				CatOrder objCatOrder = new CatOrder(rs.getInt("Id"), rs.getString("Name"));
				catOrderList.add(objCatOrder);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return catOrderList;
	}

	public CatOrder findByID(int catOrderID) {
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM catorder WHERE Id = ?";
		CatOrder objCatOrder = null;
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, catOrderID);
			rs = pst.executeQuery();
			if(rs.next()) {
				objCatOrder = new CatOrder(rs.getInt("Id"), rs.getString("Name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return objCatOrder;
	}

	public int save(CatOrder catOrder) {
		int result = 0;
		con = DBConnectionUtil.getConnection();
		String sql = "INSERT INTO catorder(Name) VALUES(?)";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, catOrder.getName());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public int update(CatOrder catOrder) {
		con = DBConnectionUtil.getConnection();
		String sql = "UPDATE catorder SET Name = ? WHERE Id = ?";
		int result = 0;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, catOrder.getName());
			pst.setInt(2, catOrder.getId());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public CatOrder checkName(String nameCreate) {
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM catorder WHERE Name = ?";
		CatOrder objCatOrder = null;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, nameCreate);
			rs = pst.executeQuery();
			if(rs.next()) {
				objCatOrder = new CatOrder(rs.getInt("Id"), rs.getString("Name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return objCatOrder;
	}

}
