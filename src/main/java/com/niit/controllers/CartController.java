package com.niit.controllers;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Principal;

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
import java.util.List;

import com.Dao.OrderDao;
import com.DaoImpl.CartDaoImpl;
import com.DaoImpl.CategoryDaoImpl;
import com.DaoImpl.ProductDaoImpl;
import com.DaoImpl.SupplierDaoImpl;
import com.DaoImpl.UserDaoImpl;
import com.Model.Cart;
import com.Model.Category;
import com.Model.Orders;
import com.Model.Product;
import com.Model.Supplier;
import com.Model.UserData;


@SuppressWarnings("unused")
@Controller
public class CartController {
	@Autowired
	SupplierDaoImpl supplierDaoImpl;
	
	@Autowired
	CategoryDaoImpl categoryDaoImpl;
	
	@Autowired
	ProductDaoImpl productDaoImpl;
	
	@Autowired
	CartDaoImpl cartDaoImpl;
	
	@Autowired
	OrderDao ordersDaoImpl;
	
	@Autowired
	UserDaoImpl userDaoImpl;

	@RequestMapping(value = "/prodDetails/${p.pid}")
	public ModelAndView prodDet(@PathVariable("pid") int pid) {
		ModelAndView mv = new ModelAndView();
		Product p = productDaoImpl.findByPId(pid);
		mv.addObject("p", p);
		mv.setViewName("prodDetails");
		return mv;
	}

	@RequestMapping(value = "/addToCart", method = RequestMethod.POST)
	public ModelAndView addtoCart(HttpServletRequest request) 
	{
		ModelAndView mv = new ModelAndView();
		Principal principal = request.getUserPrincipal();
		String userEmail = principal.getName();
		try {
			int pid = Integer.parseInt(request.getParameter("pid"));
			Double pPrice = Double.parseDouble(request.getParameter("pPrice"));
			int qty = Integer.parseInt(request.getParameter("pQty"));
			String pname = request.getParameter("pname");
			String imgName = request.getParameter("imgName");
			Cart cartExist = cartDaoImpl.getCartById(pid, userEmail);
			
			if (cartExist == null) {
				Cart cm = new Cart();
				cm.setCartPrice(pPrice);
				cm.setCartProductId(pid);
				cm.setCartStock(qty);
				cm.setCartImage(imgName);
				cm.setCartProductName(pname);

				UserData u = userDaoImpl.findUserByEmail(userEmail);
				cm.setCartUserDetails(u);
				cartDaoImpl.insertCart(cm);
			 } 
			else if (cartExist != null)
			{
				Cart cm = new Cart();
				cm.setCartId(cartExist.getCartId());
				cm.setCartPrice(pPrice);
				cm.setCartProductId(pid);
				cm.setCartStock(cartExist.getCartStock() + qty);
				cm.setCartImage(imgName);
				cm.setCartProductName(pname);
				UserData u = userDaoImpl.findUserByEmail(userEmail);
				cm.setCartUserDetails(u);
				cartDaoImpl.updateCart(cm);
			}
			mv.addObject("cartInfo", cartDaoImpl.findByCartId(userEmail));
			mv.setViewName("cart");
			return mv;
		  } 
		    catch (Exception e) {
			e.printStackTrace();
			mv.addObject("cartInfo", cartDaoImpl.findByCartId(userEmail));
			mv.setViewName("cart");
			return mv;
		}

	}

	@RequestMapping(value="/checkout", method = RequestMethod.GET)
	public ModelAndView checkoutProcess(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		Principal principal = req.getUserPrincipal();
		String userEmail = principal.getName();
		UserData u = userDaoImpl.findUserByEmail(userEmail);
		List<Cart> cart = cartDaoImpl.findByCartId(userEmail);
		mv.addObject("user", u);
		mv.addObject("cart", cart);
		mv.setViewName("checkout");
		return mv;
	}

	@RequestMapping(value="/OrderProcess", method = RequestMethod.POST)
	public ModelAndView orderProcess(HttpServletRequest req)
	{
		ModelAndView mv = new ModelAndView("ack");
		Orders ord = new Orders();
		Principal principal = req.getUserPrincipal();
		String userEmail = principal.getName();
		List<Cart> cart=cartDaoImpl.findByCartId(userEmail);
		Double total = Double.parseDouble(req.getParameter("total"));
		String payment = req.getParameter("payment");
		UserData u = userDaoImpl.findUserByEmail(userEmail);
		ord.setUser(u);
		ord.setTotal(total);
		ord.setPayment(payment);
		ordersDaoImpl.insertOrder(ord);
		mv.addObject("user", userDaoImpl.findUserByEmail(userEmail));
		mv.addObject("orderDetails", u);
		mv.addObject("cart",cart);
		mv.setViewName("ack");
		return mv;
	}
   /*   @RequestMapping("/ack")
      public String ack()
      {
    	  return "ack";
      }*/
      @RequestMapping(value="/deletePCart/(cartId)")
      public ModelAndView deleteCartItem(@PathVariable("cartId")int cartId,HttpServletRequest req)
      {
    	  ModelAndView mv = new ModelAndView();
  		  Principal principal = req.getUserPrincipal();
  		  String userEmail = principal.getName();
  		  cartDaoImpl.deleteCart(cartId);
    	  mv.addObject("cartInfo", cartDaoImpl.findByCartId(userEmail));
  		  mv.setViewName("cart");
  		  return mv;
      }
      @RequestMapping(value="/goToCart",method=RequestMethod.GET)
      public ModelAndView goTocart(HttpServletRequest req)
      {
    	  ModelAndView mv=new ModelAndView();
    	  Principal principal=req.getUserPrincipal();
    	  String userEmail=principal.getName();
    	  mv.addObject("cartInfo",cartDaoImpl.findByCartId(userEmail));
    	  mv.setViewName("cart");
    	  return mv;
      }

}
