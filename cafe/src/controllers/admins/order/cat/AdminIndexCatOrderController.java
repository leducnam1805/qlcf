package controllers.admins.order.cat;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.CatOrderDAO;
import models.CatOrder;

public class AdminIndexCatOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminIndexCatOrderController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CatOrderDAO catOrderDAO = new CatOrderDAO();
		
		List<CatOrder> catOrderList = catOrderDAO.findAll();
		request.setAttribute("catOrderList", catOrderList);
		
		RequestDispatcher rd = request.getRequestDispatcher("/views/admins/order/cat/index.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		CatOrderDAO catOrderDAO = new CatOrderDAO();
		String nameCreate = request.getParameter("nameCreate");
		CatOrder catOrder = new CatOrder(nameCreate);
		int saveCatOrder = catOrderDAO.save(catOrder);
		if(saveCatOrder > 0) {
			response.sendRedirect(request.getContextPath()+"/admin/order/cat?msg=OK");
		}else {
			response.sendRedirect(request.getContextPath()+"/admin/order/cat?msg=ERROR");
		}
		
	}

}
