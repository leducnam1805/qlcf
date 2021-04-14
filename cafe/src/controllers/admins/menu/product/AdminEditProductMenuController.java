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
public class AdminEditProductMenuController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminEditProductMenuController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProductDAO productDAO = new ProductDAO();

		MenuDAO menuDAO = new MenuDAO();
		List<Menu> menuList = menuDAO.findAll();
		request.setAttribute("menuList", menuList);
		int id = 0;
		try {
			id = Integer.parseInt(request.getParameter("id"));
		} catch (NumberFormatException e) {
			return;
		}
		Product product = productDAO.findById(id);
		request.setAttribute("product", product);
		

		RequestDispatcher rd = request.getRequestDispatcher("/views/admins/menu/product/edit.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

		ProductDAO productDAO = new ProductDAO();

		int idproduct = Integer.parseInt(request.getParameter("idproduct"));
		String image = FileUtil.upload("picture", request);
		if("".equals(image) || image == null) {
			Product objProImage = productDAO.findById(idproduct);
			image = objProImage.getImage();
			System.out.println("image123: "+image);
		}else {
			System.out.println("image != null : "+image);
			Product objProImage = productDAO.findById(idproduct);
			String delfile = objProImage.getImage();
			FileUtil.delFile(delfile, request);
		}
		long price = Long.parseLong(request.getParameter("price"));
		//String price = request.getParameter("price");
		String description = request.getParameter("description");
		String detail = request.getParameter("editor1");

		Product product = new Product(idproduct, image, price, detail, description);
		int update = productDAO.updadte(product);
		if (update > 0) {
			response.sendRedirect(request.getContextPath()+"/admin/menu/product?msg=OK");
		} else {
			response.sendRedirect(request.getContextPath()+"/admin/menu/product?msg=ERROR");
		}
//		Product check = productDAO.findMenuProduct(product);
//		if (check != null) {
//			RequestDispatcher rd = request.getRequestDispatcher("/views/admins/menu/product/index.jsp");
//			rd.forward(request, response);
//		} else {
//			int add = productDAO.add(product);
//			if (add > 0) {
//				response.sendRedirect(request.getContextPath()+"/admin/menu/product?msg=OK");
//			} else {
//				response.sendRedirect(request.getContextPath()+"/admin/menu/product?msg=ERROR");
//			}
//		}
	}
}
