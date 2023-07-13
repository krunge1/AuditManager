package com.krunge.auditmanager.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.krunge.auditmanager.services.FileDataService;

@Controller
public class FileUploadController {
	@Autowired
	private FileDataService fileDataService;
	
	private String UPLOAD_FOLDER = "/WEB-INF/AuditItems/";
	
	@PostMapping("/upload")
	public String uploadFile(@RequestParam("")) {
		
	}
}
