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

import shop.entity.Order;

@Transactional
@Service("orderDao")
public class OrderDAO {
	@Autowired
	 SessionFactory factory;

	// get list Order
	public List<Order> getListOrder() {
		Session session = factory.getCurrentSession();
		try {
			String sql = "FROM Order";
			Query query = session.createQuery(sql);
			List<Order> listOrder = query.list();
			System.out.println("ok");
			return listOrder;

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("error"+e.getMessage());
		}
		return new ArrayList<>();
	}
	
	//get Order by Id
	public Order getOrderById(int id) {
		Order order = null;
		Session session = factory.getCurrentSession();
		try {
			order = (Order) session.get(Order.class, id);
		} catch (Exception e) {
			System.out.print("errors" + e.getMessage());
		}
		return order;
	}

	
	// get list Orders by Transaction
		public List<Order> getListOrderByTrans(int idTrans) {
			Session session = factory.getCurrentSession();
			try {
				String sql = "FROM Order o where o.transaction.id =:idTrans";
				Query query = session.createQuery(sql).setParameter("idTrans", idTrans);
				List<Order> listOrders = query.list();
				System.out.println("ok");
				return listOrders;
				
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("error"+e.getMessage());
			}
			return new ArrayList<>();
		}
	
	// create or update
		public boolean createOrUpdate(Order order) {
			
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
				session.saveOrUpdate(order);
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
				Order order;
				Session session = factory.openSession();
				Transaction t = session.beginTransaction();
				try {
					order = (Order) session.get(Order.class, id);
					session.delete(order);
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
