package com.niit.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.DaoImpl.CategoryDaoImpl;
import com.DaoImpl.ProductDaoImpl;
import com.DaoImpl.SupplierDaoImpl;
import com.DaoImpl.UserDaoImpl;
import com.Model.Product;
import com.Model.UserData;

@Controller
public class indexController 
  {
	
    @Autowired
    UserDaoImpl userDaoImpl;
    @Autowired
    SupplierDaoImpl supplierDaoImpl;
    @Autowired
    CategoryDaoImpl categoryDaoImpl;
    @Autowired
    ProductDaoImpl  productDaoImpl;
    
    @RequestMapping("/")
    public String index()
    {
    	return "index";
    }
         
    @RequestMapping("/header")
    public String header()
    {
    	return "header";
    }
	@RequestMapping("/home")
	public String home()
	{
		return "home";
	}
	
	@RequestMapping("/goToLogin")
	public String Login()
	{	
		return "Login";
	}
	@RequestMapping("/userLogged")
	public String userLogged(HttpSession hs,UserData user,HttpServletRequest req)
	{ 
		System.out.println("userLogged");
		if(req.isUserInRole("ROLE_ADMIN"))
		{
			hs=req.getSession();
			hs.setAttribute("sess", req.getUserPrincipal().getName());
		}
		hs.setAttribute("catList",  categoryDaoImpl.retrieve());
		hs.setAttribute("suppList", supplierDaoImpl.retrieve());
		hs.setAttribute("prodList", productDaoImpl.retrieve());
		return "redirect:/home";
	}

	@RequestMapping("/error")
    public String error()
    {
	
	return "error";
    }
     
	@RequestMapping("/reLogin")
	public String userLogin()
	{
		return "redirect:/goToLogin";
	}
	@RequestMapping(value="/goToRegister" ,method=RequestMethod.GET)
	public ModelAndView goToRegister()
	{
		ModelAndView mv=new ModelAndView();
		mv.addObject("user", new UserData());
		System.out.println("connected");
		mv.setViewName("Register");
		return mv;
	}
	
	@RequestMapping(value="/saveRegister", method=RequestMethod.POST)
	public ModelAndView saveRegister(@ModelAttribute("user") UserData user , BindingResult result)
	{
		ModelAndView mv=new ModelAndView();
		if(result.hasErrors())
		{
			mv.setViewName("Register");
		}
		else
		{
		user.setEnabled(true);
		user.setRole("ROLE_USER");
	    System.out.println(user.isEnabled());
		userDaoImpl.insertUser(user);
		mv.setViewName("Login");
		}
		return mv;			
	}
	
	@RequestMapping(value="/productCustList")
	public ModelAndView getCustTable(@RequestParam("cid") int cid)
	{
		ModelAndView mv=new ModelAndView();
		mv.addObject("prodList", productDaoImpl.getProdByCatId(cid));
		mv.setViewName("productCustList");
		return mv;
	} 
	@RequestMapping("/productDetail")
	public ModelAndView displayProductsDetails(@RequestParam("pId")int pid)
	{
	  ModelAndView mv=new ModelAndView();
      mv.addObject("prod",productDaoImpl.findByPId(pid));
      Product p=productDaoImpl.findByPId(pid);
	  System.out.println("Boolean is:"+p);
	  if(p!=null)
	  {
		mv.setViewName("prodDetails");
	  }
	  else
	  {
		mv.setViewName("redirect:/home");
	  }
	  return mv;
	  }
	@RequestMapping("/prodCatList")
	public ModelAndView getCatTable(@RequestParam("cid")int cid)
	{
		ModelAndView mv=new ModelAndView();
		mv.addObject("prodList" ,productDaoImpl.getProdByCatId(cid));
		mv.setViewName("ProductCustList");
		return mv;
	}
	@RequestMapping("/prodSupList")
	public ModelAndView getSupTable(@RequestParam("sid")int sid)
	{
		ModelAndView mv=new ModelAndView();
		mv.addObject("prodList" ,productDaoImpl.getProdBySupId(sid));
		mv.setViewName("ProductCustList");
		return mv;
	}
	
	@RequestMapping("/productCatListNav")
	public ModelAndView getCatTableNav(@RequestParam("cid")int cid)
	{
		ModelAndView  mv=new ModelAndView();
		mv.addObject("prodList", productDaoImpl.getProdByCatId(cid));
		mv.setViewName("navPages");
		return mv;
	}

	@RequestMapping("/prodSupListNav")
	public ModelAndView getSupTableNav(@RequestParam("sid") int sid) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("prodList", productDaoImpl.getProdBySupId(sid));
		mv.setViewName("navPages");
		return mv;
	}
	
	
	@ModelAttribute
	public void getData(Model m)
	{
		m.addAttribute("catList",categoryDaoImpl.retrieve());
	}

	
}
