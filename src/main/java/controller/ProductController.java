package controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookDAO;
import dao.GalleryDAO;
import model.Book;
import model.Gallery;

@WebServlet("/product")
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProductController() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DecimalFormat formatter = new DecimalFormat("###,###");
		request.setAttribute("formatter", formatter);
		loadBook(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	protected void loadBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String book_id = request.getParameter("book_id");
		
		Book book = BookDAO.getInstance().selectById(Integer.valueOf(book_id));
		request.setAttribute("book", book);
		
		List<Gallery> list_gallery = GalleryDAO.getInstance().selectByBookId(Integer.valueOf(book_id));
		request.setAttribute("listG", list_gallery);

		List<Book> listSimilar = BookDAO.getInstance().select6SimilarBook(Integer.valueOf(book_id));
		request.setAttribute("listSimilar", listSimilar);
		
		request.getRequestDispatcher("product_detail.jsp").forward(request, response);
	}

}
