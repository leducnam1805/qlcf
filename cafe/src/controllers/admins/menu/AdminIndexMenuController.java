package controllers.admins.menu;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.MenuDAO;
import models.Menu;

public class AdminIndexMenuController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminIndexMenuController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		MenuDAO menuDao = new MenuDAO();
		List<Menu> menuList = menuDao.findAll();
		request.setAttribute("menuList", menuList);
		
		RequestDispatcher rd = request.getRequestDispatcher("/views/admins/menu/index.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		MenuDAO menuDAO = new MenuDAO();
		
		String nameCreate = request.getParameter("nameCreate");
		int parentIdCreate = 0;
		try {
			parentIdCreate = Integer.parseInt(request.getParameter("parentIdCreate"));
		} catch (NumberFormatException e) {
			System.out.println("lỗi: "+e);
		}
		Menu menu = new Menu(nameCreate, parentIdCreate);
		
		Menu check = menuDAO.findNameCreate(menu);
		if(check != null) {
			response.sendRedirect(request.getContextPath()+"/admin/menu?msg=ERROR");
		}else {
			int add = menuDAO.add(menu);
			if(add > 0) {
				response.sendRedirect(request.getContextPath()+"/admin/menu?msg=OK");
			}else {
				response.sendRedirect(request.getContextPath()+"/admin/menu?msg=ERROR");
				return;
			}
		}
		
	}

}
