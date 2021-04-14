package daos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Menu;
import models.Product;
import utils.DBConnectionUtil;

public class ProductDAO extends AbstractDAO {

	public List<Product> findAll() {
		con = DBConnectionUtil.getConnection();
		List<Product> productList = new ArrayList<Product>();
		String sql = "SELECT * FROM product" 
		+ " INNER JOIN menu ON product.MenuID = menu.Id";
		Product objProduct = null;
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				objProduct = new Product(rs.getInt("id"),
						new Menu(rs.getInt("MenuID"), rs.getString("Name"), rs.getInt("ParentID")),
						rs.getString("Image"),rs.getLong("Price"),
						rs.getString("Detail"), rs.getString("Description"),rs.getTimestamp("CreateDate"));
				productList.add(objProduct);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return productList;
	}

	public int add(Product product) {
		int result = 0;
		con = DBConnectionUtil.getConnection();
		String sql = "INSERT INTO product(MenuID,Image,Price,Detail,Description) VALUE(?,?,?,?,?)";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, product.getMenu().getId());
			pst.setString(2, product.getImage());
			pst.setLong(3, product.getPrice());
			pst.setString(4, product.getDetail());
			pst.setString(5, product.getDescription());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	public Product findMenuProduct(Product product) {
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM product" + " INNER JOIN menu ON product.MenuID = menu.id" + " WHERE MenuID = ?";
		Product objProduct = null;
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, product.getMenu().getId());
			rs = pst.executeQuery();
			if (rs.next()) {
				objProduct = new Product(rs.getInt("id"),
						new Menu(rs.getInt("MenuID"), rs.getString("name"), rs.getInt("ParentID")),
						rs.getString("Image"),rs.getLong("Price"),
						rs.getString("Detail"), rs.getString("Description"),rs.getTimestamp("CreateDate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return objProduct;
	}

	public Product viewsID(int id) {
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM product"
				+ " INNER JOIN menu ON product.MenuID = menu.Id"
				+ " WHERE menu.Id = ?";
		Product objProduct = null;
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if(rs.next()) {
				objProduct = new Product(rs.getInt("Id"),
						new Menu(rs.getInt("MenuID"), rs.getString("Name"), rs.getInt("ParentID")),
						rs.getString("Image"),rs.getLong("Price"),
						rs.getString("Detail"), rs.getString("Description"),rs.getTimestamp("CreateDate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return objProduct;
	}

	public List<Product> findAllNews() {
		con = DBConnectionUtil.getConnection();
		List<Product> productList = new ArrayList<Product>();
		String sql = "SELECT * FROM product" 
		+ " INNER JOIN menu ON product.MenuID = menu.Id"
		+ " ORDER BY product.Id DESC"
		+ " LIMIT 10";
		Product objProduct = null;
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				objProduct = new Product(rs.getInt("id"),
						new Menu(rs.getInt("MenuID"), rs.getString("Name"), rs.getInt("ParentID")),
						rs.getString("Image"),rs.getLong("Price"),
						rs.getString("Detail"), rs.getString("Description"),rs.getTimestamp("CreateDate"));
				productList.add(objProduct);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return productList;
	}

	public List<Product> viewsMenuID(Product objProduct2) {
		con = DBConnectionUtil.getConnection();
		List<Product> objProductListMenuID = new ArrayList<Product>();
		String sql = "SELECT * FROM product" 
		+ " INNER JOIN menu ON product.MenuID = menu.Id"
		+ " WHERE menu.ParentID = ? AND menu.Id !=?"
		+ " ORDER BY product.Id DESC";
		Product objProduct = null;
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, objProduct2.getMenu().getParentID());
			pst.setInt(2, objProduct2.getMenu().getId());
			rs = pst.executeQuery();
			while (rs.next()) {
				objProduct = new Product(rs.getInt("id"),
						new Menu(rs.getInt("MenuID"), rs.getString("Name"), rs.getInt("ParentID")),
						rs.getString("Image"),rs.getLong("Price"),
						rs.getString("Detail"), rs.getString("Description"),rs.getTimestamp("CreateDate"));
				objProductListMenuID.add(objProduct);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return objProductListMenuID;
	}

	public Product findById(int id) {
		Product product = null;
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM product" 
				+ " INNER JOIN menu ON product.MenuID = menu.Id"
				+ " WHERE product.Id = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if(rs.next()) {
				product = new Product(rs.getInt("Id"),
						new Menu(rs.getInt("MenuID"), rs.getString("Name"), rs.getInt("ParentID")),
						rs.getString("Image"), rs.getLong("Price"), rs.getString("Detail"), 
						rs.getString("Description"), rs.getTimestamp("CreateDate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return product;
	}

	public int updadte(Product product) {
		con = DBConnectionUtil.getConnection();
		String sql = "UPDATE product SET Price = ?,Image = ?,Detail = ?,Description = ? WHERE Id = ?";
		int result = 0;
		try {
			pst = con.prepareStatement(sql);
			pst.setLong(1, product.getPrice());
			pst.setString(2, product.getImage());
			pst.setString(3, product.getDetail());
			pst.setString(4, product.getDescription());
			pst.setInt(5, product.getId());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

}
