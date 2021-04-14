package controllers.admins.order.cat;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.CatOrderDAO;
import models.CatOrder;

public class AdminEditCatOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminEditCatOrderController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CatOrderDAO catOrderDAO = new CatOrderDAO();
		
		int id = 0;
		try {
			id = Integer.parseInt(request.getParameter("id"));
		} catch (NumberFormatException e) {
			return;
		}
		CatOrder catOrder = catOrderDAO.findByID(id);
		request.setAttribute("catOrder", catOrder);
		RequestDispatcher rd = request.getRequestDispatcher("/views/admins/order/cat/edit.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		CatOrderDAO catOrderDAO = new CatOrderDAO();
		int idCatorder = 0;
		try {
			idCatorder = Integer.parseInt(request.getParameter("idCatorder"));
		} catch (NumberFormatException e) {
			return;
		}
		String nameCreate = request.getParameter("nameCreate");
		
		CatOrder checkName = catOrderDAO.checkName(nameCreate);
		if(checkName != null) {
			response.sendRedirect(request.getContextPath()+"/admin/order/cat?msg=ERROR");
			return;
		}
		
		CatOrder catOrder = new CatOrder(idCatorder,nameCreate);
		int update = catOrderDAO.update(catOrder);
		if(update > 0) {
			response.sendRedirect(request.getContextPath()+"/admin/order/cat?msg=OK");
		}else {
			response.sendRedirect(request.getContextPath()+"/admin/order/cat?msg=ERROR");
			return;
		}
		
	}

}
