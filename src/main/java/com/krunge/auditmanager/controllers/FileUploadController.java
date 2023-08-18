//package com.krunge.auditmanager.controllers;
//
//import java.io.IOException;
//import java.nio.file.Files;
//import java.nio.file.Path;
//import java.nio.file.Paths;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.multipart.MultipartFile;
//
//import com.krunge.auditmanager.services.FileDataService;
//
//@Controller
//public class FileUploadController {
//	@Autowired
//	private FileDataService fileDataService;
//
//	private String UPLOAD_FOLDER = "/WEB-INF/AuditItems/";
//
//	@PostMapping("requests/${auditRequest.id}/upload")
//	public String uploadFile(@RequestParam("file")MultipartFile file) throws IOException{
//		if(file == null) {
//			throw new RuntimeException("Please upload a file");
//		}
//		fileDataService.uploadAuditFile(file);
//		try {
//			byte[] bytes = file.getBytes();
//			Path path = Paths.get(UPLOAD_FOLDER, file.getOriginalFilename());
//			Files.write(path, bytes);
//		}
//		catch(IOException e){
//			e.printStackTrace();
//		}
//		return "viewAuditRequest.jsp";
//	}
//}
