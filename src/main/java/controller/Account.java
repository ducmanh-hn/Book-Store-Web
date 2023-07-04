package controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import model.User;

@WebServlet("/account")
public class Account extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Account() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String typeUpdate = request.getParameter("typeUpdate");
		if(typeUpdate.equals("changeInfo")) {
			changeInfo(request, response);
		}
		if(typeUpdate.equals("changeAddress")) {
			changeAddress(request,response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	protected void changeInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fullname = request.getParameter("fullname");
		String day = request.getParameter("day");
		String month = request.getParameter("month");
		String year = request.getParameter("year");
		String gender = request.getParameter("gender");
		
		HttpSession session = request.getSession(true);
		User user = (User)session.getAttribute("user");
		if(user == null) {
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		else {
			user.setName(fullname);
			if(!day.equals("0") && !month.equals("0") && !year.equals("0")) {
				Date date = Date.valueOf(year+"-"+month+"-"+day);
				user.setDateOfBirth(date);
			}
			user.setGender(gender);
			UserDAO.getInstance().update(user);
			request.setAttribute("message", "Cập nhật thông tin thành công");
			request.getRequestDispatcher("account.jsp").forward(request, response);
		}
	}
	protected void changeAddress(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String province = request.getParameter("province");
		String district = request.getParameter("district");
		String commune = request.getParameter("commune");
		String address_details = request.getParameter("address-details");
		
		HttpSession session = request.getSession(true);
		User user = (User)session.getAttribute("user");
		if(user == null) {
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		else {
			String address = address_details +", "+commune +", "+ district +", "+province;
			user.setAddress(address);
			UserDAO.getInstance().update(user);
			request.setAttribute("message", "Cập nhật thông tin thành công");
			request.getRequestDispatcher("account.jsp").forward(request, response);
		}
	}

}
