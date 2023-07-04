package dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import model.Category;
import util.HibernateUtil;

public class CategoryDAO extends AbstractDAO<Category>{
	public static CategoryDAO getInstance() {
		return new CategoryDAO();
	}
	
	@Override
	public boolean insert(Category t) {
		return super.insert(t);
	}

	@Override
	public boolean update(Category t) {
		return super.update(t);
	}

	@Override
	public boolean delete(Category t) {
		return super.delete(t);
	}

	@Override
	public Category selectById(Integer id) {
		Category category = null;
		Transaction transaction = null;
		try(Session session = HibernateUtil.getSessionFactory().openSession()){
			transaction = session.beginTransaction();
			
			category = session.get(Category.class,id);
			
			transaction.commit();
			session.close();
		}catch (Exception e) {
			if(transaction!=null)
				transaction.rollback();
		}
		return category;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Category> selectAll() {
		List<Category> list = null;
		Transaction transaction = null;
		try(Session session = HibernateUtil.getSessionFactory().openSession()){
			transaction = session.beginTransaction();
			
			list = session.createQuery("From Category").list();
			
			transaction.commit();
			session.close();
		}catch (Exception e) {
			if(transaction!=null)
				transaction.rollback();
		}
		return list;
	}



}
