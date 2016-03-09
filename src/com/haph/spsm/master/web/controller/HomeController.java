package com.haph.spsm.master.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/Home")
public class HomeController {

	public HomeController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping("/Index")
	public ModelAndView Index(){
		return new ModelAndView("Views/system/Home");
		
		
	}

}
