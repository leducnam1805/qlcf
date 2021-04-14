package controllers.publics;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.RateDAO;
import models.Menu;
import models.Rate;
import models.User;

public class PublicRatingController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PublicRatingController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RateDAO rateDAO = new RateDAO();
		int numberRating = 0;
		int idUserComment = 0;
		int productID = 0;
		try {
			numberRating = Integer.parseInt(request.getParameter("numberRating"));
			idUserComment = Integer.parseInt(request.getParameter("idUserComment"));
			productID = Integer.parseInt(request.getParameter("productID"));
		} catch (NumberFormatException e) {
			return;
		}
		
		Rate objRateID = rateDAO.findOneRateLast();
		int countID = rateDAO.countID();
		int quantum = objRateID.getQuantum() + numberRating;
		int quantity = countID+1;
		float totalRating = (float)quantum / (float)quantity;
		
		Rate rate = new Rate(new Menu(productID), numberRating,quantum,totalRating,new User(idUserComment));
		Rate checkUserID = rateDAO.checkUserID(rate);
		if(checkUserID == null) {
			rateDAO.save(rate);
		}else {
			System.out.println("Đã đánh giá");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
