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
import dao.CategoryDAO;
import model.Book;
import model.Category;

@WebServlet("/search")
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Search() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DecimalFormat formatter = new DecimalFormat("###,###");
		request.setAttribute("formatter", formatter);
		
		String info = request.getParameter("info-search");
		List<Book> book_search = BookDAO.getInstance().search(info);
		request.setAttribute("listBook", book_search);
		
		List<Category> category_list = CategoryDAO.getInstance().selectAll();
		request.setAttribute("listC", category_list);
		
		request.getRequestDispatcher("HomePage.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
