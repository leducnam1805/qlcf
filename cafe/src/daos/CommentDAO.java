package daos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.CatUser;
import models.Comment;
import models.Menu;
import models.User;
import utils.DBConnectionUtil;

public class CommentDAO extends AbstractDAO{

	public int addComment(Comment objcomment) {
		int result = 0;
		con = DBConnectionUtil.getConnection();
		String sql = "INSERT INTO comment(MenuID,UserID,Name,Quantum) VALUE(?,?,?,?)";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, objcomment.getMenu().getId());
			pst.setInt(2, objcomment.getUser().getId());
			pst.setString(3, objcomment.getName());
			pst.setInt(4, objcomment.getQuantum());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public List<Comment> findAll() {
		List<Comment> commentList = new ArrayList<Comment>();
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT *,comment.id AS cid,comment.Name AS cName,menu.Name As mName,user.Name AS uName FROM comment"
				+ " INNER JOIN menu ON comment.MenuID = menu.Id"
				+ " INNER JOIN user ON comment.UserID = user.Id"
				+ " ORDER BY comment.Id DESC";
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				Comment objComment = new Comment(rs.getInt("cid"),
						new Menu(rs.getInt("MenuID"), rs.getString("mName"), rs.getInt("ParentID")),
						new User(rs.getInt("UserID"), rs.getString("uName"), rs.getInt("Phone"),
								rs.getString("Email"), rs.getString("Address"), 
								new CatUser(rs.getInt("CatUserID"))),
						rs.getString("cName"), rs.getInt("Quantum"), rs.getTimestamp("CreateDate"));
				commentList.add(objComment);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return commentList;
	}
	public List<Comment> findAll2(int id) {
		List<Comment> commentList = new ArrayList<Comment>();
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT *,comment.id AS cid,comment.Name AS cName,menu.Name As mName,user.Name AS uName FROM comment"
				+ " INNER JOIN menu ON comment.MenuID = menu.Id"
				+ " INNER JOIN user ON comment.UserID = user.Id"
				+ " WHERE menu.Id = ?"
				+ " ORDER BY comment.Id DESC"
				+ " LIMIT 2";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			while(rs.next()) {
				Comment objComment = new Comment(rs.getInt("cid"),
						new Menu(rs.getInt("MenuID"), rs.getString("mName"), rs.getInt("ParentID")),
						new User(rs.getInt("UserID"), rs.getString("uName"), rs.getInt("Phone"),
								rs.getString("Email"), rs.getString("Address"), 
								new CatUser(rs.getInt("CatUserID"))),
						rs.getString("cName"), rs.getInt("Quantum"), rs.getTimestamp("CreateDate"));
				commentList.add(objComment);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return commentList;
	}

}
