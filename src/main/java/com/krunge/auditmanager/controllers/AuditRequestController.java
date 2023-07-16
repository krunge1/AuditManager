package com.krunge.auditmanager.controllers;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.tomcat.util.http.fileupload.FileUtils;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.krunge.auditmanager.models.AuditRequest;
import com.krunge.auditmanager.models.Comment;
import com.krunge.auditmanager.models.FileData;
import com.krunge.auditmanager.models.User;
import com.krunge.auditmanager.services.AuditRequestService;
import com.krunge.auditmanager.services.CommentService;
import com.krunge.auditmanager.services.FileDataService;
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
	
	@Autowired
	private FileDataService fileDataService;
	
	private static String UPLOAD_FOLDER = "src/main/resources/static/AuditItems";
	

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
		List <FileData>requestFiles = fileDataService.getAllByRequestId(auditRequestId);
		List <Comment> requestComments = commentService.getByAuditRequestId(auditRequestId);
		model.addAttribute("auditRequest", auditRequestService.getOne(auditRequestId));
		model.addAttribute("user", userService.getOne(userId));
		model.addAttribute("requestComments", requestComments);
		model.addAttribute("comment", new Comment());
		model.addAttribute("requestFiles", requestFiles);
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
		User auditRequestUser = auditRequest.getRequestUser();
		if(!auditRequestUser.getId().equals(userId)) {
			return "redirect:/requests/{id}";
		}
		model.addAttribute("auditRequest", auditRequestService.getOne(auditRequestId));
		model.addAttribute("user", userService.getOne(userId));
		return "editAuditRequest.jsp";
	}
	
//	//Get method to download File
//	@GetMapping("/requests/{name}")
//	public ResponseEntity<Resource> dFileDownload(
//			@PathVariable("name") String name) {
//
//		Path filePath = Paths.get(UPLOAD_FOLDER, name);
//		Resource fileResource = (Resource) new FileSystemResource(filePath.toFile());
//		
//		if(((FileSystemResource) fileResource).exists()) {
//			String contentType = fileDataService.determineContentType(name);
//			 // Return the file as a response entity with appropriate headers
//	        return ResponseEntity.ok()
//	                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + name + "\"")
//	                .contentType(MediaType.parseMediaType(contentType))
//	                .body(fileResource);
//		}else {
//	        // Handle the case when the file does not exist
//	        return ResponseEntity.notFound().build();
//		}
//	}
	
	@GetMapping("/requests/{name}")
    private static void dFileDownload(
		@PathVariable("name") String name,
		String downloads) {
        URL fileurl = null;
        try {
            fileurl = new URL(UPLOAD_FOLDER + name);
            System.out.println(fileurl);
            FileUtils.copyURLToFile(fileurl, new File(downloads));
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        System.out.println("File Downloaded Successfully with apache commons-io Operation \n");
        
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
	
	//Post Method to create comment on audit request
	@PostMapping("/{auditRequestId}/createComment")
	public String pNewComment(
			@PathVariable("auditRequestId") Long auditRequestId,
			@Valid @ModelAttribute("comment") Comment comment,
			BindingResult result,
			Model model,
			HttpSession session
			) {
		Long userId = (Long) session.getAttribute("userId");
		comment.setCommentUser(userService.getOne(userId));
		AuditRequest auditRequest = auditRequestService.getOne(auditRequestId);
		comment.setRequestComment(auditRequest);
		commentService.createOrUpdate(comment, result);

		return "redirect:/requests/{auditRequestId}";
	}
	
	@PostMapping("/{auditRequestId}/uploadFile")
	public String uploadFile(
			@PathVariable("auditRequestId") Long auditRequestId,
			@RequestParam("file")MultipartFile file,
			Model model,
			HttpSession session
			) throws IOException{
		Long userId = (Long) session.getAttribute("userId");
		User user = userService.getOne(userId);
		model.addAttribute(user);
		
		try {
			byte[] bytes = file.getBytes();
			Path path = Paths.get(UPLOAD_FOLDER, file.getOriginalFilename());
			Files.write(path, bytes);
			fileDataService.uploadAuditFile(file, userId, auditRequestId);
		}
		catch(IOException e){
			e.printStackTrace();
		}
		return "redirect:/requests/{auditRequestId}";
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
		User auditRequestUser = auditRequest.getRequestUser();
		if(!auditRequestUser.getId().equals(userId)) {
			return "redirect:/requests/{id}";
		}
		auditRequestService.deleteById(auditRequestId);
		return "redirect:/requests";
	}
	
}
