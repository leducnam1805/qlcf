package daos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.CatOrder;
import models.CatUser;
import models.Item;
import models.Menu;
import models.OrderProduct;
import models.Product;
import models.User;
import utils.DBConnectionUtil;

public class ItemsDAO extends AbstractDAO{

	public int add(Item item) {
		int result = 0;
		con = DBConnectionUtil.getConnection();
		String sql = "INSERT INTO item(OrderProductID,ProductID,Quantity,Price) VALUE(?,?,?,?)";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, item.getOrderProduct().getId());
			pst.setInt(2, item.getProduct().getId());
			pst.setInt(3, item.getQuantity());
			pst.setLong(4, item.getPrice());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<Item> findAll() {
		List<Item> itemList = new ArrayList<Item>();
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT *,item.id AS iId,item.Quantity AS iQuantity,"
				+ " item.Price AS iPrice, item.CreateDate AS iCrDate, item.LastUpdate AS iLaDate,"
				+ " product.id AS pId, product.Price AS pPrice, product.CreateDate AS pCrDate,"
				+ " menu.id AS mId, menu.Name AS mName,"
				+ " orderproduct.Id AS opId, orderproduct.Total AS opTotal, orderproduct.Status AS opStatus,"
				+ " orderproduct.CreateDate AS opCrDate, orderproduct.LastUpdate AS opLaUpdate,"
				+ " user.Id AS uId, user.Name AS uName,"
				+ " catuser.Id AS cuId, catuser.Name AS cuName,"
				+ " catorder.Id AS coId, catorder.Name AS coName"
				+ " FROM item"
				+ " INNER JOIN product ON item.ProductID = product.Id"
				+ " INNER JOIN menu ON product.MenuID = menu.Id"
				+ " INNER JOIN orderproduct ON item.OrderProductID = orderproduct.Id"
				+ " INNER JOIN user ON orderproduct.UserID = user.Id"
				+ " INNER JOIN catuser ON user.CatUserID = catuser.Id"
				+ " INNER JOIN catorder ON orderproduct.CatOrder = catorder.Id";
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				Item objItem = new Item(rs.getInt("iId"),
						new OrderProduct(rs.getInt("opId"),
								new User(rs.getInt("uId"), rs.getString("uName"), rs.getInt("Phone"),
										rs.getString("Email"), rs.getString("Address"),
										new CatUser(rs.getInt("cuId"), rs.getString("cuName"))),
								rs.getString("opTotal"), rs.getBoolean("opStatus"),
								rs.getTimestamp("opCrDate"), rs.getTimestamp("opLaUpdate"),
								new CatOrder(rs.getInt("coId"), rs.getString("coName"))),
						new Product(rs.getInt("pId"),
								new Menu(rs.getInt("mId"), rs.getString("mName"), rs.getInt("ParentID")),
								rs.getString("Image"), rs.getLong("pPrice"), rs.getString("Detail"),
								rs.getString("Description"), rs.getTimestamp("pCrDate")),
						rs.getInt("iQuantity"), rs.getLong("iPrice"),
						rs.getTimestamp("iCrDate"), rs.getTimestamp("iLaDate"));
				itemList.add(objItem);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return itemList;
	}

