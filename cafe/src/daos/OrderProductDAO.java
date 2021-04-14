package daos;

import java.sql.SQLException;

import models.OrderProduct;
import utils.DBConnectionUtil;

public class OrderProductDAO extends AbstractDAO{

	public int addOrderProduct(OrderProduct orderProduct) {
		int result = 0;
		int idValue = 0;
		con = DBConnectionUtil.getConnection();
		String sql = "INSERT INTO orderproduct(UserID,Total,CatOrder) VALUE(?,?,?)";
		try {
			pst = con.prepareStatement(sql,st.RETURN_GENERATED_KEYS);
			pst.setInt(1, orderProduct.getUserID().getId());
			pst.setString(2, orderProduct.getTotal());
			pst.setInt(3, orderProduct.getCatOrder().getId());
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

}
