package dao;

import java.util.List;


import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import model.User;
import util.HibernateUtil;

public class UserDAO extends AbstractDAO<User>{
	public static UserDAO getInstance() {
		return new UserDAO();
	}
	
	@Override
	public boolean insert(User t) {
		List<User> users = UserDAO.getInstance().selectAll();
		if(!users.contains(t))
			return super.insert(t);
		return false;
	}

	@Override
	public boolean update(User t) {
		return super.update(t);
	}

	@Override
	public boolean delete(User t) {
		return super.delete(t);
	}

	@Override
	public User selectById(Integer id) {
		User user = null;
		Transaction transaction = null;
		try(Session session = HibernateUtil.getSessionFactory().openSession()){
			transaction = session.beginTransaction();
			
			user = session.get(User.class,id);
			
			transaction.commit();
			session.close();
		}catch (Exception e) {
			if(transaction!=null)
				transaction.rollback();
		}
		return user;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> selectAll() {
		List<User> list = null;
		Transaction transaction = null;
		try(Session session = HibernateUtil.getSessionFactory().openSession()){
			transaction = session.beginTransaction();
			
			list = session.createQuery("From User").list();
			
			transaction.commit();
			session.close();
		}catch (Exception e) {
			if(transaction!=null)
				transaction.rollback();
		}
		return list;
	}

	public User selectByEmail(String email) {
		List<User> list = null;
		Transaction transaction = null;
		try(Session session = HibernateUtil.getSessionFactory().openSession()){
			transaction = session.beginTransaction();
			
			Query query = session.createQuery("From User WHERE email = :email");
			
			query.setParameter("email", email);
			list = query.list();
			
			transaction.commit();
			session.close();
		}catch (Exception e) {
			if(transaction!=null)
				transaction.rollback();
		}
		if(list.size() ==0)
			return null;
		return list.get(0);
	}

}
