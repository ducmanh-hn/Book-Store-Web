package model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Book {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer book_id;
	@ManyToOne
	@JoinColumn(name="category_id")
	private Category category;
	private String name;
	private String author;
	private Integer price;
	private Integer discount_price;
	private Integer sold_amount;
	@Column(length = Integer.MAX_VALUE)
	private String description;
	private String picture;
	@OneToMany(mappedBy = "book", cascade = CascadeType.ALL)
	private List<Gallery> thumbnails;
	
	
	public Book() {
		// TODO Auto-generated constructor stub
	}


	public Book(Integer book_id, Category category, String name,String author, Integer price, Integer discount_price,
			Integer sold_amount, String description, String picture, List<Gallery> thumbnails) {

		this.book_id = book_id;
		this.category = category;
		this.name = name;
		this.author = author;
		this.price = price;
		this.discount_price = discount_price;
		this.sold_amount = sold_amount;
		this.description = description;
		this.picture = picture;
		this.thumbnails = thumbnails;
	}


	public Book(Category category, String name, String author, Integer price, Integer discount_price, 
			Integer sold_amount,String description, String picture) {
		this.category = category;
		this.name = name;
		this.author = author;
		this.price = price;
		this.discount_price = discount_price;
		this.sold_amount = sold_amount;
		this.description = description;
		this.picture = picture;
	}
	public Book(Category category, String name, String author, Integer price, Integer discount_price, 
			Integer sold_amount,String description, String picture, List<Gallery> thumbnails) {
		this.category = category;
		this.name = name;
		this.author = author;
		this.price = price;
		this.discount_price = discount_price;
		this.sold_amount = sold_amount;
		this.description = description;
		this.picture = picture;
		this.thumbnails = thumbnails;
	}


	public Integer getBook_id() {
		return book_id;
	}


	public void setBook_id(Integer book_id) {
		this.book_id = book_id;
	}


	public Category getCategory() {
		return category;
	}


	public void setCategory(Category category) {
		this.category = category;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getAuthor() {
		return author;
	}


	public void setAuthor(String author) {
		this.author = author;
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


	public Integer getSold_amount() {
		return sold_amount;
	}


	public void setSold_amount(Integer sold_amount) {
		this.sold_amount = sold_amount;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public List<Gallery> getThumbnails() {
		return thumbnails;
	}


	public void setThumbnails(List<Gallery> thumbnails) {
		this.thumbnails = thumbnails;
	}


	public String getPicture() {
		return picture;
	}


	public void setPicture(String picture) {
		this.picture = picture;
	}


	@Override
	public String toString() {
		return "Book [book_id=" + book_id + ", category=" + category + ", name=" + name + ", price=" + price
				+ ", discount_price=" + discount_price + ", sold_amount=" + sold_amount + ", description=" + description
				+ ", picture=" + picture + "]";
	}
	
	
}
