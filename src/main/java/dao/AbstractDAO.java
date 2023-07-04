package dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import util.HibernateUtil;

public abstract class AbstractDAO<T> {
	public boolean insert(T t) {
		Transaction transaction = null;
		try(Session session = HibernateUtil.getSessionFactory().openSession()){
			transaction = session.beginTransaction();
			
			session.save(t);
			
			transaction.commit();
			session.close();
			return true;
		}catch (Exception e) {
			if(transaction!=null)
				transaction.rollback();
		}
		return false;
	}
	
	public boolean update(T t) {
		Transaction transaction = null;
		try(Session session = HibernateUtil.getSessionFactory().openSession()){
			transaction = session.beginTransaction();
			
			session.saveOrUpdate(t);
			
			transaction.commit();
			session.close();
			return true;
		}catch (Exception e) {
			if(transaction!=null)
				transaction.rollback();
		}
		return false;
	}
	
	public boolean delete(T t) {
		Transaction transaction = null;
		try(Session session = HibernateUtil.getSessionFactory().openSession()){
			transaction = session.beginTransaction();
			
			session.delete(t);
			
			transaction.commit();
			session.close();
			return true;
		}catch (Exception e) {
			if(transaction!=null)
				transaction.rollback();
		}
		return false;
	}
	
	public abstract T selectById(Integer id);
	
	public abstract List<T> selectAll();
}
