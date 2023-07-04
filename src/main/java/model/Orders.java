package model;

import java.sql.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;


@Entity
public class Orders {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer order_id;
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	private Date order_date;
	private String user_address;
	@Column(length = 10)
	private String user_phone;
	private Integer total_price;
	private String note;
	private String status;
	@OneToMany(mappedBy = "order", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private List<OrderDetail> orderDetails;
	


	public Orders() {

	}


	public Orders(Integer order_id, User user, Date order_date, String user_address, String user_phone,
			Integer total_price, String note, String status) {
		super();
		this.order_id = order_id;
		this.user = user;
		this.order_date = order_date;
		this.user_address = user_address;
		this.user_phone = user_phone;
		this.total_price = total_price;
		this.note = note;
		this.status = status;
	}


	public Orders(User user, Date order_date, String user_address, String user_phone, Integer total_price, String note,
			String status) {
		this.user = user;
		this.order_date = order_date;
		this.user_address = user_address;
		this.user_phone = user_phone;
		this.total_price = total_price;
		this.note = note;
		this.status = status;
	}


	public Integer getOrder_id() {
		return order_id;
	}


	public void setOrder_id(Integer ordet_id) {
		this.order_id = ordet_id;
	}


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public Date getOrder_date() {
		return order_date;
	}


	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}


	public String getUser_address() {
		return user_address;
	}


	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}


	public String getUser_phone() {
		return user_phone;
	}


	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}


	public Integer getTotal_price() {
		return total_price;
	}


	public void setTotal_price(Integer total_price) {
		this.total_price = total_price;
	}


	public String getNote() {
		return note;
	}


	public void setNote(String note) {
		this.note = note;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}

	public List<OrderDetail> getOrderDetails() {
		return orderDetails;
	}


	public void setOrderDetails(List<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}
	
	@Override
	public String toString() {
		return "Orders [order_id=" + order_id + ", user=" + user + ", order_date=" + order_date + ", user_address="
				+ user_address + ", user_phone=" + user_phone + ", total_price=" + total_price + ", note=" + note
				+ ", status=" + status + "]";
	}
	
	
}
