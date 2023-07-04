package test;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.Format;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import dao.BookDAO;
import dao.CategoryDAO;
import dao.GalleryDAO;
import dao.OrderDAO;
import dao.OrderDetailDAO;
import dao.RoleDAO;
import dao.UserDAO;
import model.Book;
import model.Category;
import model.Gallery;
import model.OrderDetail;
import model.Orders;
import model.Role;
import model.User;
import util.HibernateUtil;

public class TestHibernate {
	public static void main(String[] args) {
		
//		Role role = new Role("admin");
//		Role role2 = new Role("user");
//		RoleDAO.getInstance().insert(role);
//		RoleDAO.getInstance().insert(role2);


		
//		Category c1 = new Category("Tiểu thuyết");
//		Category c2 = new Category("Tác phẩm kinh điển");
//		Category c3 = new Category("Sách kinh tế");
//		Category c4 = new Category("Sách kĩ năng sống");
//		Category c5 = new Category("Sách học ngoại ngữ");
//		Category c6 = new Category("Sách lịch sử");
//		Category c7 = new Category("Truyện cổ tích");
//		Category c8 = new Category("Truyện cười");
//		
//		CategoryDAO.getInstance().insert(c1);
//		CategoryDAO.getInstance().insert(c2);
//		CategoryDAO.getInstance().insert(c3);
//		CategoryDAO.getInstance().insert(c4);
//		CategoryDAO.getInstance().insert(c5);
//		CategoryDAO.getInstance().insert(c6);
//		CategoryDAO.getInstance().insert(c7);
//		CategoryDAO.getInstance().insert(c8);
		
		
//		Category c1 = CategoryDAO.getInstance().selectById(1);
//		Book book1 = new Book(c1, "", 0, 0, 0, null); //cate - name -price -discount - sold -des
//		book1.setDescription("");
//		BookDAO.getInstance().insert(book1);
//		
//		Book book2 = null;
//		book2 = BookDAO.getInstance().selectById();
//
//		Gallery g1 = new Gallery(null, book1);
//		Gallery g2 = new Gallery(null, book1);
//		Gallery g3 = new Gallery(null, book1);
//		Gallery g4 = new Gallery(null, book1);
//		Gallery g5 = new Gallery(null, book1);
//		g1.setThumbnail("https:");
//		g2.setThumbnail("https:");
//		g3.setThumbnail("https:");
//		g4.setThumbnail("https:");
//		g5.setThumbnail("https:");
//
//		GalleryDAO.getInstance().insert(g1);
//		GalleryDAO.getInstance().insert(g2);
//		GalleryDAO.getInstance().insert(g3);
//		GalleryDAO.getInstance().insert(g4);
//		GalleryDAO.getInstance().insert(g5);
// ============================================================
		
//		Category c1 = CategoryDAO.getInstance().selectById(2);
//		Book book = new Book(c1, "Đất Máu Sicily (Mario Puzo)", "Mario Puzo", 81100, 120000, 3792, null, null, null); //cate - name -price -discount - sold -des
//		book.setPicture("https://salt.tikicdn.com/cache/280x280/media/catalog/product/d/a/dat%20mau%20-%20bia%201.u335.d20160701.t101955.jpg");
//		book.setDescription("Đất Máu Sicily\r\n"
//				+ "\r\n"
//				+ "Sicily ngập tràn ánh mặt trời Địa Trung Hải, thoang thoảng hương cam chanh là xứ sở của núi non đẹp như tranh rải rác những phế tích lâu đời. Ở đó tầng lớp dân nghèo suốt nhiều thế kỉ phải chịu sự đè nén của nhiều thế lực tham lam và hà khắc, từ ngoại xâm đến phát-xít, từ các phe phái chính trị đến giới mafia và quý tộc địa phương. Ở đó những huyền thoại anh hùng xa xưa được truyền tụng như chỉ là mơ ước. Cho đến một ngày, xứ sở tươi đẹp và bạo tàn ấy đã sản sinh ra một nhân vật được xưng tụng là anh hùng của dân nghèo, là Robin Hood của nước Ý…\r\n"
//				+ "\r\n"
//				+ "Tác phẩm Đất máu Sicily của Mario Puzo dựng lên một thế giới chằng chịt những âm mưu và thù hận, bạo lực sinh bạo lực, phản trắc sinh phản trắc. Ở trung tâm của thế giới ấy là thủ lĩnh băng cướp Turi Guiliano được khắc họa đầy lãng mạn như một chiến binh, một người tình, và trên hết là một người Sicily từ trong máu thịt. Phải chăng một thiên sử thi mới đang được viết ra cho xứ sở khốn cùng này?\r\n"
//				+ "\r\n"
//				+ "Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....");
//
//
//		Gallery g1 = new Gallery(null, book);
//		Gallery g2 = new Gallery(null, book);
//		Gallery g3 = new Gallery(null, book);
//		Gallery g4 = new Gallery(null, book);
//		g1.setThumbnail("https://salt.tikicdn.com/cache/w1200/media/catalog/product/d/a/dat%20mau%20-%20bia%201.u335.d20160701.t101955.jpg");
//		g2.setThumbnail("https://salt.tikicdn.com/cache/750x750/ts/review/6e/53/31/8843a9eb7177a0d4cc83c6d62eb6a5a0.jpg.webp");
//		g3.setThumbnail("https://salt.tikicdn.com/cache/750x750/ts/review/4d/3e/d7/405d37f6ff3a174a2461362e4fe8ee04.jpg.webp");
//		g4.setThumbnail("https://salt.tikicdn.com/cache/750x750/ts/review/e5/85/0e/3f1394493f02773127f5530c9bd305cc.jpg.webp");
//
//		List<Gallery> list = new ArrayList<Gallery>();
//		list.add(g1);
//		list.add(g2);
//		list.add(g3);
//		list.add(g4);
//		book.setThumbnails(list);
//		BookDAO.getInstance().insert(book);
		
//		User u = UserDAO.getInstance().selectByEmail("manh@gmail.com");
//		Date date = Date.valueOf("2002-12-29");
//		u.setDateOfBirth(date);
//		
//		
//		System.out.println(u.getDateOfBirth().getYear()+1900);
		List<Book> list = BookDAO.getInstance().select6SimilarBook(13);
		for(Book o : list) {
			System.out.println(o.getBook_id());
		}
	}
}
