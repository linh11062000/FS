package shop.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import shop.dao.AdminDAO;
import shop.dao.CategoryDAO;
import shop.dao.ColorDAO;
import shop.dao.FlowerDAO;
import shop.dao.OrderDAO;
import shop.dao.ShopCartDAO;
import shop.dao.TransactionDAO;
import shop.dao.UserDAO;
import shop.entity.Admin;
import shop.entity.Category;
import shop.entity.Color;
import shop.entity.Flower;
import shop.entity.Order;
import shop.entity.ShopCart;
import shop.entity.Transaction;
import shop.entity.User;
import shop.service.ShopService;


@Controller
@Transactional
public class TestController {
	
	@Autowired
	AdminDAO adminDao;
	
	@Autowired
	FlowerDAO flowerDao;
	
	@Autowired
	UserDAO userDao;
	
	@Autowired
	ShopCartDAO shopCartDao;
	
	@Autowired
	TransactionDAO transactionDao;
	
	@Autowired
	OrderDAO orderDao;
	
	@Autowired
	ColorDAO colorDao;

	@Autowired
	CategoryDAO categoryDao;
	
	@Autowired
	ModelController mc;
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String index() {
//		List<Admin> listAdmin=adminDao.getListAdmin();
//		for (Admin a:listAdmin) {
//			System.out.println(a.toString());
//		}
//		
		// Test quan hệ n-n
		
//		Color c1=new Color();
//		Color c2=new Color();
//		c1=colorDao.getColorById(1);
//		c2=colorDao.getColorById(2);
//		
//		Category ca1=new Category();
//		ca1=categoryDao.getCategoryById(1);
//		
//		List<Color> lc=new ArrayList<Color>();
//		lc.add(c1);
//		lc.add(c2);
//
//		List<Category> lca=new ArrayList<Category>();
//		lca.add(ca1);
//		
//		
//		Flower f1=new Flower();
//		f1.setColors(lc);
//		f1.setCategories(lca);
//		f1.setPrice(new BigDecimal(10000));
//		f1.setName("test");
//		f1.setImage("test");
//		f1.setContents("test content");
//		flowerDao.CreateOrUpate(f1);
		
		List<Flower> listFlower=mc.arrange(6,12);
		//List<Flower> listFlower=flowerDao.getFlowerByName("oa");
		for (Flower f:listFlower) {
			System.out.println(f.toString());
//			System.out.println("Colors : "+ f.getColors().size());
//			List<Color> colors= f.getColors();
//			for (Color co:colors) {
//				System.out.println(co.toString()+" ");
//			}
//			System.out.println("Categories : "+f.getCategories().size());
//			List<Category> categories= f.getCategories();
//			for (Category ca:categories) {
//				System.out.println(ca.toString()+" ");
//			}
		}
		
//		List<User> listUser=userDao.getListUser();
//		for (User u:listUser) {
//			System.out.println(u.toString());
//		}
//		
//		List<ShopCart> listCart=shopCartDao.getCartByUser(1);
//		for (ShopCart cart:listCart) {
//			System.out.println(cart.toString());
//		}
//		
//		List<Transaction> listTrans=transactionDao.getListTrans();
//		for (Transaction t:listTrans) {
//			System.out.println(t.toString());
//		}
//		
//		List<Order> listOrder=orderDao.getListOrder();
//		for (Order o:listOrder) {
//			System.out.println(o.toString());
//		}
//		
//		ShopCart cartCopy=shopCartDao.getCartByUserFlo(4,8);
//		System.out.print(cartCopy);
		
		return "test";
	}
}
