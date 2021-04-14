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

public class AdminIndexUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminIndexUserController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CatUserDAO catUserDAO = new CatUserDAO();
		List<CatUser> catUserList = catUserDAO.findAll();
		request.setAttribute("catUserList", catUserList);
		
		UserDAO userDAO = new UserDAO();
		List<User> userList = userDAO.findAll();
		request.setAttribute("userList", userList);
		RequestDispatcher rd = request.getRequestDispatcher("/views/admins/user/index.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		UserDAO userDAO = new UserDAO();
		
		String fullname = request.getParameter("fullname");
		int phone = 0;
		try {
			phone = Integer.parseInt(request.getParameter("phone"));
		} catch (NumberFormatException e) {
			return;
		}
		String email = request.getParameter("email");
		String address = request.getParameter("adress");
		int catuser = 0;
		try {
			catuser = Integer.parseInt(request.getParameter("catuser"));
		} catch (NumberFormatException e) {
			// TODO: handle exception
		}
		User user = new User(fullname, phone, email, address, new CatUser(catuser));
		User checkEmail = userDAO.checkEmail(user);
		if(checkEmail != null) {
			System.out.println("Email đã tồn tại");
		}else {
			int add = userDAO.add(user);
			if(add > 0) {
				response.sendRedirect(request.getContextPath()+"/admin/user?msg=OK");
			}
			else {
				response.sendRedirect(request.getContextPath()+"/admin/user?msg=ERROR");
			}
		}
		
	}

}
