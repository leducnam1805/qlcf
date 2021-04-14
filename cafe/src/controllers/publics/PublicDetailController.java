package controllers.publics;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.CommentDAO;
import daos.FavouriteDAO;
import daos.MenuDAO;
import daos.ProductDAO;
import daos.RateDAO;
import models.Comment;
import models.Favourite;
import models.Menu;
import models.Product;
import models.Rate;

public class PublicDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PublicDetailController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		MenuDAO menuDao = new MenuDAO();
		List<Menu> menuList = menuDao.findAll();
		request.setAttribute("menuList", menuList);
		
		ProductDAO productDAO = new ProductDAO();
		int id = 0;
		try {
			id = Integer.parseInt(request.getParameter("id"));
		} catch (NumberFormatException e) {
			return;
		}
		Product objProduct = productDAO.viewsID(id);
		request.setAttribute("objProduct", objProduct);
		if(objProduct == null) {
			response.sendRedirect(request.getContextPath()+"/index");
			return;
		}
		List<Product> objProductListMenuID = productDAO.viewsMenuID(objProduct);
		request.setAttribute("objProductListMenuID", objProductListMenuID);
		
		FavouriteDAO favouriteDAO = new FavouriteDAO();
		List<Favourite> favouriteList = favouriteDAO.findAllViews(id);
		request.setAttribute("favouriteList", favouriteList);
		
		CommentDAO commentDAO = new CommentDAO();
		List<Comment> commentList = commentDAO.findAll2(id);
		request.setAttribute("commentList", commentList);
		
		RateDAO rateDAO = new RateDAO();
		Rate rate = rateDAO.findOneRate(id);
		request.setAttribute("rate", rate);
		
		RequestDispatcher rd = request.getRequestDispatcher("/views/publics/detail.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
