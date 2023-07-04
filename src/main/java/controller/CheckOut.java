package controller;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BookDAO;
import dao.OrderDAO;
import dao.OrderDetailDAO;
import model.Book;
import model.Item;
import model.OrderDetail;
import model.Orders;
import model.User;

@WebServlet("/checkOut")
public class CheckOut extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CheckOut() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		User user = (User)session.getAttribute("user");
		if(user == null) {
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		else {
			String from = request.getParameter("from");
			if(from.equals("cart.jsp")) {
				prepareCheckOut(request, response, session);
				return;
			}
			if(from.equals("checkout.jsp")) {
				checkout(request, response, session);
				return;
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	protected void prepareCheckOut(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {
		List<Item> bookInCart = (List<Item>) session.getAttribute("bookInCart");
		int total = 0;
		for(Item i : bookInCart) {
			String amount_book_id = request.getParameter("amount-"+i.getBook_id());
			i.setAmount(Integer.valueOf(amount_book_id));
			total+= i.getAmount()*i.getPrice();
		}
		session.setAttribute("bookInCart", bookInCart);
		request.setAttribute("temp_total", total);
		
		User user = (User)session.getAttribute("user");
		if(user.getAddress() == null) {
			request.setAttribute("message_address", "Bạn cần cập nhật địa chỉ");
			request.getRequestDispatcher("account.jsp").forward(request, response);
			return;
		}
//		response.sendRedirect("checkout.jsp");
		request.getRequestDispatcher("checkout.jsp").forward(request, response);
	}
	
	protected void checkout(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {
		List<Item> bookInCart = (List<Item>) session.getAttribute("bookInCart");
		Integer total = 0;
		for(Item i : bookInCart) {
			total+= i.getAmount()*i.getPrice();
		}
		request.setAttribute("temp_total", total);
		String note = request.getParameter("type");
		
		//  add order, order detail, delete session.bookInCart
		User user = (User) session.getAttribute("user");
		Orders order = new Orders(user, Date.valueOf(LocalDate.now()), user.getAddress(), user.getPhone(), total, note, "Đang giao hàng");
		OrderDAO.getInstance().insert(order);
		for(Item i : bookInCart) {
			Book book = BookDAO.getInstance().selectById(i.getBook_id());
			OrderDetail orderdetail = new OrderDetail(order, book, i.getAmount(), i.getPrice());
			OrderDetailDAO.getInstance().insert(orderdetail);
		}
		List<Item> bookInCartTemp = bookInCart;
		request.setAttribute("bookInCartTemp", bookInCartTemp);
		session.setAttribute("amount", 0);
		session.setAttribute("bookInCart", new ArrayList<Item>());
		List<Orders> orders = OrderDAO.getInstance().selectByUserId(user.getUser_id());
		session.setAttribute("orders", orders);
		request.getRequestDispatcher("payment.jsp").forward(request, response);
	}
	

}
