package shop.dao;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shop.entity.Color;


@Transactional
@Service("colorDao")
public class ColorDAO {
	@Autowired
	 SessionFactory factory;
	
	// get list Color
		public List<Color> getListColor() {
			Session session = factory.getCurrentSession();
			try {
				String sql = "FROM Color";
				Query query=session.createQuery(sql);
				List<Color> listColor = query.list();
				System.out.print("ok");
				return listColor;

			} catch (Exception e) {
				// TODO: handle exception
				System.out.print("error"+e.getMessage());
			}
			return new ArrayList<>();

		}
		
	// get Color by id
	   public Color getColorById(int id) {
		   Color color = null;
			Session session = factory.getCurrentSession();
			try {
				color = (Color) session.get(Color.class, id);
			} catch (Exception e) {
				System.out.print("Error find Color with id = "+id);
			}

			return color;
		}
}
