package model;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class OrderDetail {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer orderDetail_id;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="order_id")
	private Orders order;
	@ManyToOne
	@JoinColumn(name = "book_id")
	private Book book;
	private Integer book_amount;
	private Integer book_price;
	private Integer total;
	
	
	public OrderDetail() {
		// TODO Auto-generated constructor stub
	}


	public OrderDetail(Integer orderDetail_id, Orders order, Book book, Integer book_amount, Integer book_price,
			Integer total) {
		super();
		this.orderDetail_id = orderDetail_id;
		this.order = order;
		this.book = book;
		this.book_amount = book_amount;
		this.book_price = book_price;
		this.total = total;
	}


	public OrderDetail(Orders order, Book book, Integer book_amount, Integer book_price) {
		this.order = order;
		this.book = book;
		this.book_amount = book_amount;
		this.book_price = book_price;
		this.total = book_amount * book_price;
	}


	public Integer getOrderDetail_id() {
		return orderDetail_id;
	}


	public void setOrderDetail_id(Integer orderDetail_id) {
		this.orderDetail_id = orderDetail_id;
	}


	public Orders getOrder() {
		return order;
	}


	public void setOrder(Orders order) {
		this.order = order;
	}


	public Book getBook() {
		return book;
	}


	public void setBook(Book book) {
		this.book = book;
	}


	public Integer getBook_amount() {
		return book_amount;
	}


	public void setBook_amount(Integer book_amount) {
		this.book_amount = book_amount;
	}


	public Integer getBook_price() {
		return book_price;
	}


	public void setBook_price(Integer book_price) {
		this.book_price = book_price;
	}


	public Integer getTotal() {
		return total;
	}


	public void setTotal(Integer total) {
		this.total = total;
	}


	@Override
	public String toString() {
		return "OrderDetail [orderDetail_id=" + orderDetail_id + ", order_id=" + order.getOrder_id() + ", book_id=" + book.getBook_id()
				+ ", book_amount=" + book_amount + ", book_price=" + book_price + ", total=" + total + "]";
	}
	
	
	
}
