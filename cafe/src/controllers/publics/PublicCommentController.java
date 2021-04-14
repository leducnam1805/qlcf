package controllers.publics;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.CommentDAO;
import models.Comment;
import models.Menu;
import models.User;

public class PublicCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PublicCommentController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		CommentDAO commentDAO = new CommentDAO();
		
		int menuID = 0;
		try {
			menuID = Integer.parseInt(request.getParameter("productID"));
		} catch (NumberFormatException e) {
			return;
		}
		String comment = request.getParameter("comment");
		int idUserComment = 0;
		try {
			idUserComment = Integer.parseInt(request.getParameter("idUserComment"));
		} catch (NumberFormatException e) {
			return;
		}
		int sl = 1;
		int quantum = 0;
		quantum += sl;
		Comment objcomment = new Comment(new Menu(menuID), new User(idUserComment), comment, quantum);
		int add = commentDAO.addComment(objcomment);
		if(add > 0) {
			List<Comment> commentList = commentDAO.findAll();
			if(commentList.size() > 0) {
				for(Comment itemComment : commentList) {
					response.getWriter().print(
							"<div class=\"col-sm-3\">"+itemComment.getUser().getName()+"</div>"+
						    "<div class=\"col-sm-5\">"+itemComment.getName()+"</div>"+
						    "<div class=\"col-sm-3\">"+itemComment.getCreateDate()+"</div>"
							);
						}
					}
		}else {
			return;
		}
		
	}

}
