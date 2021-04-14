package controllers.admins.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.CatUserDAO;
import daos.UserDAO;
import models.CatUser;
import models.User;

public class AdminEditUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminEditUserController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserDAO userDAO = new UserDAO();
		int id = 0;
		try {
			id = Integer.parseInt(request.getParameter("id"));
		} catch (NumberFormatException e) {
			return;
		}
		User user = userDAO.findById(id);
		request.setAttribute("user", user);
		
		CatUserDAO catUserDAO = new CatUserDAO();
		List<CatUser> catUser = catUserDAO.findAll();
		request.setAttribute("catUser", catUser);
		RequestDispatcher rd = request.getRequestDispatcher("/views/admins/user/edit.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		UserDAO userDAO = new UserDAO();
		int idmenu = 0;
		try {
			idmenu = Integer.parseInt(request.getParameter("idmenu"));
		} catch (NumberFormatException e) {
			return;
		}
		String expass = request.getParameter("expass");
		if(expass == null || "".equals(expass)) {
			User checkPass = userDAO.findById(idmenu);
			expass = checkPass.getPass();
		}
		int exphone = 0;
		try {
			exphone = Integer.parseInt(request.getParameter("exphone"));
		} catch (NumberFormatException e) {
			return;
		}
		String exemail = request.getParameter("exemail");
		String exaddress = request.getParameter("exaddress");
		int catUserID = 0;
		try {
			catUserID = Integer.parseInt(request.getParameter("catUserID"));
		} catch (NumberFormatException e) {
			return;
		}
		User user = new User(idmenu, null, expass, exphone, exemail, exaddress,new CatUser(catUserID));
		int update = userDAO.update(user);
		if(update > 0) {
			response.sendRedirect(request.getContextPath()+"/admin/user?msg=OK");
		}else {
			response.sendRedirect(request.getContextPath()+"/admin/user?msg=ERROR");
		}
	}

}
