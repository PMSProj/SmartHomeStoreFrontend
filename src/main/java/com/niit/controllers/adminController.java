package com.niit.controllers;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.DaoImpl.CategoryDaoImpl;
import com.DaoImpl.ProductDaoImpl;
import com.DaoImpl.SupplierDaoImpl;
import com.Model.Category;
import com.Model.Product;
import com.Model.Supplier;



@Controller
@RequestMapping("/admin")
public class adminController {
	@Autowired
	SupplierDaoImpl supplierDaoImpl;
	@Autowired 
	CategoryDaoImpl categoryDaoImpl;
	@Autowired
	ProductDaoImpl productDaoImpl;
	
	@RequestMapping("/AdminData")
	public String adminData(Model m)
	{	
		m.addAttribute("satList", supplierDaoImpl.retrieve());
		 m.addAttribute("catList", categoryDaoImpl.retrieve());
	     m.addAttribute("prodList", productDaoImpl.retrieve()); 
		return "AdminData";
	}

	
 @RequestMapping(value="/saveSupp",method=RequestMethod.POST)
 @Transactional
 public ModelAndView saveSuppData(@RequestParam("sid")int sid,@RequestParam("sname") String sname)
 {
	 ModelAndView mv=new ModelAndView();
	 Supplier ss=new Supplier();
	 ss.setSid(sid);
	 ss.setsName(sname);
	 supplierDaoImpl.insertSupplier(ss);
	 mv.setViewName("modal");
	 return mv;
 }

 @RequestMapping(value="/saveCat",method=RequestMethod.POST)
 @Transactional
  public ModelAndView saveCatData(@RequestParam("cid") int cid, @RequestParam("cname") String cname)
 {
	 ModelAndView mv=new ModelAndView();
	 Category cat=new Category();
	 cat.setCid(cid);
	 cat.setCname(cname);
	 categoryDaoImpl.insertCategory(cat);
	 mv.setViewName("modal");
	 return mv;
 }
 @RequestMapping(value="/saveProduct" , method=RequestMethod.POST)
  public ModelAndView saveProd(HttpServletRequest request, @RequestParam("file") MultipartFile file)
 {
	 System.out.println("The Product price is:"+request.getParameter("pPrice"));
	 ModelAndView mav=new ModelAndView();
	 Product prod=new Product();
	 prod.setPname(request.getParameter("pName"));
	 prod.setpPrice(Double.parseDouble(request.getParameter("pPrice")));
	 prod.setPdescription(request.getParameter("pDescription"));
	 prod.setStock(Integer.parseInt(request.getParameter("Stock")));
	 prod.setCategory(categoryDaoImpl.findByCId(Integer.parseInt(request.getParameter("pCategory"))));
	 prod.setSupplier(supplierDaoImpl.findBySId(Integer.parseInt(request.getParameter("pSupplier"))));		
     
	 String filepath=request.getSession().getServletContext().getRealPath("/");
     String  filename=file.getOriginalFilename();
     prod.setImgName(filename);
     productDaoImpl.insertProduct(prod);
     System.out.println("File path" + filepath);
     try
     {
    	 byte imagebyte[] =file.getBytes();
    	 BufferedOutputStream fos= new BufferedOutputStream(new FileOutputStream(filepath+"/resources/"+filename));
         fos.write(imagebyte);
    	 fos.close();
     
     }
     catch(IOException e)
     {
    	 e.printStackTrace();
     }
     productDaoImpl.insertProduct(prod);
     mav.setViewName("modal");
	   return mav;
     
 }
 @RequestMapping("/productList")
 public ModelAndView prodList()
 {
	 ModelAndView mv = new ModelAndView();
	 mv.addObject("prodList" , productDaoImpl.retrieve());
	 mv.setViewName("ProductAdminList");
	 return mv;
 }
 @RequestMapping("/supplierList")
 public ModelAndView suppList()
 {
	 ModelAndView mv = new ModelAndView();
	 mv.addObject("suppList" , supplierDaoImpl.retrieve());
	 mv.setViewName("suppAdminList");
	 return mv;
 }
 @RequestMapping("/categoryList")
 public ModelAndView catList()
 {
	 ModelAndView mv = new ModelAndView();
	 mv.addObject("catList" , categoryDaoImpl.retrieve());
	 mv.setViewName("CategoryAdminList");
	 return mv;
 }
 
 @RequestMapping("/deleteProd/{pid}")
 public String deleteProduct(@PathVariable("pid") int pid)
 {
	 productDaoImpl.deleteProd(pid);
	 return "redirect:/productList?del";
 }
 @RequestMapping("/deleteSup/{sid}")
	public String deleteSup(@PathVariable("sid") int sid) {
		supplierDaoImpl.deleteSup(sid);
		return "redirect:/supplierList?del";
	}

	@RequestMapping("/deleteCat/{cid}")
	public String deleteCat(@PathVariable("cid") int cid) {
		categoryDaoImpl.deleteCat(cid);
		return "redirect:/categoryList?del";
	}
 @RequestMapping("/updateProd")
 public ModelAndView updateProduct(@RequestParam("pId") int pId)
 {
	 ModelAndView mv = new ModelAndView();
	 Product p=productDaoImpl.findByPId(pId);
	 mv.addObject("prod" ,p);
	 mv.addObject("cList" , categoryDaoImpl.retrieve());
	 mv.addObject("sList" , supplierDaoImpl.retrieve());
	 mv.setViewName("updateProduct");
	 return mv;
 }
 @RequestMapping(value="/updateProd" , method=RequestMethod.POST)
 public ModelAndView updateProd(HttpServletRequest request, @RequestParam("file") MultipartFile file)
{    
	 ModelAndView mv=new ModelAndView();
	 Product prod=new Product();
	 String pid=request.getParameter("pId");
	 prod.setPid(Integer.parseInt(pid));
	 prod.setPname(request.getParameter("pName"));
	 prod.setpPrice(Double.parseDouble(request.getParameter("pPrice")));
	 prod.setPdescription(request.getParameter("pDescription"));
	 prod.setStock(Integer.parseInt(request.getParameter("pStock")));
	 String cat=request.getParameter("pCategory");
	 String sat=request.getParameter("psupplier");
	 prod.setCategory(categoryDaoImpl.findByCId(Integer.parseInt(request.getParameter(cat))));
	 prod.setSupplier(supplierDaoImpl.findBySId(Integer.parseInt(request.getParameter(sat))));		
    String filepath=request.getSession().getServletContext().getRealPath("/");
    String  filename=file.getOriginalFilename();
    prod.setImgName(filename);
    productDaoImpl.updateProd(prod);
    mv.addObject("prodList",productDaoImpl.retrieve());
    mv.setViewName("ProductAdminList");
    System.out.println("File path:" + filepath);
    try
    {
   	 byte imagebyte[] =file.getBytes();
   	 BufferedOutputStream fos= new BufferedOutputStream(new FileOutputStream(filepath+"/resources/"+filename));
     fos.write(imagebyte);
   	 fos.close();
    
    }
    catch(IOException e)
    {
   	 e.printStackTrace();
    }
 
    return mv;
   }
 
}
