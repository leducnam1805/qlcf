package controllers.admins.permission;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.PermissionDAO;
import models.CatUser;
import models.Permission;

public class AdminPermissionDelController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminPermissionDelController() {
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
		
		PermissionDAO permissionDAO = new PermissionDAO();
		
		int perID = 0;
		try {
			perID = Integer.parseInt(request.getParameter("perID"));
		} catch (NumberFormatException e) {
			System.out.println("Lỗi ");
			return;
		}
		Boolean giatri = Boolean.parseBoolean(request.getParameter("giatri"));
		
		Permission permission = new Permission(0, new CatUser(perID),false , false, giatri);
		int delPer = permissionDAO.delPer(permission);
		if(delPer > 0) {
			System.out.println("Thành công.!");
			response.sendRedirect(request.getContextPath()+"/admin/permission");
			return;
		}else {
			System.out.println("thất bại");
		}
		
		
	}

}
