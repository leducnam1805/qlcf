package controllers.publics;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daos.ProductDAO;
import models.Item;
import models.OrderProduct;
import models.Product;

public class publicAddToCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public publicAddToCartController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		HttpSession sessionUserIF = request.getSession();
//		if (sessionUserIF.getAttribute("userInfor") == null) {
//			response.sendRedirect(request.getContextPath() + "/login");
//			return;
//		}
		ProductDAO productDao = new ProductDAO();
		int quantity = 1;
		int id = 0;
		try {
			id = Integer.parseInt(request.getParameter("id"));
			Product product = productDao.viewsID(id);
			if (product != null) {
				if (request.getParameter("quantity") != null) {
					quantity = Integer.parseInt(request.getParameter("quantity"));
				}
				HttpSession session = request.getSession();
				if (session.getAttribute("orderProduct") == null) {
					OrderProduct orderProduct = new OrderProduct();
					List<Item> itemList = new ArrayList<Item>();
					Item item = new Item();
					item.setQuantity(quantity);
					item.setProduct(product);
					item.setPrice(product.getPrice());;
					itemList.add(item);
					orderProduct.setItem(itemList);
					session.setAttribute("orderProduct", orderProduct);
				} else {
					OrderProduct orderProduct = (OrderProduct) session.getAttribute("orderProduct");
					List<Item> itemList = orderProduct.getItem();
					boolean check = false;
					for (Item item : itemList) {
						if (item.getProduct().getId() == product.getId()) {
							item.setQuantity(item.getQuantity()+quantity);
							check = true;
						}
					}
					if (check == false) {
						Item item = new Item();
						item.setQuantity(quantity);
						item.setProduct(product);
						item.setPrice(product.getPrice());
						itemList.add(item);
					}
					session.setAttribute("orderProduct", orderProduct);
				}
			}
			response.sendRedirect(request.getContextPath() + "/product/order");
		} catch (NumberFormatException e) {
			RequestDispatcher rd = request.getRequestDispatcher("/views/error/index.jsp");
			rd.forward(request, response);
			return;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
