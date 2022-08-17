package shop.dao;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shop.entity.Order;
import shop.entity.ShopCart;
import shop.entity.Transaction;
import shop.entity.User;

@Transactional
@Service("transactionDao")
public class TransactionDAO {
	@Autowired
	 SessionFactory factory;

	// get list Transaction
	public List<Transaction> getListTrans() {
		Session session = factory.getCurrentSession();
		try {
			String sql = "FROM Transaction";
			Query query = session.createQuery(sql);
			List<Transaction> listTrans = query.list();
			System.out.println("ok");
			return listTrans;

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("error"+e.getMessage());
		}
		return new ArrayList<>();
	}
	
	//get Transaction by Id
		public Transaction getTransById(int id) {
			Transaction trans = null;
			Session session = factory.getCurrentSession();
			try {
				trans = (Transaction) session.get(Transaction.class, id);
			} catch (Exception e) {
				System.out.print("errors" + e.getMessage());
			}
			return trans;
		}
	
	// get list Transaction by User
	public List<Transaction> getListTransByUser(int userId) {
		Session session = factory.getCurrentSession();
		try {
			String sql = "FROM Transaction t where t.user.id =:userId";
			Query query = session.createQuery(sql).setParameter("userId", userId);
			List<Transaction> listTrans = query.list();
			System.out.println("ok");
			return listTrans;
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("error"+e.getMessage());
		}
		return new ArrayList<>();
	}

	
	
	// create or update
	public boolean createOrUpdate(Transaction trans) {
		
		Session session = factory.openSession();
		org.hibernate.Transaction t = session.beginTransaction();
		try {
			session.saveOrUpdate(trans);
			t.commit();
			System.out.print("Create or Update Success");
			return true;

		} catch (Exception e) {
			System.out.print(e.getMessage());
			t.rollback();
			return false;
		} finally {
			session.close();
		}
		
	}
	
	// delete
		public boolean delete(int id) {
			Transaction trans;
			Session session = factory.openSession();
			org.hibernate.Transaction t = session.beginTransaction();
			try {
				trans = (Transaction) session.get(Transaction.class, id);
				session.delete(trans);
				t.commit();
				return true;
				
			} catch (Throwable e) {
				t.rollback();
				return false;
			} finally {
				session.close();
			}
		}
}
