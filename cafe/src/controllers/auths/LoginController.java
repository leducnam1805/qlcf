package controllers.auths;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daos.UserDAO;
import models.User;

public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		RequestDispatcher rd = request.getRequestDispatcher("/views/auths/login.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		UserDAO userDAO = new UserDAO();
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		
		User userIF = userDAO.findEmailPass(email,pass);
		if(userIF != null) {
			User objUser = userDAO.viewAll(email);
			if(objUser != null) {
				 HttpSession session = request.getSession(); 
				 session.setAttribute("userInfor",objUser);
				 response.sendRedirect(request.getContextPath()+"/index");
			}
		}else {
			response.sendRedirect(request.getContextPath()+"/login?msg=ERROR");
			return;
		}
		
	}

}
