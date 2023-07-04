package dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import model.Gallery;
import util.HibernateUtil;

public class GalleryDAO extends AbstractDAO<Gallery>{
	public static GalleryDAO getInstance() {
		return new GalleryDAO();
	}
	
	public boolean insert(Gallery t) {
		return super.insert(t);
	}
	public boolean update(Gallery t) {
		return super.update(t);
	}
	public boolean delete(Gallery t) {
		return super.delete(t);
	}

	@Override
	public Gallery selectById(Integer id) {
		Gallery gallery = null;
		Transaction transaction = null;
		try(Session session = HibernateUtil.getSessionFactory().openSession()){
			transaction = session.beginTransaction();
			
			gallery = session.get(Gallery.class, id);
			
			transaction.commit();
			session.close();
		}catch (Exception e) {
			if(transaction!=null)
				transaction.rollback();
		}
		return gallery;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Gallery> selectAll() {
		List<Gallery> list = null;
		Transaction transaction = null;
		try(Session session = HibernateUtil.getSessionFactory().openSession()){
			transaction = session.beginTransaction();
			
			list = session.createQuery("From Gallery").list();
			
			transaction.commit();
			session.close();
		}catch (Exception e) {
			if(transaction!=null)
				transaction.rollback();
		}
		return list;
	}

	public List<Gallery> selectByBookId(Integer book_id){
		List<Gallery> list = null;
		Transaction transaction = null;
		try(Session session = HibernateUtil.getSessionFactory().openSession()){
			transaction = session.beginTransaction();
			
			Query query = session.createQuery("From Gallery g Where g.book.book_id = :book_id");
			query.setParameter("book_id", book_id);
			list = query.list();
			
			transaction.commit();
			session.close();
		}catch (Exception e) {
			if(transaction!=null)
				transaction.rollback();
		}
		return list;
	}

}
