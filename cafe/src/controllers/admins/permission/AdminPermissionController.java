package controllers.admins.permission;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.PermissionDAO;
import models.CatUser;
import models.Permission;

public class AdminPermissionController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminPermissionController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PermissionDAO permissionDAO = new PermissionDAO();
		
		List<Permission> permissionList = permissionDAO.findAll();
		request.setAttribute("permissionList", permissionList);
		
		
		RequestDispatcher rd = request.getRequestDispatcher("/views/admins/permission/index.jsp");
		rd.forward(request, response);
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
		
		Permission permission = new Permission(0, new CatUser(perID), giatri, false, false);
		int addPer = permissionDAO.addPer(permission);
		if(addPer > 0) {
			System.out.println("Thành công.!");
			response.sendRedirect(request.getContextPath()+"/admin/permission");
			return;
		}else {
			System.out.println("thất bại");
		}
		
		
	}

}
