package controllers.publics;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.FavouriteDAO;
import models.Favourite;
import models.Menu;
import models.User;

public class PublicFavouriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PublicFavouriteController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		FavouriteDAO favouriteDAO = new FavouriteDAO();

		int menutID = Integer.parseInt(request.getParameter("productID"));
		int userID = 0;
		try {
			userID = Integer.parseInt(request.getParameter("userID"));
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath()+"/login?msg=ERROR");
		}
		Favourite checkUserID = favouriteDAO.checkUserID(userID,menutID);
		if(checkUserID != null) {
			return;
		}
		String name = request.getParameter("iplike");
		int nblike = Integer.parseInt(request.getParameter("nblike"));
		int quantum = 1;
		quantum += nblike;
		Favourite favourite = new Favourite(new Menu(menutID), new User(userID), name, quantum);
		int add = favouriteDAO.add(favourite);
		if (add > 0) {
			response.sendRedirect(request.getContextPath()+"/detail?id="+menutID);
		} else {
			return;
		}
	}

}
