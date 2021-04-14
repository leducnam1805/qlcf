package controllers.admins.user.cat;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.CatUserDAO;
import models.CatUser;

public class AdminEditCatUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminEditCatUserController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CatUserDAO catUserDAO = new CatUserDAO();
		int id = 0;
		try {
			id = Integer.parseInt(request.getParameter("id"));
		} catch (NumberFormatException e) {
			return;
		}
		CatUser catUser = catUserDAO.findById(id);
		request.setAttribute("catUser", catUser);
		RequestDispatcher rd = request.getRequestDispatcher("/views/admins/user/cat/edit.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		CatUserDAO catUserDAO = new CatUserDAO();
		int idCatUser = 0;
		try {
			idCatUser =  Integer.parseInt(request.getParameter("idCatUser"));
		} catch (NumberFormatException e) {
			return;
		}
		String nameCreate = request.getParameter("nameCreate");
		CatUser catUser = new CatUser(idCatUser, nameCreate);
		CatUser findCatUserEdit = catUserDAO.finCatUserEdit(catUser);
		if(findCatUserEdit != null){
			response.sendRedirect(request.getContextPath()+"/admin/user/cat/edit?msg=ERROR");
		}else {
			int update = catUserDAO.update(catUser);
			if(update > 0) {
				response.sendRedirect(request.getContextPath()+"/admin/user/cat?msg=OK");
			}else {
				response.sendRedirect(request.getContextPath()+"/admin/user/cat/edit?msg=ERROR");
				return;
			}
		}
	}

}
