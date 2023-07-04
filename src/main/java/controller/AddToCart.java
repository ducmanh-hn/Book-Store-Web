package controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BookDAO;
import model.User;
import model.Item;
import model.Book;
import java.util.List;
@WebServlet("/addToCart")
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddToCart() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		User user = (User)session.getAttribute("user");
		
		if(request.getParameter("remove") !=null) {
			RemoveFromCart(request, response, request.getParameter("book_id"));
			return;
		}

		if(user == null) {
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		else {			
			List<Item> bookInCart = (List<Item>) session.getAttribute("bookInCart");
			
			String book_id = request.getParameter("book_id");
			String pd_amount =request.getParameter("pd_amount");
			if(pd_amount == null) pd_amount="1";
			
			Book book = BookDAO.getInstance().selectById(Integer.valueOf(book_id));
			String picture = book.getPicture().replace("280x280", "w78");
			Item item = new Item(book.getBook_id(), book.getName(), book.getPrice(), book.getDiscount_price(), Integer.valueOf(pd_amount), picture);
			
			int index = bookInCart.indexOf(item);

			if(index == -1) {
				bookInCart.add(item);				
			}
			else {
				int oldAmount = bookInCart.get(index).getAmount();
				bookInCart.get(index).setAmount(oldAmount+ Integer.valueOf(pd_amount));
			}
			session.setAttribute("bookInCart", bookInCart);
			session.setAttribute("amount", bookInCart.size());
			String from = request.getParameter("from");  // from từ HomPage.jsp or product_detail.jsp
			if(from!=null) {
				request.setAttribute("addSuccess", "Đã thêm sản phẩm vào giỏ hàng");
				request.getRequestDispatcher("product").forward(request, response);
			}
			else {
//				request.getRequestDispatcher("home").forward(request, response);
				response.sendRedirect("home");
			}
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	protected void RemoveFromCart(HttpServletRequest request, HttpServletResponse response, String book_id) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		List<Item> bookInCart = (List<Item>) session.getAttribute("bookInCart");
		Item item = new Item();
		item.setBook_id(Integer.valueOf(book_id));
		bookInCart.remove(item);
		
		session.setAttribute("bookInCart", bookInCart);
		session.setAttribute("amount", bookInCart.size());
		request.getRequestDispatcher("cart.jsp").forward(request, response);
	}

}
