package com.krunge.auditmanager.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.krunge.auditmanager.models.LoginUser;
import com.krunge.auditmanager.models.User;
import com.krunge.auditmanager.services.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	
	@PostMapping("/register")
	public String pRegister(
			@Valid @ModelAttribute("user")User user,
			BindingResult result,
			Model model,
			HttpSession session

			) {
	//Tests if model requirements are met and renders the login page if error
		if (result.hasErrors()) {
			model.addAttribute("loginUser", new LoginUser());
			return "login.jsp";
		}
		
	//Service call and tests for database requirements  
		User u = userService.createOrUpdate(user, result);
		if(u == null) {
			model.addAttribute("loginUser", new LoginUser());
			return "login.jsp";
		}	
		
		
		session.setAttribute("userId", user.getId());
		return "redirect:/requests";
	}
	
	@PostMapping("/login")
	public String pLogin(
			@Valid @ModelAttribute("loginUser") LoginUser loginUser,
			BindingResult result,
			Model model,
			HttpSession session) {
	
	//Login form tests
		if(result.hasErrors()) {
			model.addAttribute("user", new User());
			return "login.jsp";
		}

	//Service call and tests for database requirements  
		User u = userService.login(loginUser, result);
		if(u == null) {
			model.addAttribute("user", new User());
			return "login.jsp";
		}	
				
		session.setAttribute("userId", u.getId());
		return "redirect:/requests";
	}

}
