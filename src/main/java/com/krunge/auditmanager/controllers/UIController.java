package com.krunge.auditmanager.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.krunge.auditmanager.models.AuditRequest;
import com.krunge.auditmanager.models.LoginUser;
import com.krunge.auditmanager.models.User;
import com.krunge.auditmanager.services.AuditRequestService;
import com.krunge.auditmanager.services.UserService;


@Controller
public class UIController {
	@Autowired
	private UserService userService;
	@Autowired
	private AuditRequestService auditRequestService;

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
	@GetMapping("/requests")
	public String rDashboard(Model model, HttpSession session) {
		//Checks if the user is logged in, otherwise redirects to login page.
		Long userId = (Long) session.getAttribute("userId");
		if(userId==null) {
			return "redirect:/";
		}
		User user = userService.getOne(userId);
		List<AuditRequest> auditRequest = auditRequestService.getAllAuditRequestsSortedByStatus();
		model.addAttribute("user", user);
		model.addAttribute("auditRequest", auditRequest);
		return "dashboard.jsp";
	}
}
