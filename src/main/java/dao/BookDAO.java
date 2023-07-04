package dao;

import java.util.List;


import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import model.Book;
import util.HibernateUtil;

public class BookDAO extends AbstractDAO<Book>{
	public static BookDAO getInstance() {
		return new BookDAO();
	}
	
	@Override
	public boolean insert(Book t) {
		return super.insert(t);
	}

	@Override
	public boolean update(Book t) {
		return super.update(t);
	}

	@Override
	public boolean delete(Book t) {
		return super.delete(t);
	}

	@Override
	public Book selectById(Integer id) {
		Book book = null;
		Transaction transaction = null;
		try(Session session = HibernateUtil.getSessionFactory().openSession()){
			transaction = session.beginTransaction();
			
			book = session.get(Book.class,id);
			
			transaction.commit();
			session.close();
		}catch (Exception e) {
			if(transaction!=null)
				transaction.rollback();
		}
		return book;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Book> selectAll() {
		List<Book> list = null;
		Transaction transaction = null;
		try(Session session = HibernateUtil.getSessionFactory().openSession()){
			transaction = session.beginTransaction();
			
			list = session.createQuery("From Book").list();
			
			transaction.commit();
			session.close();
		}catch (Exception e) {
			if(transaction!=null)
				transaction.rollback();
		}
		return list;
	}
	

	public List<Book> selectByCategoryId(Integer category_id){
		List<Book> list = null;
		Transaction transaction = null;
		try(Session session = HibernateUtil.getSessionFactory().openSession()){
			transaction = session.beginTransaction();
			
			Query query = session.createQuery("From Book b Where b.category.id = :category_id");
			query.setParameter("category_id", category_id);
			list = query.list();
			
			transaction.commit();
			session.close();
		}catch (Exception e) {
			if(transaction!=null) {
				transaction.rollback();
			}
		}
		return list;
	}
	
	public List<Book> search(String info){
		List<Book> list = null;
		Transaction transaction = null;
		try(Session session = HibernateUtil.getSessionFactory().openSession()){
			transaction = session.beginTransaction();
			
			Query query = session.createQuery("From Book b Where b.name LIKE :info ");
			query.setParameter("info", "%"+info+"%");
			list = query.list();
			
			transaction.commit();
			session.close();
		}catch (Exception e) {
			if(transaction!=null) {
				transaction.rollback();
			}
		}
		return list;
	}
	
	public List<Book> select6SimilarBook(Integer book_id){
		List<Book> list = null;
		Transaction transaction = null;
		try(Session session = HibernateUtil.getSessionFactory().openSession()){
			transaction = session.beginTransaction();
			
			Integer c_id = selectById(book_id).getCategory().getCategory_id();
			Query query = session.createQuery("From Book b Where b.category.category_id = :c_id ORDER BY RAND()");
			query.setMaxResults(6);
			query.setParameter("c_id", c_id);
			list = query.list();
			
			transaction.commit();
			session.close();
		}catch (Exception e) {
			if(transaction!=null) {
				transaction.rollback();
			}
		}
		return list;
	}
}
