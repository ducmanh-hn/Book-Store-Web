package dao;

import model.Role;
import util.HibernateUtil;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

public class RoleDAO extends AbstractDAO<Role>{
	public static RoleDAO getInstance() {
		return new RoleDAO();
	}

	public boolean insert(Role t) {
		return super.insert(t);
	}
	
	public boolean update(Role t) {
		return super.update(t);
	}
	
	public boolean delete(Role t) {
		return super.delete(t);
	}
	
	@Override
	public Role selectById(Integer id) {
		Role role = null;
		Transaction transaction = null;
		try(Session session = HibernateUtil.getSessionFactory().openSession()){
			transaction = session.beginTransaction();
			
			role = session.get(Role.class,id);
			
			transaction.commit();
			session.close();
		}catch (Exception e) {
			if(transaction!=null)
				transaction.rollback();
		}
		return role;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Role> selectAll() {
		List<Role> list = null;
		Transaction transaction = null;
		try(Session session = HibernateUtil.getSessionFactory().openSession()){
			transaction = session.beginTransaction();
			
			list = session.createQuery("From Role").list();
			
			transaction.commit();
			session.close();
		}catch (Exception e) {
			if(transaction!=null)
				transaction.rollback();
		}
		return list;
	}

	
}
