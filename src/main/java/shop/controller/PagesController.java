package shop.controller;

import java.math.BigDecimal;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.Temporal;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import shop.bean.Mailer;
import shop.dao.OrderDAO;
import shop.dao.TransactionDAO;
import shop.dao.UserDAO;
import shop.entity.Order;
import shop.entity.ShopCart;
import shop.entity.Transaction;
import shop.entity.User;
import shop.service.ShopService;

@Transactional
@Controller
@RequestMapping("/pages")
public class PagesController {
	
	@Autowired
	UserDAO userDao;
	
	@Autowired
	TransactionDAO transactionDao;
	
	@Autowired
	OrderDAO orderDao;
	
	@Autowired
	Mailer mailer;
	
	
	final String regex = "^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^-]+(?:\\.[a-zA-Z0-9_!#$%&'*+/=?`{|}~^-]+)*@[a-zA-Z0-9-]+(?:\\.[a-zA-Z0-9-]+)*$";
	final String regPhone = "^(0|\\+84)(\\s|\\.)?((3[2-9])|(5[689])|(7[06-9])|(8[1-689])|(9[0-46-9]))(\\d)(\\s|\\.)?(\\d{3})(\\s|\\.)?(\\d{3})$";

	Pattern pattern = Pattern.compile(regex);
	Pattern pattern1 = Pattern.compile(regPhone);
	// Mapping jsp
	
	// login User
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String login(ModelMap model) {
		model.addAttribute("detailUser", new User());
		return "pages/login";
	}
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String loginValidation(HttpSession session, ModelMap model,@ModelAttribute("detailUser") User user,
			BindingResult errors) {
		
		Matcher matcher = pattern.matcher(user.getEmail().trim());
		
		if (!matcher.matches()) {
			System.out.println(user.getEmail());
			errors.rejectValue("email", "user", "Email invalidate");
		}
		if (user.getEmail().trim().length() == 0) {
			errors.rejectValue("email", "user", "Email cannot be blank");
		}
		if (user.getPassword().trim().length() == 0) {
			errors.rejectValue("password", "user", "Password cannot be blank");
		}

		if (errors.hasErrors()) {
			return "pages/login";
		} else {
			String pass=ShopService.encryptPassword(user.getPassword().trim());
			if (userDao.login(user.getEmail(), pass) == null) {
				model.addAttribute("message", "Invalid Email or Password");
				model.addAttribute("detailUser", new User());
				return "pages/login";
			} else {
				User _user = userDao.login(user.getEmail(), pass);
				System.out.println("fullname...." + _user.getName());
				session.setAttribute("userLogin", _user);
				return "redirect:/pages/my_account.htm";
			}
		}

	}
	
	// logout
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		// remove all session

		User user = (User) session.getAttribute("userLogin");
		if (user != null) {
			session.removeAttribute("userLogin");
		}
		
//		List<ShopCart> list = (List<ShopCart>) session.getAttribute("listCarts");
//		if (list != null) {
//			session.removeAttribute("listCarts");
//		}

//			// show film by day
//			String day = (String) session.getAttribute("chooseDay");
//			if (day != null) {
//				session.removeAttribute("chooseDay");
//			}
//
//			// show time by film
//			Film film = (Film) session.getAttribute("nameFilm");
//			if (film != null) {
//				session.removeAttribute("nameFilm");
//			}
//
//			HourSession listHour = (HourSession) session.getAttribute("listHour");
//			if (listHour != null) {
//				session.removeAttribute("listHour");
//			}

