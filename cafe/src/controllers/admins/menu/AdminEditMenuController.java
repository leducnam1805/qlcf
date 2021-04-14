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

public class AdminEditMenuController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminEditMenuController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MenuDAO menuDAO = new MenuDAO();
		int id = 0;
		try {
			id = Integer.parseInt(request.getParameter("id"));
		} catch (NumberFormatException e) {
			return;
		}
		Menu menu = menuDAO.findByID(id);
		request.setAttribute("objMenuFindByID", menu);
		
		List<Menu> menuList = menuDAO.findAll();
		request.setAttribute("menuList", menuList);
		
		RequestDispatcher rd = request.getRequestDispatcher("/views/admins/menu/edit.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		MenuDAO menuDAO = new MenuDAO();
		
		int idmenu = 0;
		try {
			idmenu = Integer.parseInt(request.getParameter("idmenu"));
		} catch (NumberFormatException e) {
			return;
		}
		
		String nameCreate = request.getParameter("nameCreate");
		Menu menu = new Menu(idmenu,nameCreate);
		Menu check = menuDAO.findNameCreate(menu);
		if(check != null) {
			response.sendRedirect(request.getContextPath()+"/admin/menu/edit?msg=ERROR");
		}else {
			int update = menuDAO.update(menu);
			if(update > 0) {
				response.sendRedirect(request.getContextPath()+"/admin/menu?msg=OK");
			}else {
				response.sendRedirect(request.getContextPath()+"/admin/menu?msg=ERROR");
				return;
			}
		}
	}

}
