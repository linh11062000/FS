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

import shop.entity.ShopCart;
import shop.entity.User;

@Transactional
@Service("shopCartDao")
public class ShopCartDAO {
	@Autowired
	 SessionFactory factory;

	// get list shopCart
	public List<ShopCart> getListCart() {
		Session session = factory.getCurrentSession();
		try {
			String sql = "FROM ShopCart";
			Query query = session.createQuery(sql);
			List<ShopCart> listCart = query.list();
			System.out.println("ok");
			return listCart;

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("error"+e.getMessage());
		}
		return new ArrayList<>();

	}
	// get list shopCart by User
	public List<ShopCart> getCartByUser(int id) {
		Session session = factory.getCurrentSession();
		try {
			String sql = "FROM ShopCart c where c.user.id=:id and c.status='false'";
			Query query = session.createQuery(sql).setParameter("id", id);
			List<ShopCart> listCart = query.list();
			System.out.println("ok");
			return listCart;
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("error"+e.getMessage());
		}
		return new ArrayList<>();
		
	}
	
	//get cart by Id
		public ShopCart getCartById(int id) {
			ShopCart cart = null;
			Session session = factory.getCurrentSession();
			try {
				cart = (ShopCart) session.get(ShopCart.class, id);
			} catch (Exception e) {
				System.out.print("errors" + e.getMessage());
			}
			return cart;
		}

	// check exist shopCart with status=false
	public ShopCart getCartByUserFlo(int userId,int floId) {
		Session session = factory.getCurrentSession();
		try {
			String sql = "FROM ShopCart c where c.user.id=:userId and c.flower.id=:floId and c.status='false'";
			Query query = session.createQuery(sql).setParameter("userId", userId);
		    query.setParameter("floId", floId);
			List<ShopCart> listCart = query.list();
			System.out.println("ok");
			return listCart.size() > 0 ? listCart.get(0) : null;
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("error"+e.getMessage());
		}
		return null;
		
	}
	
	// create
	public String createOrUpdate(ShopCart cart) {
		
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.saveOrUpdate(cart);
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
	// delete
		public boolean delete(int id) {
			ShopCart cart;
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
				cart = (ShopCart) session.get(ShopCart.class, id);
				session.delete(cart);
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
