package shop.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import shop.entity.Flower;
import shop.service.FlowerTwo;
import shop.entity.ShopCart;


@Transactional
@Controller
@RequestMapping("/home")
public class HomeController {
	
	@RequestMapping("index")
	public String index() {
		return "home/index";
	}
	
	@RequestMapping("header")
	public String header() {
		return "include/footer";
	}
	@Autowired
	ModelController mc;
	
	@ModelAttribute("listCarts")
	public List<ShopCart> dem(HttpServletRequest request) {
		return mc.dem(request);
	}
	
	@ModelAttribute("sizelistCarts")
	public int size(HttpServletRequest request) {
		return mc.size(request);
	}
	
	@ModelAttribute("totalCarts")
	public BigDecimal total(HttpServletRequest request) {
		return mc.total(request);
	}
	
	// show feature product
	
	@ModelAttribute("TopFlower")
	public List<FlowerTwo> arrange() {
		List<FlowerTwo> list=new ArrayList<FlowerTwo>();
		
		List<Flower> listFlo=mc.arrange(0,12);
		
		for (int i=0;i<listFlo.size()/2;i++) {
			Flower f1=listFlo.get(i);
			Flower f2=listFlo.get(i+6);
			list.add(new FlowerTwo(f1,f2));
		}
		return list;
	}
	
}
