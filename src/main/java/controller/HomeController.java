package controller;
import java.util.List;

import model.Book;
import model.Category;

import java.io.IOException;
import java.text.DecimalFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookDAO;
import dao.CategoryDAO;

@WebServlet("/home")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public HomeController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		DecimalFormat formatter = new DecimalFormat("###,###");
		request.setAttribute("formatter", formatter);
		
		List<Category> category_list = CategoryDAO.getInstance().selectAll();
		request.setAttribute("listC", category_list);
		
		String cat_id = request.getParameter("cid");

		if (cat_id !=null) {
			loadBookByCategory(request, response, Integer.valueOf(cat_id));
		}
		else {
			loadAllData(request, response);			
		}
		request.getRequestDispatcher("HomePage.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	protected void loadAllData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		
		List<Book> book_list_all = BookDAO.getInstance().selectAll();
		request.setAttribute("listBook", book_list_all);		
	}
	protected void loadBookByCategory(HttpServletRequest request, HttpServletResponse response,Integer cid) throws ServletException, IOException {		
		
		List<Book> book_by_category = BookDAO.getInstance().selectByCategoryId(cid);
		request.setAttribute("listBook", book_by_category);
		
	}
	

}
