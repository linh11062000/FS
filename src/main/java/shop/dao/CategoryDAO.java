package shop.dao;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shop.entity.Category;


@Transactional
@Service("categoryDao")
public class CategoryDAO {
	@Autowired
	 SessionFactory factory;
	
	// get list Category
		public List<Category> getListCategory() {
			Session session = factory.getCurrentSession();
			try {
				String sql = "FROM Category";
				Query query=session.createQuery(sql);
				List<Category> listCategory = query.list();
				System.out.print("ok");
				return listCategory;

			} catch (Exception e) {
				// TODO: handle exception
				System.out.print("error"+e.getMessage());
			}
			return new ArrayList<>();

		}
		
	// get Category by id
	   public Category getCategoryById(int id) {
		   Category category = null;
			Session session = factory.getCurrentSession();
			try {
				category = (Category) session.get(Category.class, id);
			} catch (Exception e) {
				System.out.print("Error find Color with id = "+id);
			}

			return category;
		}
}
