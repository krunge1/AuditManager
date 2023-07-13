package com.krunge.auditmanager.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.krunge.auditmanager.models.AuditRequest;
import com.krunge.auditmanager.models.Comment;
import com.krunge.auditmanager.models.User;
import com.krunge.auditmanager.services.AuditRequestService;
import com.krunge.auditmanager.services.CommentService;
import com.krunge.auditmanager.services.UserService;

@Controller
@RequestMapping("/requests")
public class AuditRequestController {
	@Autowired
	private AuditRequestService auditRequestService;
	
	@Autowired
	private UserService userService;

	@Autowired
	private CommentService commentService;
	

//Gets
	//Get method to render the new Audit Request creation page
	@GetMapping("/new")
	public String rNewAuditRequest(
			Model model,
			HttpSession session
			){
		//Tests if user is logged in. Returns to login page if not in session.
		Long userId = (Long) session.getAttribute("userId");
		if(userId==null) {
			return "redirect:/";
		}	
		model.addAttribute("user", userService.getOne(userId));
		model.addAttribute("auditRequest", new AuditRequest());
		return "newAuditRequest.jsp";
	}
	
	//Get method to view an Audit Request page
	@GetMapping("/{id}")
	public String rAuditRequest(
			@PathVariable("id") Long auditRequestId,
			HttpSession session,
			Model model
			) throws IOException {
		//Tests if user is logged in. Returns to login page if not in session.
		Long userId = (Long) session.getAttribute("userId");
		if(userId==null) {
			return "redirect:/";
		}
		List<Comment> comments = commentService.getAll();
		model.addAttribute("auditRequest", auditRequestService.getOne(auditRequestId));
		model.addAttribute("user", userService.getOne(userId));
		model.addAttribute("comment", new Comment());
		model.addAttribute("comments", comments);
		return "viewAuditRequest.jsp";
	 }
	
	//Get method to view edit page of an Audit Request
	@GetMapping("/{id}/edit")
	public String rEditAuditRequest(
			@PathVariable("id") Long auditRequestId,
			HttpSession session,
			Model model
			) {
		//Tests if user is logged in. Returns to login page if not in session.
		Long userId = (Long) session.getAttribute("userId");
		if(userId==null) {
			return "redirect:/";
		}
		//Tests if user owns the Audit Request. Returns to view page if not.
		AuditRequest auditRequest = auditRequestService.getOne(auditRequestId);
		User auditRequestUser = auditRequest.getUser();
		if(!auditRequestUser.getId().equals(userId)) {
			return "redirect:/requests/{id}";
		}
		model.addAttribute("auditRequest", auditRequestService.getOne(auditRequestId));
		model.addAttribute("user", userService.getOne(userId));
		return "editAuditRequest.jsp";
	}

//POSTS
	//Post method to initially create an Audit Request
	@PostMapping("/create")
	public String pNewAuditRequest(
			@Valid @ModelAttribute("auditRequest") AuditRequest auditRequest,
			BindingResult result,
			Model model,
			HttpSession session
			) {
	Long userId = (Long) session.getAttribute("userId");
	User user = userService.getOne(userId);
	model.addAttribute(user);
	//New Audit Request form tests
	if(result.hasErrors()) {
		model.addAttribute("user", userService.getOne(userId));
		return "newAuditRequest.jsp";
	}
	//Service call and tests for database requirements
	AuditRequest r = auditRequestService.createOrUpdate(auditRequest, result);
	if (r == null) {
		model.addAttribute("user", userService.getOne(userId));
		return "newAuditRequest.jsp";
	}
	return "redirect:/requests";
	}
	
	@PostMapping("/{id}/createComment")
	public String pNewComment(
			@PathVariable("id") Long auditRequestId,
			@Valid @ModelAttribute("comment") Comment comment,
			BindingResult result,
			Model model,
			HttpSession session
			) {
		Long userId = (Long) session.getAttribute("userId");
		User user = userService.getOne(userId);
		
		model.addAttribute(user);
		//New Audit Request form tests
		if(result.hasErrors()) {
			model.addAttribute("user", userService.getOne(userId));
			return "viewAuditRequest.jsp";
		}
		//Service call and tests for database requirements
		Comment c = commentService.createOrUpdate(comment, result);
		if (c == null) {
			model.addAttribute("user", userService.getOne(userId));
			return "viewAuditRequest.jsp";
		}
		return "redirect:/requests/{id}";
	}
	
//PUTS
	//Put method to edit Audit Request
	@PutMapping("/{id}/edit")
	public String pEditAuditRequest(
			@PathVariable("id") Long auditRequestId,
			@Valid @ModelAttribute("auditRequest") AuditRequest auditRequest,
			BindingResult result,
			Model model,
			HttpSession session
			) {
		Long userId = (Long) session.getAttribute("userId");
		User user = userService.getOne(userId);
		model.addAttribute(user);
		
		//Edit Audit Request tests
		if(result.hasErrors()) {
			model.addAttribute("user", userService.getOne(userId));
			return "editAuditRequest.jsp";	
		}
		//Service call and tests for database requirements
		AuditRequest r = auditRequestService.createOrUpdate(auditRequest, result);
		if(r == null) {
			model.addAttribute("user", userService.getOne(userId));
			return "editAuditRequest.jsp";
		}
		return "redirect:/requests";
	}
	
		
//REQUESTS
	//Request method to delete an Audit Request
	@RequestMapping("/{id}/delete")
	public String pAuditRequestDelete(
			@PathVariable("id") Long auditRequestId,
			HttpSession session
			) {
		//Tests if user is logged in. Returns to login page if not in session.
		Long userId = (Long) session.getAttribute("userId");
		if(userId==null) {
			return "redirect:/";
		}
		//Tests if the user owns the Audit Request. REturns to view page if not.
		AuditRequest auditRequest = auditRequestService.getOne(auditRequestId);
		User auditRequestUser = auditRequest.getUser();
		if(!auditRequestUser.getId().equals(userId)) {
			return "redirect:/requests/{id}";
		}
		auditRequestService.deleteById(auditRequestId);
		return "redirect:/requests";
	}
	
}
