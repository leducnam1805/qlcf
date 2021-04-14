package controllers.admins.statistic;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.ItemsDAO;
import models.Item;

public class AdminStatisticController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminStatisticController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ItemsDAO itemDAO = new ItemsDAO();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date = new java.util.Date();
		String dateq = sdf.format(date);

		List<Item> itemListDAY = itemDAO.findStaticDay(dateq);
		request.setAttribute("itemListDAY", itemListDAY);
		
		RequestDispatcher rd = request.getRequestDispatcher("/views/admins/statistics/index.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		ItemsDAO itemDAO = new ItemsDAO();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date = new java.util.Date();
		String dateq = sdf.format(date);
		
		List<Item> itemListDAY = itemDAO.findStaticDay(dateq);
		request.setAttribute("itemListDAY", itemListDAY);
		
		String datepickerStart = request.getParameter("datepickerStart");
		String[] startArr = datepickerStart.split("/");
		List<String> startList = Arrays.asList(startArr[2],startArr[1],startArr[0]);
		String dateStart = String.join("-",startList);
		
		String datepickerEnd = request.getParameter("datepickerEnd");
		String[] endArr = datepickerEnd.split("/");
		List<String> endList = Arrays.asList(endArr[2],endArr[1],endArr[0]);
		String dateEnd = String.join("-",endList);
		
		List<Item> itemListWeek = itemDAO.findStaticWeek(dateStart,dateEnd);
		if(itemListWeek.size() > 0) {
			int i = 0;
			int total = 0;
			for(Item objItemListWeek:itemListWeek) {
				i++;
				total = (int) (total + objItemListWeek.getPrice());
				response.getWriter().print(
					"<tr>"+
							"<th scope=\"row\">"+i+"</th>"+
							"<td>"+objItemListWeek.getOrderProduct().getUserID().getName()+"</td>"+
							"<td>"+objItemListWeek.getOrderProduct().getCatOrder().getName()+"</td>"+
							"<td>"+objItemListWeek.getProduct().getMenu().getName()+"</td>"+
							"<td>"+objItemListWeek.getQuantity()+"</td>"+
							"<td>"+objItemListWeek.getPrice()+"</td>"+
							"<td>"+objItemListWeek.getOrderProduct().getTotal()+" VNĐ</td>"+
					"</tr>"
					);
			}
			response.getWriter().print(
				"<tr>"+
						"<th colspan=\"6\" class=\"text-center\">Thành tiền:</th>"+
						"<td class=\"text-center productAllTong\">"+total+"</td>"+
				"</tr>"
				);
		}
	}

}
