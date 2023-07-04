package model;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Feedback {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer feedback_id;
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	@ManyToOne
	@JoinColumn(name= "book_id")
	private Book book;
	private String feedback;
	
	
	public Feedback() {
		// TODO Auto-generated constructor stub
	}


	public Feedback(Integer feedback_id, User user, Book book, String feedback) {
		super();
		this.feedback_id = feedback_id;
		this.user = user;
		this.book = book;
		this.feedback = feedback;
	}


	public Feedback(User user, Book book, String feedback) {
		this.user = user;
		this.book = book;
		this.feedback = feedback;
	}


	public Integer getFeedback_id() {
		return feedback_id;
	}


	public void setFeedback_id(Integer feedback_id) {
		this.feedback_id = feedback_id;
	}


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public Book getBook() {
		return book;
	}


	public void setBook(Book book) {
		this.book = book;
	}


	public String getFeedback() {
		return feedback;
	}


	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}


	@Override
	public String toString() {
		return "Feedback [feedback_id=" + feedback_id + ", user=" + user + ", book=" + book + ", feedback=" + feedback
				+ "]";
	}
	
}