	public List<Item> findStaticDay(String dateq) {
		List<Item> itemList = new ArrayList<Item>();
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT *,item.id AS iId,item.Quantity AS iQuantity,"
				+ " item.Price AS iPrice, item.CreateDate AS iCrDate, item.LastUpdate AS iLaDate,"
				+ " product.id AS pId, product.Price AS pPrice, product.CreateDate AS pCrDate,"
				+ " menu.id AS mId, menu.Name AS mName,"
				+ " orderproduct.Id AS opId, orderproduct.Total AS opTotal, orderproduct.Status AS opStatus,"
				+ " orderproduct.CreateDate AS opCrDate, orderproduct.LastUpdate AS opLaUpdate,"
				+ " user.Id AS uId, user.Name AS uName,"
				+ " catuser.Id AS cuId, catuser.Name AS cuName,"
				+ " catorder.Id AS coId, catorder.Name AS coName"
				+ " FROM item"
				+ " INNER JOIN product ON item.ProductID = product.Id"
				+ " INNER JOIN menu ON product.MenuID = menu.Id"
				+ " INNER JOIN orderproduct ON item.OrderProductID = orderproduct.Id"
				+ " INNER JOIN user ON orderproduct.UserID = user.Id"
				+ " INNER JOIN catuser ON user.CatUserID = catuser.Id"
				+ " INNER JOIN catorder ON orderproduct.CatOrder = catorder.Id"
				+ " WHERE item.CreateDate LIKE ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, "%"+dateq+"%");
			rs = pst.executeQuery();
			while(rs.next()) {
				Item objItem = new Item(rs.getInt("iId"),
						new OrderProduct(rs.getInt("opId"),
								new User(rs.getInt("uId"), rs.getString("uName"), rs.getInt("Phone"),
										rs.getString("Email"), rs.getString("Address"),
										new CatUser(rs.getInt("cuId"), rs.getString("cuName"))),
								rs.getString("opTotal"), rs.getBoolean("opStatus"),
								rs.getTimestamp("opCrDate"), rs.getTimestamp("opLaUpdate"),
								new CatOrder(rs.getInt("coId"), rs.getString("coName"))),
						new Product(rs.getInt("pId"),
								new Menu(rs.getInt("mId"), rs.getString("mName"), rs.getInt("ParentID")),
								rs.getString("Image"), rs.getLong("pPrice"), rs.getString("Detail"),
								rs.getString("Description"), rs.getTimestamp("pCrDate")),
						rs.getInt("iQuantity"), rs.getLong("iPrice"),
						rs.getTimestamp("iCrDate"), rs.getTimestamp("iLaDate"));
				itemList.add(objItem);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return itemList;
	}

	public List<Item> findStaticWeek(String dateStart, String dateEnd) {
		List<Item> itemList = new ArrayList<Item>();
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT *,item.id AS iId,item.Quantity AS iQuantity,"
				+ " item.Price AS iPrice, item.CreateDate AS iCrDate, item.LastUpdate AS iLaDate,"
				+ " product.id AS pId, product.Price AS pPrice, product.CreateDate AS pCrDate,"
				+ " menu.id AS mId, menu.Name AS mName,"
				+ " orderproduct.Id AS opId, orderproduct.Total AS opTotal, orderproduct.Status AS opStatus,"
				+ " orderproduct.CreateDate AS opCrDate, orderproduct.LastUpdate AS opLaUpdate,"
				+ " user.Id AS uId, user.Name AS uName,"
				+ " catuser.Id AS cuId, catuser.Name AS cuName,"
				+ " catorder.Id AS coId, catorder.Name AS coName"
				+ " FROM item"
				+ " INNER JOIN product ON item.ProductID = product.Id"
				+ " INNER JOIN menu ON product.MenuID = menu.Id"
				+ " INNER JOIN orderproduct ON item.OrderProductID = orderproduct.Id"
				+ " INNER JOIN user ON orderproduct.UserID = user.Id"
				+ " INNER JOIN catuser ON user.CatUserID = catuser.Id"
				+ " INNER JOIN catorder ON orderproduct.CatOrder = catorder.Id"
				+ " WHERE item.CreateDate BETWEEN ? AND ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, dateStart);
			pst.setString(2, dateEnd);
			rs = pst.executeQuery();
			while(rs.next()) {
				Item objItem = new Item(rs.getInt("iId"),
						new OrderProduct(rs.getInt("opId"),
								new User(rs.getInt("uId"), rs.getString("uName"), rs.getInt("Phone"),
										rs.getString("Email"), rs.getString("Address"),
										new CatUser(rs.getInt("cuId"), rs.getString("cuName"))),
								rs.getString("opTotal"), rs.getBoolean("opStatus"),
								rs.getTimestamp("opCrDate"), rs.getTimestamp("opLaUpdate"),
								new CatOrder(rs.getInt("coId"), rs.getString("coName"))),
						new Product(rs.getInt("pId"),
								new Menu(rs.getInt("mId"), rs.getString("mName"), rs.getInt("ParentID")),
								rs.getString("Image"), rs.getLong("pPrice"), rs.getString("Detail"),
								rs.getString("Description"), rs.getTimestamp("pCrDate")),
						rs.getInt("iQuantity"), rs.getLong("iPrice"),
						rs.getTimestamp("iCrDate"), rs.getTimestamp("iLaDate"));
				itemList.add(objItem);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return itemList;
	}

}
