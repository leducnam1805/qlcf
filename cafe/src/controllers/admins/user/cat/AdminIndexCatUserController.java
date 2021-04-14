package controllers.admins.user.cat;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.CatUserDAO;
import daos.PermissionDAO;
import models.CatUser;
import models.Permission;

public class AdminIndexCatUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminIndexCatUserController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CatUserDAO catUserDAO = new CatUserDAO();
		List<CatUser> catUserList = catUserDAO.findAll();
		request.setAttribute("catUserList", catUserList);
		RequestDispatcher rd = request.getRequestDispatcher("/views/admins/user/cat/index.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		CatUserDAO catUserDAO = new CatUserDAO();
		
		String nameCreate = request.getParameter("nameCreate");
		CatUser catUser = new CatUser(nameCreate);
		CatUser check = catUserDAO.findNameCreate(catUser);
		if(check != null) {
			return;
		}else {
			int add = catUserDAO.add(catUser);
			if(add > 0) {
				PermissionDAO permissionDAO = new PermissionDAO();
				Permission permission = new Permission(0, new CatUser(add), false, false, false);
				int addPerCatUser = permissionDAO.addPerCatUser(permission);
				response.sendRedirect(request.getContextPath()+"/admin/user/cat?msg=OK");
			}else {
			}
		}
	}

}
