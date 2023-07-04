package dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import model.Feedback;
import util.HibernateUtil;

public class FeedbackDAO extends AbstractDAO<Feedback>{
	public static FeedbackDAO getInstance() {
		return new FeedbackDAO();
	}
	
	public boolean insert(Feedback t) {
		return super.insert(t);
	}
	public boolean update(Feedback t) {
		return super.update(t);
	}
	public boolean delete(Feedback t) {
		return super.delete(t);
	}
	



	@Override
	public Feedback selectById(Integer id) {
		Feedback feedback = null;
		Transaction transaction = null;
		try(Session session = HibernateUtil.getSessionFactory().openSession()){
			transaction = session.beginTransaction();
			
			feedback = session.get(Feedback.class,id);
			
			transaction.commit();
			session.close();
		}catch (Exception e) {
			if(transaction!=null)
				transaction.rollback();
		}
		return feedback;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Feedback> selectAll() {
		List<Feedback> list = null;
		Transaction transaction = null;
		try(Session session = HibernateUtil.getSessionFactory().openSession()){
			transaction = session.beginTransaction();
			
			list = session.createQuery("From Feedback").list();
			
			transaction.commit();
			session.close();
		}catch (Exception e) {
			if(transaction!=null)
				transaction.rollback();
		}
		return list;
	}
}
