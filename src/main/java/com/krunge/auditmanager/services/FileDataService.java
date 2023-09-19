package com.krunge.auditmanager.services;

import java.util.List;

import javax.activation.MimetypesFileTypeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.krunge.auditmanager.models.AuditRequest;
import com.krunge.auditmanager.models.FileData;
import com.krunge.auditmanager.models.User;
import com.krunge.auditmanager.repositories.AuditRequestRepository;
import com.krunge.auditmanager.repositories.FileDataRepository;
import com.krunge.auditmanager.repositories.UserRepository;

@Service
public class FileDataService {
	@Autowired
	private FileDataRepository fileDataRepo;

	@Autowired
	private UserRepository userRepo;

	@Autowired
	private AuditRequestRepository auditRequestRepo;

	public String uploadAuditFile(MultipartFile file, Long userId, Long auditRequestId) {
		//Retrieve User and Audit Request
		User user = userRepo.findById(userId).orElseThrow(() -> new IllegalArgumentException("User not found"));
		AuditRequest auditRequest = auditRequestRepo.findById(auditRequestId).orElseThrow(() -> new IllegalArgumentException("Audit Request not found"));

		FileData newFile = new FileData();
				newFile.setName(file.getOriginalFilename());
				newFile.setFilePath(file.getOriginalFilename());
				newFile.setRequestFile(auditRequest);
				newFile.setFileUser(user);
				this.fileDataRepo.save(newFile);
	
				if(newFile != null) {
					System.out.println(file.getOriginalFilename());
					return "Upload Successful"+ file.getOriginalFilename();
				}
				return null;
			}
	
	
//	public String uploadAuditFil(MultipartFile file, Long userId, Long auditRequestId) {
//		//Retrieve User and Audit Request
//		User user = userRepo.findById(userId).orElseThrow(() -> new IllegalArgumentException("User not found"));
//		AuditRequest auditRequest = auditRequestRepo.findById(auditRequestId).orElseThrow(() -> new IllegalArgumentException("Audit Request not found"));
//
//		FileData newFile = FileData.builder()
//				.name(file.getOriginalFilename())
//				.filetype(file.getContentType())
//				.filePath(file.getOriginalFilename())
//				.build();
//		newFile.setRequestFile(auditRequest);
//		newFile.setFileUser(user);
//		this.fileDataRepo.save(newFile);
//		if(newFile != null) {
//			System.out.println(file.getOriginalFilename());
//			return "Upload Successful"+ file.getOriginalFilename();
//		}
//		return null;
//	}

	//Get all Files
		public List <FileData> getAll(){
			return fileDataRepo.findAll();
		}

	//Get by ID
		public FileData getOne(Long id) {
			return fileDataRepo.findById(id).orElse(null);
		}

	//Get Files by User Id
	public List<FileData> getByUserId(Long userId){
		return fileDataRepo.findAllByFileUser(userId);
	}

	//Get Files by Audit Request
	public List<FileData> getAllByRequestId(Long auditRequestId){
		return fileDataRepo.findAllByRequestFileId(auditRequestId);
	}

	public String determineContentType(String fileName) {
	    MimetypesFileTypeMap fileTypeMap = new MimetypesFileTypeMap();
	    String contentType = fileTypeMap.getContentType(fileName);
	    if (contentType == null || contentType.equals("application/octet-stream")) {
	        contentType = "application/octet-stream";
	    }

	    return contentType;
	    // Determine the content type based on the file's extension
	    // You can use a library or custom logic to map file extensions to content types
	    // For example, you can use javax.activation.MimetypesFileTypeMap
	    // or create a custom mapping based on your application's requirements
	    // Return an appropriate content type or a default if the mapping is not available
	}
}
