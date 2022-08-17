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

import shop.entity.Flower;
import shop.entity.ShopCart;

@Transactional
@Service("flowerDao")
public class FlowerDAO {
	@Autowired
	 SessionFactory factory;

	// get list Flower
	public List<Flower> getListFlower() {
		Session session = factory.getCurrentSession();
		try {
			String sql = "FROM Flower";
			Query query = session.createQuery(sql);
			List<Flower> listFlower = query.list();
			System.out.println("ok");
			return listFlower;

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("error"+e.getMessage());
		}
		return new ArrayList<>();

	}
	// get Flower by id
	public Flower getFlowerById(int id) {
		Flower flower = null;
		Session session = factory.getCurrentSession();
		try {
			flower = (Flower) session.get(Flower.class, id);
		} catch (Exception e) {
			System.out.print("errors" + e.getMessage());
		}
		return flower;
	}
	
	// get Flower by contains name
	public List<Flower> getFlowerByName(String text) {
		Session session = factory.getCurrentSession();
		try {
			String sql = "FROM Flower f where f.name like :text";
			Query query = session.createQuery(sql).setParameter("text","%"+text+"%");
			List<Flower> listFlo = query.list();
			System.out.println("ok");
			return listFlo;
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("error"+e.getMessage());
		}
		return new ArrayList<>();
	}
	
	
	//create or update
	public String CreateOrUpate(Flower flower) {
		// Notify notify;
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.saveOrUpdate(flower);
			t.commit();
			return "successfully!";
		} catch (Exception e) {
			t.rollback();
			return "fail!";
		} finally {
			session.close();
		}
	}
	
}
