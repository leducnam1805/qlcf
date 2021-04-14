package daos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Favourite;
import models.Menu;
import models.User;
import utils.DBConnectionUtil;

public class FavouriteDAO extends AbstractDAO {

	public int add(Favourite favourite) {
		int result = 0;
		con = DBConnectionUtil.getConnection();
		String sql = "INSERT INTO favourite(MenuID,UserID,Name,Quantum) VALUE(?,?,?,?)";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, favourite.getMenu().getId());
			pst.setInt(2, favourite.getUser().getId());
			pst.setString(3, favourite.getName());
			pst.setInt(4, favourite.getQuantum());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<Favourite> findAllViews(int id) {
		List<Favourite> favouriteList = new ArrayList<Favourite>();
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT *,favourite.Name AS fname FROM favourite"
				+ " INNER JOIN menu ON favourite.MenuID = menu.Id"
				+ " INNER JOIN user ON favourite.UserID = user.Id"
				+ " WHERE MenuID = ?"
				+ " ORDER BY favourite.Id DESC"
				+ " LIMIT 1";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			while(rs.next()) {
				Favourite objFavourite = new Favourite(rs.getInt("Id"),
						new Menu(rs.getInt("MenuID")), new User(rs.getInt("UserID")),
						rs.getString("fname"), rs.getInt("Quantum"), rs.getTimestamp("CreateDate"));
				favouriteList.add(objFavourite);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return favouriteList;
	}

	public Favourite checkUserID(int userID,int menuID) {
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT *,favourite.Name AS fname FROM favourite"
				+ " INNER JOIN menu ON favourite.MenuID = menu.Id"
				+ " INNER JOIN user ON favourite.UserID = user.Id"
				+ " WHERE UserID = ? AND MenuID = ?"
				+ " ORDER BY favourite.Id DESC";
		Favourite objFavourite = null;
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, userID);
			pst.setInt(2, menuID);
			rs = pst.executeQuery();
			if(rs.next()) {
				objFavourite = new Favourite(rs.getInt("Id"),
						new Menu(rs.getInt("MenuID")), new User(rs.getInt("UserID")),
						rs.getString("fname"), rs.getInt("Quantum"), rs.getTimestamp("CreateDate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return objFavourite;
	}


}
