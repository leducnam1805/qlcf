package utils;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspWriter;

import daos.MenuDAO;
import models.Menu;

public class MenuUtil {
	
	public static void ShowMenu(int parentID,HttpServletRequest request, JspWriter out) throws IOException {
		MenuDAO menuDAO = new MenuDAO();
		List<Menu> menuList = menuDAO.findParentID(parentID);
		if(menuList.size() > 0) {
			out.println("<ul class=\"dropdown-menu\">");
			for(Menu objMenu : menuList) {
				String url = request.getContextPath()+"/detail?id="+objMenu.getId();
				out.println("<li><a href=\""+url+"\">"+objMenu.getName()+"</a>");
				ShowMenu(objMenu.getId(), request, out);
			}
			out.println("</ul>");
		}else {
			out.println("</li>");
		}
	}
	
}
