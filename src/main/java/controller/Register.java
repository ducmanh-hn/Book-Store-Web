package controller;

import model.Role;
import model.User;
import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.RoleDAO;
import dao.UserDAO;

@WebServlet("/register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		Role user_role = RoleDAO.getInstance().selectById(2);  // id 1: admin ; 2:user
		User user = new User("User",Date.valueOf("2000-01-01"),phone,"Nam",null,email,password,user_role);
		boolean isInsert = UserDAO.getInstance().insert(user);
		if(!isInsert) {
			request.setAttribute("message", "Email đã tồn tại");
			request.setAttribute("email", email);
			request.setAttribute("phone", phone);
			request.setAttribute("password", password);
			request.getRequestDispatcher("register.jsp").forward(request, response);
		}
		else {
			request.setAttribute("email", email);
			request.setAttribute("registerSuccess", "Chúc mừng bạn đã đăng ký thành công");
			request.getRequestDispatcher("login.jsp").forward(request, response);
			
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
