package shop.controller;

import java.math.BigDecimal;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;

import shop.dao.FlowerDAO;
import shop.dao.ShopCartDAO;
import shop.entity.Flower;
import shop.entity.ShopCart;
import shop.entity.User;
import shop.service.ShopService;


@Transactional
@Controller
public class ModelController {

	@Autowired
	ShopCartDAO cartDao;

	@Autowired
	FlowerDAO flowerDao;
	
	@ModelAttribute("listCarts")
	public List<ShopCart> dem(HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("userLogin");
		if (user != null) {
			List<ShopCart> list=cartDao.getCartByUser(user.getId());
			for (ShopCart cart:list) {
				Flower flo=cart.getFlower();
				BigDecimal sale=(flo.getPrice().multiply(BigDecimal.valueOf(flo.getDiscount()))).divide(BigDecimal.valueOf(100));
				cart.setAmount(flo.getPrice().add(sale.multiply(BigDecimal.valueOf(-1))));
			}
			return list;
		}
		return null;
	}
	
	@ModelAttribute("sizelistCarts")
	public int size(HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("userLogin");
		if (user != null) {
			List<ShopCart> list=cartDao.getCartByUser(user.getId());
			return list.size();
		}
		return 0;
	}
	
	@ModelAttribute("totalCarts")
	public BigDecimal total(HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("userLogin");
		if (user != null) {
			List<ShopCart> list=cartDao.getCartByUser(user.getId());
			return ShopService.subTotal(list);
		}
		return null;
	}
	
	// model cho feature product Top sản phẩm gia cao nhat
	@ModelAttribute("TopFlower")
	public List<Flower> arrange(int from,int to) {
		List<Flower> list=flowerDao.getListFlower();
		Collections.sort(list, new Comparator<Flower>() {
			@Override
			 public int compare(Flower f1,Flower f2){
				if (f1.getDiscount()==null) f1.setDiscount(0);
				if (f2.getDiscount()==null) f1.setDiscount(0);
				BigDecimal sale1=(f1.getPrice().multiply(BigDecimal.valueOf(f1.getDiscount()))).divide(BigDecimal.valueOf(100));
				BigDecimal sale2=(f2.getPrice().multiply(BigDecimal.valueOf(f2.getDiscount()))).divide(BigDecimal.valueOf(100));
				return (f2.getPrice().add(sale2.multiply(BigDecimal.valueOf(-1)))).compareTo(
						f1.getPrice().add(sale1.multiply(BigDecimal.valueOf(-1))));
				
		}});
		return list.subList(from, to);
	}
	
}
