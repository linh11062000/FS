package shop.service;

import java.math.BigDecimal;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.xml.bind.DatatypeConverter;

import org.springframework.beans.factory.annotation.Autowired;

import shop.dao.OrderDAO;
import shop.dao.ShopCartDAO;
import shop.dao.TransactionDAO;
import shop.entity.Flower;
import shop.entity.Order;
import shop.entity.ShopCart;
import shop.entity.Transaction;

public class ShopService {

	@Autowired
	ShopCartDAO cartDao;
	
	@Autowired
	TransactionDAO transactionDao;
	
	@Autowired
	OrderDAO orderDao;
	
	// Trang Cart+ checkout
	public static BigDecimal subTotal(List<ShopCart> list) {
		BigDecimal total=BigDecimal.ZERO;
		
		for(ShopCart cart:list) {
			total=total.add(cart.getAmount().multiply(BigDecimal.valueOf(cart.getQuantity())));
		}
		
		return total;
	}
	public static BigDecimal ship(List<ShopCart> list) {
		BigDecimal total=BigDecimal.ZERO;
		BigDecimal ship=BigDecimal.ZERO;
		
		for(ShopCart cart:list) {
			total=total.add(cart.getAmount().multiply(BigDecimal.valueOf(cart.getQuantity())));
		}
		
		if(total.compareTo(BigDecimal.valueOf(1500000))==-1) {
			ship=total.divide(BigDecimal.valueOf(20));
		}
		
		return ship;
	}
	
	// Trang View detail User
	public static BigDecimal subTotal1(List<Order> list) {
		BigDecimal total=BigDecimal.ZERO;
		
		for(Order order:list) {
			total=total.add(order.getAmount().multiply(BigDecimal.valueOf(order.getQuantity())));
		}
		
		return total;
	}
	public static BigDecimal ship1(List<Order> list) {
		BigDecimal total=BigDecimal.ZERO;
		BigDecimal ship=BigDecimal.ZERO;
		
		for(Order order:list) {
			total=total.add(order.getAmount().multiply(BigDecimal.valueOf(order.getQuantity())));
		}
		
		if(total.compareTo(BigDecimal.valueOf(1500000))==-1) {
			ship=total.divide(BigDecimal.valueOf(20));
		}
		
		return ship;
	}
	
	// update status Transaction
	public static boolean checkUpdateTrans(List<Order> orders) {
		boolean kt=true;
		for (Order order:orders) {
			if (!order.isStatus()) {
				kt=false;
			}
		}
		return kt;
	}
	
	// mã hóa
	public static String encryptPassword(String password) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(password.getBytes());
			byte[] digest = md.digest();
			String myHash = DatatypeConverter.printHexBinary(digest).toUpperCase();
			return myHash;
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	public static boolean descryptPassword(String inputPassword, String hashPassword) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(inputPassword.getBytes());
			byte[] digest = md.digest();
			String myCheck = DatatypeConverter.printHexBinary(digest).toUpperCase();
			return hashPassword.equals(myCheck);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
}
