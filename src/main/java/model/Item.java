package model;

import java.io.Serializable;
import java.util.Objects;

//  cần dùng thêm item vì cần thêm thuộc tính amount khi mua 1 sản phẩm trog khi model.Book ko có amount
// và giảm đi được phần description
public class Item implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer book_id;
	private String name;
	private Integer price;
	private Integer discount_price;
	private Integer amount;
	private String picture;
	public Item() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Item(Integer book_id, String name, Integer price, Integer discount_price, Integer amount, String picture) {
		super();
		this.book_id = book_id;
		this.name = name;
		this.price = price;
		this.discount_price = discount_price;
		this.amount = amount;
		this.picture = picture;
	}
	public Integer getBook_id() {
		return book_id;
	}
	public void setBook_id(Integer book_id) {
		this.book_id = book_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public Integer getDiscount_price() {
		return discount_price;
	}
	public void setDiscount_price(Integer discount_price) {
		this.discount_price = discount_price;
	}
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	@Override
	public String toString() {
		return "Item [book_id=" + book_id + ", name=" + name + ", price=" + price + ", discount_price=" + discount_price
				+ ", amount=" + amount + ", picture=" + picture + "]";
	}
	@Override
	public int hashCode() {
		return Objects.hash(book_id);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Item other = (Item) obj;
		return Objects.equals(book_id, other.book_id);
	}
	
	
}
