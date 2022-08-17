package shop.controller;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import shop.entity.ShopCart;

@Transactional
@Controller
@RequestMapping("/blog")
public class BlogController {
	// Mapping jsp
		@RequestMapping("main")
		public String index() {
			return "blog/main";
		}
		
		@RequestMapping("detail")
		public String detail() {
			return "blog/detail";
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
}
