package shop.controller;

import java.io.File;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
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
import org.springframework.web.multipart.MultipartFile;

import shop.bean.UploadFile;
import shop.dao.CategoryDAO;
import shop.dao.ColorDAO;
import shop.dao.FlowerDAO;
import shop.dao.ManageFlowerDAO;
import shop.entity.Admin;
import shop.entity.Category;
import shop.entity.Color;
import shop.entity.Flower;
import shop.entity.User;

@Controller
@RequestMapping("/admin/flower")
public class ManageFlowerController {
	@Autowired
	ManageFlowerDAO manageFlowerDAO;
	
	@Autowired
	FlowerDAO flowerDao;
	
	@Autowired
	ColorDAO colorDAO;
	
	@Autowired
	CategoryDAO categoryDAO;
	
	@Autowired
	@Qualifier("uploadfile")
	UploadFile baseUploadfile;
	
	@Autowired
	ServletContext context;
	
	
	@RequestMapping(value="", method=RequestMethod.GET)
	public String home(ModelMap model, HttpServletRequest request) {
		/*model.addAttribute("listFlower", manageFlowerDAO.getListFlower());*/
		
		HttpSession session = request.getSession();
		Admin admin = (Admin) session.getAttribute("adminLogin");
		
		if (admin==null) {
			return "pages/error404";
		}
		
		List<Flower> flowerList = manageFlowerDAO.getListFlower();
		PagedListHolder pagedListHolder = new PagedListHolder(flowerList);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(2);
		pagedListHolder.setPageSize(5);
		model.addAttribute("pagedListHolder", pagedListHolder);
		
		return "admin/flower";
	}
	
	@ModelAttribute("flowerNew")
	public Flower flowerNew() {
		return new Flower();
	}
	@ModelAttribute("flowerEdit")
	public Flower flowerEdit() {
		return new Flower();
	}
	
	@ModelAttribute("getListCL")
	public List<Color> getListColors() {
		List<Color> list = colorDAO.getListColor();
		return list;
	}
	@ModelAttribute("getListCA")
	public List<Category> getListCategory() {
		List<Category> list = categoryDAO.getListCategory();
		return list;
	}
	
	@RequestMapping(value="insert", method=RequestMethod.POST)
	public String insert(ModelMap model, HttpServletRequest request,   @ModelAttribute("flowerNew") Flower flowerNew, @RequestParam("photo") MultipartFile photo,   BindingResult errors) {
		model.addAttribute("them_saidinhdang", errors.hasErrors());
		model.addAttribute("flowerNew", flowerNew);
		
		if(flowerNew.getName().trim().length() == 0) {
			errors.rejectValue("name", "flowerNew", "Vui lòng nhập tên hoa");
		}
		if(flowerNew.getPrice() == null) {
			errors.rejectValue("price", "flowerNew", "Vui lòng nhập giá");
		}
		if(errors.hasErrors()) {
			model.addAttribute("message", "Vui lòng nhập đầy đủ thông tin tin!");
			return home(model, request);
		}
		try {
			String date = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyMMddHHmmss-"));
			 String fileName = date + photo.getOriginalFilename();
			String photoPath = baseUploadfile.getBasePath() + File.separator + fileName;
			photo.transferTo(new File(photoPath));
			Thread.sleep(2000);
			flowerNew.setImage(fileName);
			
			// add color vs category
			List<Color> lc=new ArrayList<Color>();
			lc.add(colorDAO.getColorById(10));
	
			List<Category> lca=new ArrayList<Category>();
			lca.add(categoryDAO.getCategoryById(1));
			flowerNew.setCategories(lca);
			flowerNew.setColors(lc);
			
			model.addAttribute("insert", manageFlowerDAO.save(flowerNew));
			return home(model, request);
		} catch (Exception e) {
			// TODO: handle exception	
			model.addAttribute("insert", false);
			model.addAttribute("flowerNew", flowerNew);
			return home(model, request);
		}
	}
	
	@RequestMapping(value="edit/{id}", method=RequestMethod.GET)
	public String showFormEdit(ModelMap model,HttpServletRequest request, @ModelAttribute("flowerEdit") Flower flowerEdit, @PathVariable String id) {
		model.addAttribute("formEdit", true);
		model.addAttribute("flowerEdit", manageFlowerDAO.getFlowerById(id));
		System.out.println(manageFlowerDAO.getFlowerById(id));
		return home(model, request);
	}
	
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String update(ModelMap model,HttpServletRequest request, @ModelAttribute("flowerEdit") Flower flowerEdit, @RequestParam("photo") MultipartFile photo, BindingResult errors) {
		model.addAttribute("sua_saidinhdang", errors.hasErrors());
		model.addAttribute("flowerEdit", flowerEdit);
		if(flowerEdit.getName().trim().length() == 0) {
			errors.rejectValue("name", "flowerNew", "Vui lòng nhập tên hoa");
		}
		if(flowerEdit.getPrice() == null) {
			errors.rejectValue("price", "flowerNew", "Vui lòng nhập giá");
		}
		if(errors.hasErrors()) {
			return home(model, request);
		}
		if(photo.isEmpty()) {
			System.out.print(flowerEdit.getId());
			Flower flower_tam= flowerDao.getFlowerById(flowerEdit.getId());
			flowerEdit.setImage(flower_tam.getImage());
			model.addAttribute("update", manageFlowerDAO.update(flowerEdit));
			model.addAttribute("flowerEdit", new Flower());
			return home(model, request);
		} else {
			try {
				String date = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyMMddHHmmss-"));
				String fileName = date + photo.getOriginalFilename();
				String photoPath = baseUploadfile.getBasePath() + File.separator + fileName;
				photo.transferTo(new File(photoPath));
				Thread.sleep(2000);
				flowerEdit.setImage(fileName);
				model.addAttribute("update", manageFlowerDAO.update(flowerEdit));
				model.addAttribute("flowerEdit", new Flower());
				return home(model, request);
			} catch (Exception e) {
				// TODO: handle exception
				model.addAttribute("update", false);
				model.addAttribute("flowerEdit", flowerEdit);
				return home(model, request);
			}
		}
	}
	
	@RequestMapping(value = "delete", method=RequestMethod.POST)
	public String delete(ModelMap model,HttpServletRequest request, @RequestParam("id") Integer id) {
		System.out.println("id = " + id);
		Flower f = new Flower();
		f.setId(id);
		model.addAttribute("delete", manageFlowerDAO.delete(f));
		return home(model, request);
	}
	
	@RequestMapping(value= "", params = "btnsearch")
	public String searchFlower(HttpServletRequest request, ModelMap model) {
		List<Flower> flowers = manageFlowerDAO.search(request.getParameter("searchInput"));
		PagedListHolder pagedListHolder = new PagedListHolder(flowers);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(2);
		pagedListHolder.setPageSize(5);
		model.addAttribute("pagedListHolder", pagedListHolder);
		
		return "admin/flower";
	}
}
