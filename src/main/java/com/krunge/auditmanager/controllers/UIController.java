package com.krunge.auditmanager.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.krunge.auditmanager.models.LoginUser;
import com.krunge.auditmanager.models.User;
import com.krunge.auditmanager.services.UserService;


@Controller
public class UIController {
	@Autowired
	private UserService userService;
	
	@GetMapping("/")
	public String rLoginReg (
			Model model
			){
		model.addAttribute("user", new User());
		model.addAttribute("loginUser", new LoginUser());
		return "login.jsp";
	}
	
	@GetMapping("/logout")
		public String pLogout(HttpSession session) {
			session.setAttribute("userId", null);
			return "redirect:/";
		}
}
