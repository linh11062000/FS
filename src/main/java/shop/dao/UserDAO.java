package shop.dao;

import java.util.ArrayList;
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
@Service("userDao")
public class UserDAO {

	@Autowired
	 SessionFactory factory;

	// get list User
	public List<User> getListUser() {
		Session session = factory.getCurrentSession();
		try {
			String sql = "FROM User";
			Query query = session.createQuery(sql);
			List<User> listUser = query.list();
			System.out.println("ok");
			return listUser;

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("error"+e.getMessage());
		}
		return new ArrayList<>();
	}
	
	//get User by Id
		public User getUserById(int id) {
			User user = null;
			Session session = factory.getCurrentSession();
			try {
				user = (User) session.get(User.class, id);
			} catch (Exception e) {
				System.out.print("errors" + e.getMessage());
			}
			return user;
		}
	// get detail account
	public User getDetailByEmail(String email) {
		System.out.println(email);
		Session session = factory.getCurrentSession();
		String hql = "FROM User u WHERE u.email = :email";
		Query query = session.createQuery(hql).setParameter("email", email);

		List<User> list = query.list();
		for (User i : list) {
			System.out.println(i.getName());
		}
		return list.size() > 0 ? list.get(0) : null;
	}
	
	// get detail account
	public User getDetailByPhone(String phone) {
		System.out.println(phone);
		Session session = factory.getCurrentSession();
		String hql = "FROM User u WHERE u.phone = :phone";
		Query query = session.createQuery(hql).setParameter("phone", phone);

		List<User> list = query.list();
		for (User i : list) {
			System.out.println(i.getName());
		}
		return list.size() > 0 ? list.get(0) : null;
	}

	
	// get login
		public User login(String email, String password) {
			Session session = factory.getCurrentSession();
			String hql = "FROM User u WHERE u.email = :email AND u.password = :password";
			Query query = session.createQuery(hql);
			query.setParameter("email", email);
			query.setParameter("password", password);
			List<User> list = query.list();
			for (User i : list) {
				System.out.println("fullname...." +i.getName());
			}
			return list.size() > 0 ? list.get(0) : null;
		}

		public String createOrUpdate(User user) {
			
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
				session.saveOrUpdate(user);
				t.commit();
				System.out.print("Create or Update Success");
				return "Successfully";

			} catch (Exception e) {
				System.out.print(e.getMessage());
				t.rollback();
				return "failed!";
			} finally {
				session.close();
			}
			
		}
		
	
}
