package dao;

import java.util.List;

import org.hibernate.query.Query;

import org.hibernate.Session;
import org.hibernate.Transaction;

import model.OrderDetail;
import util.HibernateUtil;

public class OrderDetailDAO extends AbstractDAO<OrderDetail>{
	public static OrderDetailDAO getInstance() {
		return new OrderDetailDAO();
	}
	
	public boolean insert(OrderDetail t) {
		return super.insert(t);
	}
	public boolean update(OrderDetail t) {
		return super.update(t);
	}
	public boolean delete(OrderDetail t) {
		return super.delete(t);
	}
	@Override
	public OrderDetail selectById(Integer id) {
		OrderDetail orderDetail = null;
		Transaction transaction = null;
		try(Session session = HibernateUtil.getSessionFactory().openSession()){
			transaction = session.beginTransaction();
			
			orderDetail = session.get(OrderDetail.class,id);
			
			transaction.commit();
			session.close();
		}catch (Exception e) {
			if(transaction!=null)
				transaction.rollback();
		}
		return orderDetail;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<OrderDetail> selectAll() {
		List<OrderDetail> list = null;
		Transaction transaction = null;
		try(Session session = HibernateUtil.getSessionFactory().openSession()){
			transaction = session.beginTransaction();
			
			list = session.createQuery("From OrderDetail").list();
			
			transaction.commit();
			session.close();
		}catch (Exception e) {
			if(transaction!=null)
				transaction.rollback();
		}
		return list;
	}
	
	public List<OrderDetail> selectByOrderId(Integer order_id) {
		List<OrderDetail> list = null;
		Transaction transaction = null;
		try(Session session = HibernateUtil.getSessionFactory().openSession()){
			transaction = session.beginTransaction();
			
			Query query = session.createQuery("From OrderDetail od WHERE od.order.order_id = :order_id");
			query.setParameter("order_id", order_id);
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
