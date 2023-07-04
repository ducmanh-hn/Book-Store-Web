package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;


@Entity
public class Gallery {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer gallery_id;
	@Column(length = 200)
	private String thumbnail;
	@ManyToOne
	@JoinColumn(name="book_id")
	private Book book;
	
	
	public Gallery() {
		// TODO Auto-generated constructor stub
	}


	public Gallery(Integer gallery_id, String thumbnail, Book book) {
		this.gallery_id = gallery_id;
		this.thumbnail = thumbnail;
		this.book = book;
	}


	public Gallery(String thumbnail, Book book) {
		this.thumbnail = thumbnail;
		this.book = book;
	}


	public Integer getGallery_id() {
		return gallery_id;
	}


	public void setGallery_id(Integer gallery_id) {
		this.gallery_id = gallery_id;
	}


	public String getThumbnail() {
		return thumbnail;
	}


	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}


	public Book getBook() {
		return book;
	}


	public void setBook(Book book) {
		this.book = book;
	}


	@Override
	public String toString() {
		return "Gallery [gallery_id=" + gallery_id + ", thumbnail=" + thumbnail + ", book=" + book + "]";
	}
	
}
