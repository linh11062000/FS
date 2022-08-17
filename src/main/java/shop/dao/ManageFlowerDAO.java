package shop.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shop.entity.Flower;

@Transactional
@Service("manageFlowerDAO")
public class ManageFlowerDAO {
	@Autowired
	SessionFactory factory;
	public List<Flower> getListFlower() {
		Session session;
		try {
			session = factory.getCurrentSession();
		} catch (Exception e) {
			session = factory.openSession();
		}
		String hql = "FROM Flower";
		Query query = session.createQuery(hql);
		List<Flower> list = query.list();
		return list;
	}
	
	
	public Boolean save(Flower f) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		Boolean result = true;
		try {
			session.save(f);
			t.commit();
			result = true;
		} catch (Exception e) {
			// TODO: handle exception
			t.rollback();
			result = false;
		}finally {
			session.close();
		}
		return result;
	}
	
	public Boolean update(Flower f) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		Boolean result = true;
		try {
			session.update(f);
			t.commit();
			result = true;
		} catch (Exception e) {
			// TODO: handle exception
			t.rollback();
			result = false;
		}finally {
			session.close();
		}
		return result;
	}
	
	public Flower getFlowerById(String id) {
		Session session ;
		try {
			session = factory.getCurrentSession();
		} catch (Exception e) {
			// TODO: handle exception
			session = factory.openSession();
		}
		Flower f = null;
		try {
			f = (Flower) session.get(Flower.class, Integer.parseInt(id));
		} catch (Exception e) {
			System.out.print("Error find Flower with id =" + id );
		}
		return f;
	}
	
	public Boolean delete(Flower f) {
		Session session  = factory.openSession();;
		Boolean res = true;
		Transaction t = session.beginTransaction();
		try {
			session.delete(f);
			t.commit();
			res = true;
		} catch (Exception e) {
			// TODO: handle exception
			t.rollback();
			res = false;
		}finally {
			session.close();
		}
		return res;
	}
	
	public List<Flower> search(String name) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Flower where name LIKE :name";
		Query query = session.createQuery(hql);
		query.setParameter("name", "%" + name + "%");
		List<Flower> list = query.list();
		System.out.println("list n�: " + list);
		return list;
	}
}
