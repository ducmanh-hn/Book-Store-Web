package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.OrderDAO;
import dao.UserDAO;
import model.Item;
import model.Orders;
import model.User;


@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		if(email.equals("")) {
			request.setAttribute("message", "Tên đăng nhập hoặc mật khẩu không chính xác");
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		}
		User user = UserDAO.getInstance().selectByEmail(email);

		if(user != null) {
			if(user.getPassword().equals(password)) {
				HttpSession session = request.getSession();
				session.setAttribute("user",user);
				session.setAttribute("day", user.getDateOfBirth().getDate());
				session.setAttribute("month", user.getDateOfBirth().getMonth()+1);
				session.setAttribute("year", user.getDateOfBirth().getYear()+1900);
				session.setAttribute("amount", 0);
				List<Item> bookInCart = new ArrayList<Item>();
				session.setAttribute("bookInCart", bookInCart);
				List<Orders> orders = OrderDAO.getInstance().selectByUserId(user.getUser_id());
				session.setAttribute("orders", orders);
				request.getRequestDispatcher("home").forward(request, response);
			}
			else {
				request.setAttribute("message", "Mật khẩu không chính xác");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		}
		else {
			request.setAttribute("message", "Tên đăng nhập hoặc mật khẩu không chính xác");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
