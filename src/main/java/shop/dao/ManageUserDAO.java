package shop.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shop.entity.User;

@Transactional
@Service("manageUserDAO")

public class ManageUserDAO {
	@Autowired
	SessionFactory factory;
	
	public List<User> getListUser() {
		Session session;
		try {
			session = factory.getCurrentSession();
		} catch (Exception e) {
			// TODO: handle exception
			session = factory.openSession();
		}
		String hql = "from User";
		Query query = session.createQuery(hql);
		List<User> list = query.list();
		return list;
	}
	
	public Boolean saveOrUpdate(User user) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		Boolean res = true;
		try {
			session.saveOrUpdate(user);
			t.commit();
			
			res = true;
		} catch (Exception e) {
			// TODO: handle exception
			t.rollback();
			res = false;
		} finally {
			session.close();
		}
		return res;
	}
	
	public Boolean updated(User user) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		Boolean res = true;
		try {
			session.update(user);
			t.commit();
			res = true;
		} catch (Exception e) {
			// TODO: handle exception
			t.rollback();
			res = false;
		} finally {
			session.close();
		}
		System.out.println("User DAO: " + user + "\n" + res);
		return res;
	}
	
	public Boolean update(User user) {
		Session session;
		try {
			session = factory.getCurrentSession();
		} catch (Exception e) {
			// TODO: handle exception
			session = factory.openSession();
		}
		String hql = "update [User] set address = '" + user.getAddress() + "',created='" + user.getCreated() + "',email='" + user.getEmail() + "',name='" + user.getName() + "',password='" + user.getPassword() + "',phone='" + user.getPhone() + "' where id='" + user.getId() + "'";
		
		  int b = session.createQuery(hql).executeUpdate();
		 /*query.list();*/
		  System.out.println("b n�: " + b);
		return true;
	}
	
	public Boolean delete(User user) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		Boolean res = true;
		try {
			session.delete(user);
			t.commit();
			res = true;
		} catch (Exception e) {
			// TODO: handle exception
			t.rollback();
			res = false;
		} finally {
			session.close();
		}
		return res;
	}
	
	public User getUserById(Integer id) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		User user = null;
		try {
			user = (User) session.get(User.class, id);
			t.commit();
			
		} catch (Exception e) {
			// TODO: handle exception
			t.rollback();
		}
		return user;
	}
	
	public List<User> search(String name) {
		Session session = factory.getCurrentSession();
		String hql = "FROM User where name LIKE :name";
		Query query = session.createQuery(hql);
		query.setParameter("name", "%" + name + "%");
		List<User> list = query.list();
		System.out.println("list n�: " + list);
		return list;
	}
	
}
