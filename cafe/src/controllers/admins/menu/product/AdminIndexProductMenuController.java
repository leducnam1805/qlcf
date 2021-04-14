package controllers.admins.menu.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.MenuDAO;
import daos.ProductDAO;
import models.Menu;
import models.Product;
import utils.FileUtil;

@MultipartConfig
public class AdminIndexProductMenuController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminIndexProductMenuController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProductDAO productDAO = new ProductDAO();
		List<Product> productList = productDAO.findAll();

		MenuDAO menuDAO = new MenuDAO();
		List<Menu> menuList = menuDAO.findAll();

		request.setAttribute("productList", productList);
		request.setAttribute("menuList", menuList);

		RequestDispatcher rd = request.getRequestDispatcher("/views/admins/menu/product/index.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

		ProductDAO productDAO = new ProductDAO();

		int menuID = Integer.parseInt(request.getParameter("menuID"));
		String image = FileUtil.upload("picture", request);
		long price = Long.parseLong(request.getParameter("price"));
		//String price = request.getParameter("price");
		String description = request.getParameter("description");
		String detail = request.getParameter("editor1");

		Product product = new Product(new Menu(menuID), image, price, detail, description);
		Product check = productDAO.findMenuProduct(product);
		if (check != null) {
			RequestDispatcher rd = request.getRequestDispatcher("/views/admins/menu/product/index.jsp");
			rd.forward(request, response);
		} else {
			int add = productDAO.add(product);
			if (add > 0) {
				response.sendRedirect(request.getContextPath()+"/admin/menu/product?msg=OK");
			} else {
				response.sendRedirect(request.getContextPath()+"/admin/menu/product?msg=ERROR");
			}
		}
	}
}
