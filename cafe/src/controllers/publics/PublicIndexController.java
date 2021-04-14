package controllers.publics;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.MenuDAO;
import daos.ProductDAO;
import models.Menu;
import models.Product;

public class PublicIndexController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PublicIndexController() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		MenuDAO menuDao = new MenuDAO();
		List<Menu> menuList = menuDao.findAll();
		request.setAttribute("menuList", menuList);

		ProductDAO productDAO = new ProductDAO();
		List<Product> productNews = productDAO.findAllNews();
		request.setAttribute("productNews", productNews);

		List<Product> productList = productDAO.findAll();
		request.setAttribute("productList", productList);

		List<Menu> menuListSearch = menuDao.findAllSearch();
		request.setAttribute("menuListSearch", menuListSearch);

		RequestDispatcher rd = request.getRequestDispatcher("/views/publics/index.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
