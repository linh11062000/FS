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

import shop.entity.Admin;
import shop.entity.User;


@Transactional
@Service("adminDao")
public class AdminDAO {
	@Autowired
	 SessionFactory factory;

	// get list Admin
	public List<Admin> getListAdmin() {
		Session session = factory.getCurrentSession();
		try {
			String sql = "FROM Admin";
			Query query = session.createQuery(sql);
			List<Admin> listAdmin = query.list();
			System.out.println("ok");
			return listAdmin;

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("error");
		}
		return new ArrayList<>();

	}
	
	// get detail admin
		public Admin getDetailByUsername(String username) {
			System.out.println(username);
			Session session = factory.getCurrentSession();
			String hql = "FROM Admin a WHERE a.username = :username";
			Query query = session.createQuery(hql).setParameter("username", username);

			List<Admin> list = query.list();
			for (Admin i : list) {
				System.out.println(i.getName());
			}
			return list.size() > 0 ? list.get(0) : null;
		}
	
	// get login
		public Admin login(String username, String password) {
			Session session = factory.getCurrentSession();
			String hql = "FROM Admin u WHERE u.username = :username AND u.password = :password";
			Query query = session.createQuery(hql);
			query.setParameter("username", username);
			query.setParameter("password", password);
			List<Admin> list = query.list();
			for (Admin i : list) {
				System.out.println("fullname...." +i.getName());
			}
			return list.size() > 0 ? list.get(0) : null;
		}
	
		public String createOrUpdate(Admin admin) {
			
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
				session.saveOrUpdate(admin);
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
