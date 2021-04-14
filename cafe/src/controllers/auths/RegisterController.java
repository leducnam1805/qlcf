package controllers.auths;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.UserDAO;
import models.User;

public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegisterController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		RequestDispatcher rd = request.getRequestDispatcher("/views/auths/register.jsp");
		rd.forward(request, response);
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		UserDAO userDAO = new UserDAO();
		String fullname = request.getParameter("fullname");
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		
		User user = new User(fullname, pass, email);
		User checkEmail = userDAO.checkEmail(user);
		if(checkEmail != null) {
			response.sendRedirect(request.getContextPath()+"/register?msg=ERROR");
		}else {
			int register = userDAO.register(user);
			if(register > 0) {
				response.sendRedirect(request.getContextPath()+"/login?msg=OK");
			}
		}
	}

}
