package controllers.publics;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daos.CatOrderDAO;
import daos.ItemsDAO;
import daos.MenuDAO;
import daos.OrderProductDAO;
import models.CatOrder;
import models.Item;
import models.Menu;
import models.OrderProduct;
import models.Product;
import models.User;
import utils.SendMail;

public class publicOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public publicOrderController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MenuDAO menuDao = new MenuDAO();
		List<Menu> menuList = menuDao.findAll();
		request.setAttribute("menuList", menuList);
		
		CatOrderDAO catOrderDAO = new CatOrderDAO();
		List<CatOrder> catOrderList = catOrderDAO.findAll();
		request.setAttribute("catOrderList", catOrderList);
		
		HttpSession sesion = request.getSession();
		
		if(sesion.getAttribute("userInfor")!= null) {
			RequestDispatcher rd = request.getRequestDispatcher("/views/publics/order.jsp");
			rd.forward(request, response);
		}else {
			response.sendRedirect(request.getContextPath()+"/register");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		HttpSession httpSession = request.getSession();
		
		OrderProductDAO orderProductDAO = new OrderProductDAO();
		ItemsDAO  itemDAO = new ItemsDAO();
		
		CatOrderDAO catOrderDAO = new CatOrderDAO();
		int catOrderID = 0;
		try {
			catOrderID = Integer.parseInt(request.getParameter("catOrderID"));
		} catch (NumberFormatException e) {
			System.out.println("Lỗi ... catOrderID");
			return;
		}
		CatOrder catOrder = catOrderDAO.findByID(catOrderID);
		String catOrderName = catOrder.getName();
		
		int phone = 0;
		try {
			phone = Integer.parseInt(request.getParameter("phone"));
		} catch (NumberFormatException e) {
			System.out.println("Lỗi.. Phone");
			return;
		}
		int idUser = 0;
		try {
			idUser = Integer.parseInt(request.getParameter("idUser"));
		} catch (NumberFormatException e) {
			System.out.println("lỗi ... id");
			return;
		}
		String fullname = request.getParameter("fullname");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String productAllTong = request.getParameter("productAllTong");
		
		OrderProduct orderProduct = new OrderProduct(new User(idUser), productAllTong, new CatOrder(catOrderID));
		int addOrderProduct = orderProductDAO.addOrderProduct(orderProduct);
		if(addOrderProduct > 0) {
			//Lấy sản phẩm
			if(httpSession.getAttribute("orderProduct") != null) {
				OrderProduct orderProduct2 = (OrderProduct) httpSession.getAttribute("orderProduct");
				List<Item> itemList = (List<Item>) orderProduct2.getItem();
				if(itemList.size() > 0) {
					for(Item objItem : itemList) {
						int quantity = objItem.getQuantity();
						long price = objItem.getPrice();
						int productID = objItem.getProduct().getId();
						int orderID = addOrderProduct;
						
						Item item = new Item(new OrderProduct(orderID), new Product(productID), quantity, price);
						int addItem = itemDAO.add(item);
						if(addItem > 0) {
							String content = SendMail.emailContentOrder(itemList, fullname,phone);
							SendMail.send(catOrderName,phone, fullname, email, address,content);
							response.sendRedirect(request.getContextPath()+"/product/order?msg=SUCCESS");
							return;
						}else {
							System.out.println("Thất bại");
							return;
						}
					}
				}
			}
		}else {
			System.out.println("Thất bại");
			return;
		}
	}

}
