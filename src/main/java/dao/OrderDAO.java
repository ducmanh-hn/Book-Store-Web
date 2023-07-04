package dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import model.Orders;
import util.HibernateUtil;

public class OrderDAO extends AbstractDAO<Orders>{
	public static OrderDAO getInstance() {
		return new OrderDAO();
	}
	
	public boolean insert(Orders t) {
		return super.insert(t);
	}
	public boolean update(Orders t) {
		return super.insert(t);
	}
	public boolean delete(Orders t) {
		return super.insert(t);
	}

	@Override
	public Orders selectById(Integer id) {
		Orders order = null;
		Transaction transaction = null;
		try(Session session = HibernateUtil.getSessionFactory().openSession()){
			transaction = session.beginTransaction();
			
			order = session.get(Orders.class,id);
			
			transaction.commit();
			session.close();
		}catch (Exception e) {
			if(transaction!=null)
				transaction.rollback();
		}
		return order;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Orders> selectAll() {
		List<Orders> list = null;
		Transaction transaction = null;
		try(Session session = HibernateUtil.getSessionFactory().openSession()){
			transaction = session.beginTransaction();
			
			list = session.createQuery("From Orders").list();
			
			transaction.commit();
			session.close();
		}catch (Exception e) {
			if(transaction!=null)
				transaction.rollback();
		}
		return list;
	}
		
	public List<Orders> selectByUserId(Integer user_id){
		List<Orders> list = null;
		Transaction transaction = null;
		try(Session session = HibernateUtil.getSessionFactory().openSession()){
			transaction = session.beginTransaction();
			
			Query query = session.createQuery("From Orders o WHERE o.user.user_id = :user_id");
			query.setParameter("user_id", user_id);
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
