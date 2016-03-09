package com.haph.spsm.master.web.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.haph.spsm.master.entity.User;
import com.haph.spsm.master.service.IUserService;



@Controller
@RequestMapping("/User")
public class UserController {

	@Resource
	private IUserService userService;
	
	@RequestMapping("/Index")
	public ModelAndView Index(){
		return new ModelAndView("Views/system/User");
	}
	
	@ResponseBody
	@RequestMapping("/Add")
	public boolean AddRole(HttpServletRequest request){
		
		String str = request.getParameter("role");
		
		Gson gson = new GsonBuilder()  
		  .setDateFormat("yyyy-MM-dd")  
		  .create();
		
        User user= gson.fromJson(str, User.class); 
        user.setId(null);
		
		 userService.add(user);		
		 return true;
	}
}
