package shop.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.bind.DatatypeConverter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import shop.dao.ManageUserDAO;
import shop.dao.UserDAO;
import shop.entity.Admin;
import shop.entity.Flower;
import shop.entity.User;
import shop.service.ShopService;

@Controller
@RequestMapping("/admin/user")
public class ManageUserController {
	@Autowired
	ManageUserDAO manageUserDAO;
	@Autowired
	UserDAO userDao;
	
	@RequestMapping(value="", method=RequestMethod.GET)
	public String home(ModelMap model, HttpServletRequest request) {
		/*model.addAttribute("listUser", manageUserDAO.getListUser());*/
		
		HttpSession session = request.getSession();
		Admin admin = (Admin) session.getAttribute("adminLogin");
		
		if (admin==null) {
			return "pages/error404";
		}
		List<User> flowerList = manageUserDAO.getListUser();
		PagedListHolder pagedListHolder = new PagedListHolder(flowerList);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(2);
		pagedListHolder.setPageSize(5);
		model.addAttribute("pagedListHolder", pagedListHolder);
		return "admin/user";
	}
	
	@ModelAttribute("userNew")
	public User userNew() {
		return new User();
	}
	@ModelAttribute("userEdit")
	public User userEdit() {
		return new User();
	}
	
	@RequestMapping(value="insert", method=RequestMethod.POST)
	public String insert(ModelMap model, HttpServletRequest request, @ModelAttribute("userNew") User userNew, BindingResult errors) {
		System.out.println("has errors " + errors.hasErrors());
		model.addAttribute("them_saidinhdang", errors.hasErrors());
		model.addAttribute("userNew", userNew);
		if(userNew.getName().trim().length() == 0) {
			errors.rejectValue("name", "userNew", "Vui lòng nhập họ tên");
		}
		if(userNew.getEmail().trim().length() == 0) {
			errors.rejectValue("email", "userNew", "Vui lòng nhập email");
		}
		if(userNew.getPhone().trim().length() != 10) {
			errors.rejectValue("phone", "userNew", "Vui lòng nhập số điện thoại (10 chữ số)");
			model.addAttribute("message","sai định dạng số điện thoại");
		}
		if(userNew.getAddress().trim().length() == 0) {
			errors.rejectValue("address", "userNew", "Vui lòng nhập địa chỉ");
		}
		if(userNew.getPassword().trim().length() == 0) {
			errors.rejectValue("password", "userNew", "Vui lòng nhập password");
		}
		if(errors.hasErrors()) {
			return home(model, request);
		}
		else {
			if (userDao.getDetailByEmail(userNew.getEmail().trim())!=null) {
				model.addAttribute("message","Email đã tồn tại");
				model.addAttribute("insert", false);
				return home(model, request);
			} 
			if (userDao.getDetailByPhone(userNew.getPhone().trim())!=null) {
				model.addAttribute("message","số điện thoại đã tồn tại");
				model.addAttribute("insert", false);
				return home(model, request);
			} 
		}
		userNew.setPassword(ShopService.encryptPassword(userNew.getPassword()));
		model.addAttribute("insert", manageUserDAO.saveOrUpdate(userNew));
		return home(model, request);
	}
	
	@RequestMapping(value = "edit/{id}", method=RequestMethod.GET)
	public String showFormEdit(ModelMap model, HttpServletRequest request, @ModelAttribute("userEdit") User userEdit, @PathVariable Integer id) {
		model.addAttribute("form_edit", true);
		model.addAttribute("userEdit", manageUserDAO.getUserById(id));
		return home(model, request);
	}
	
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String update(ModelMap model, HttpServletRequest request, @ModelAttribute("userEdit") User userEdit, 
			@RequestParam("newpass") String newpass, BindingResult errors) {
		
		model.addAttribute("sua_saidinhdang", errors.hasErrors());
		model.addAttribute("userEdit", userEdit);
		if(userEdit.getName().trim().length() == 0) {
			errors.rejectValue("name", "userEdit", "Vui lòng nhập họ tên");
		}
		if(userEdit.getEmail().trim().length() == 0) {
			errors.rejectValue("email", "userEdit", "Vui lòng nhập email");
		}
		if(userEdit.getPhone().trim().length() != 10) {
			errors.rejectValue("phone", "userEdit", "Vui lòng nhập số điện thoại (10 chữ số)");
			model.addAttribute("message","Sai định dạng số điện thoại");
		}
		if(userEdit.getAddress().trim().length() == 0) {
			errors.rejectValue("address", "userEdit", "Vui lòng nhập địa chỉ");
		}
		/*if(errors.hasErrors()) {
			return home(model);
		}*/
		else {
			User user1=userDao.getDetailByEmail(userEdit.getEmail().trim());
			User user2=userDao.getDetailByPhone(userEdit.getPhone().trim());
			if (user1!=null && user1.getId()!=userEdit.getId()) {
				model.addAttribute("message","Email đã tồn tại");
				model.addAttribute("update", false);
				return home(model, request);
			}
			else if (user2!=null && user2.getId()!=userEdit.getId()) {
				model.addAttribute("message","số điện thoại đã tồn tại");
				model.addAttribute("update", false);
				return home(model, request);
			}
		}
		if(newpass.trim().length() != 0) {
			userEdit.setPassword(ShopService.encryptPassword(newpass.trim()));
		}
		else {
			System.out.print(userEdit.getId());
			User user_tam= userDao.getUserById(userEdit.getId());
			userEdit.setPassword(user_tam.getPassword());
		}
		model.addAttribute("update", manageUserDAO.updated(userEdit));
		return home(model, request);
	}
	
	@RequestMapping(value="delete", method=RequestMethod.POST)
	public String delete(ModelMap model, HttpServletRequest request, @RequestParam("id") Integer id) {
		User user = new User();
		user.setId(id);
		model.addAttribute("delete", manageUserDAO.delete(user));
		return home(model, request);
	}
	
	@RequestMapping(value= "", params = "btnsearch")
	public String searchUser(HttpServletRequest request, ModelMap model) {
		List<User> users = manageUserDAO.search(request.getParameter("searchInput"));
		PagedListHolder pagedListHolder = new PagedListHolder(users);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(2);
		pagedListHolder.setPageSize(5);
		model.addAttribute("pagedListHolder", pagedListHolder);
		
		return "admin/user";
	}
	
//	public static String encryptPassword(String password) {
//		try {
//			MessageDigest md = MessageDigest.getInstance("MD5");
//			md.update(password.getBytes());
//			byte[] digest = md.digest();
//			String myHash = DatatypeConverter.printHexBinary(digest).toUpperCase();
//			return myHash;
//		} catch (NoSuchAlgorithmException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			return null;
//		}
//	}
//	
//	public static boolean descryptPassword(String inputPassword, String hashPassword) {
//		try {
//			MessageDigest md = MessageDigest.getInstance("MD5");
//			md.update(inputPassword.getBytes());
//			byte[] digest = md.digest();
//			String myCheck = DatatypeConverter.printHexBinary(digest).toUpperCase();
//			return hashPassword.equals(myCheck);
//		} catch (NoSuchAlgorithmException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			return false;
//		}
//	}
	
}