		return "redirect:/";

		}
	
	
	// forgotPassword
	@RequestMapping(value="forgotPassword", method = RequestMethod.GET)
	public String forgotPassword() {
		return "pages/forgotPassword";
	}
	
	@RequestMapping(value = "forgotPassword", method = RequestMethod.POST)
	public String sendEmail(ModelMap model, @RequestParam("email") String email) {
		
		Matcher matcher = pattern.matcher(email.trim());
		
		if (!matcher.matches()) {
			System.out.println(email);
			model.addAttribute("message", "Email invalidate");
		 
		}
		else {
			User user = userDao.getDetailByEmail(email.trim());
			if (user != null) {
				
				int random = (int) Math.floor(((Math.random() * 899999) + 100000));/// random sinh số có 6 chữ số
				String passReset=String.valueOf(random);
				
				String from = "DND_FLOWER_SHOP_2021";
				String subject = "RESET USER'S PASSWORD";
				String body = "User's Email: "+ email.trim() + "\nYour New Password: "+passReset;
				
				user.setPassword(ShopService.encryptPassword(passReset));
				userDao.createOrUpdate(user);
				mailer.send(from, email, subject, body);
				model.addAttribute("success", "Send Success. Check your email to reset password.");
			}
			else {
				model.addAttribute("message", "User's account with this Email does not exists");
			}
		}
		return "pages/forgotPassword";

	}
	
	
	//register
	@RequestMapping(value="register", method = RequestMethod.GET)
	public String register(ModelMap model) {
		model.addAttribute("detailUser", new User());
		return "pages/register";
	}
	// create -register
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String create(ModelMap model, @Validated @ModelAttribute("detailUser") User user,
		 BindingResult errors) {
	

			if (errors.hasErrors()) {
				return "pages/register";

			} else {
				if (userDao.getDetailByEmail(user.getEmail().trim())!=null) {
					model.addAttribute("message","User's account with this Email already exists");
					return "pages/register";
				} 
				if (userDao.getDetailByPhone(user.getPhone().trim())!=null) {
					model.addAttribute("message","User's account with this Phone Number already exists");
					return "pages/register";
				} 
				user.setPassword(ShopService.encryptPassword(user.getPassword().trim()));
				user.setAddress("");
				userDao.createOrUpdate(user);
				return "pages/login";
			}
	}
	
	// my Account
	@RequestMapping(value="my_account",method = RequestMethod.GET)
	public String my_account(ModelMap model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("userLogin");
		
		List<Transaction> Trans=transactionDao.getListTransByUser(user.getId());
		model.addAttribute("Trans", Trans);
		return "pages/my_account";
	}
	
	@RequestMapping(value="my_account/userOrders/{idTrans}",method = RequestMethod.GET)
	public String userOrders(ModelMap model,@PathVariable("idTrans") int idTrans,HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("userLogin");
		
		
		List<Order> orders=orderDao.getListOrderByTrans(idTrans);
		Transaction trans=transactionDao.getTransById(idTrans);
		
		
		if (trans.getUser().getId() != user.getId()) {
			System.out.print(user.getId());
			return "pages/error404";
		}
		
		
		model.addAttribute("subTotal1",ShopService.subTotal1(orders));
		model.addAttribute("ship1",ShopService.ship1(orders));
		model.addAttribute("trans", trans);
		model.addAttribute("orders", orders);
		return "pages/userOrders";
	}
	
	@RequestMapping(value="my_account/userOrders/update/{orderId}",method = RequestMethod.GET)
	public String updateOrders(ModelMap model,@PathVariable("orderId") int orderId,HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("userLogin");
		
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss"); 
		LocalDateTime now = LocalDateTime.now();  
		Order order=orderDao.getOrderById(orderId);
		
		//check lỗi userLogin
		if (order.getTransaction().getUser().getId() != user.getId()) {
			System.out.print(user.getId());
			return "pages/error404";
		}
		
		order.setStatus(true);
		order.setNote(order.getNote()+" - update status: "+dtf.format(now));
		orderDao.createOrUpdate(order);
		
		int idTrans=order.getTransaction().getId();
		List<Order> orders=orderDao.getListOrderByTrans(idTrans);
		// xét điều kiện cập nhật Transaction
		if (ShopService.checkUpdateTrans(orders)) {
			Transaction trans=transactionDao.getTransById(idTrans);
			trans.setStatus(true);
			transactionDao.createOrUpdate(trans);
		}
		model.addAttribute("message","Update Status Success");
		model.addAttribute("orders", orders);
		return "redirect:/pages/my_account/userOrders/"+idTrans+".htm";
	}
	
	//delete order -> check delete Transaction
	@RequestMapping(value="my_account/userOrders/delete/{orderId}",method = RequestMethod.GET)
	public String deleteOrders(ModelMap model,@PathVariable("orderId") int orderId,HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("userLogin");
		
		Order order=orderDao.getOrderById(orderId);
		
		//check lỗi userLogin
		if (order.getTransaction().getUser().getId() != user.getId()) {
			System.out.print(user.getId());
			return "pages/error404";
		}
		
		int idTrans=order.getTransaction().getId();
		orderDao.delete(orderId);
		
		List<Order> orders=orderDao.getListOrderByTrans(idTrans);
		if (orders.size()!=0) {
			order.getTransaction().setAmount(order.getTransaction().getAmount().add(order.getAmount().multiply(BigDecimal.valueOf(-1))));
			transactionDao.createOrUpdate(order.getTransaction());
			model.addAttribute("message","Delete Success");
			model.addAttribute("orders", orders);
			return "redirect:/pages/my_account/userOrders/"+idTrans+".htm";
		}
		else {
			model.addAttribute("message","Delete Orders Success");
			transactionDao.delete(idTrans);
			List<Transaction> Trans=transactionDao.getListTransByUser(user.getId());
			model.addAttribute("Trans", Trans);
			return "pages/my_account";
		}
	}
	
	// Modify account
	@RequestMapping(value="my_account/update",method = RequestMethod.POST)
	public String updateAccount(ModelMap model,HttpServletRequest request,
							@RequestParam("fullname") String name,
							@RequestParam("phone") String phone,
							@RequestParam("address") String address,
							@RequestParam("email") String email) {
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("userLogin");
		
		boolean kt=true;
		Matcher matcher = pattern.matcher(email.trim());
		Matcher matcher1 = pattern1.matcher(phone.trim());
		if(name.trim().isEmpty()) {
				kt=false;
				model.addAttribute("message", "Name cannot be blank");
		}
		else if(address.trim().isEmpty()) {
				kt=false;
				model.addAttribute("message", "Address cannot be blank");
		}
		else if (!matcher.matches()) {
			kt=false;
			model.addAttribute("message", "Email invalidate");
		}
		else if(!matcher1.matches()) {
			kt=false;
			model.addAttribute("message", "Phone is not illegal");
		}
		else {
			User user1=userDao.getDetailByEmail(email.trim());
			User user2=userDao.getDetailByPhone(phone.trim());
			if (user1!=null && user1.getId()!=user.getId()) {
				kt=false;
				model.addAttribute("message","User's account with this Email already exists");
			}
			else if (user2!=null && user2.getId()!=user.getId()) {
				kt=false;
				model.addAttribute("message","User's account with this Phone Number already exists");
			}
		}
		
		if (kt) {
			// xử lý lưu 
			user.setEmail(email);
			user.setPhone(phone);
			user.setAddress(address);
			user.setName(name);
			userDao.createOrUpdate(user);
			model.addAttribute("message", "Update account Sucess !");
		}
		
		List<Transaction> Trans=transactionDao.getListTransByUser(user.getId());
		model.addAttribute("Trans", Trans);
		return "pages/my_account";
	}
	
	// Change password account
	@RequestMapping(value="my_account/changePassword",method = RequestMethod.POST)
	public String changePass(ModelMap model,HttpServletRequest request,
			@RequestParam("current-pwd") String oldPass,
			@RequestParam("new-pwd") String newPass,
			@RequestParam("confirm-pwd") String confirmPass) {
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("userLogin");
		
		User user1=userDao.getUserById(user.getId());
		String password=user1.getPassword();
//		System.out.println(user1.toString()+ user1.getPassword());
//		System.out.println(oldPass);
		
		boolean kt=true;
		if(oldPass.trim().isEmpty()) {
			kt=false;
			model.addAttribute("message", "Password cannot be blank");
		}
		else if( (!ShopService.descryptPassword(oldPass.trim(),password)) ) {
			kt=false;
			model.addAttribute("message", "Old Password is not true");
		}
		else if(newPass.trim().isEmpty()) {
			kt=false;
			model.addAttribute("message", "New Password cannot be blank");
		}
		else if(confirmPass.trim().compareTo(newPass.trim())!=0) {
			kt=false;
			model.addAttribute("message", "Confirm Password is false");
		}
		if (kt) {
			// xử lý lưu 
			user.setPassword(ShopService.encryptPassword(newPass.trim()));
			userDao.createOrUpdate(user);
			model.addAttribute("message", "Change Password Sucess !");
		}
		
		List<Transaction> Trans=transactionDao.getListTransByUser(user.getId());
		model.addAttribute("Trans", Trans);
		return "pages/my_account";
	}
	
	
	
	@RequestMapping("error")
	public String error() {
		return "pages/error404";
	}
	
	@RequestMapping("about_us")
	public String about_us() {
		return "pages/about_us";
	}
	
	// send mail contact_us
	@RequestMapping(value="contact_us",method = RequestMethod.GET)
	public String contact_us() {
		return "pages/contact_us";
	}
	
	@RequestMapping(value="contact_us",method = RequestMethod.POST)
	public String contact_us(ModelMap model,
							@RequestParam("con_name") String con_name,
							@RequestParam("con_email") String con_email,
							@RequestParam("con_content") String subject,
							@RequestParam("con_message") String body) {
		
		try {
			Matcher matcher = pattern.matcher(con_email.trim());
			if (!matcher.matches()) {
				System.out.println(con_email);
				model.addAttribute("message", "Email invalidate");
			}
			else if(con_name.trim().isEmpty()) {
				model.addAttribute("message", "Name cannot be blank");
			}
			else if(subject.trim().isEmpty()) {
				model.addAttribute("message", "Subject cannot be blank");
			}
			else if(body.trim().isEmpty()) {
				model.addAttribute("message", "Message Body cannot be blank");
			}
			else {
				//Send Mail
				String from=con_email.trim();
				body="From Name: "+ con_name+" - Email: "+con_email+body;
				subject="Chăm Sóc Khách Hàng - "+subject;
			    String to="dndflowershop@gmail.com"; // mã hóa vào file conf sau
				mailer.send(from, to, subject, body);
				model.addAttribute("message", "Send Email Sucess !");
			}
		}
		catch (Exception ex) {
			// TODO: handle exception
			ex.printStackTrace();
			model.addAttribute("message", "Can not Send Email !");
		}
		
		return "pages/contact_us";
	}
	
	@RequestMapping("frequently_questions")
	public String frequently_questions() {
		return "pages/frequently_questions";
	}
	
	
	
	// set các Model Atribute chung 
	
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
