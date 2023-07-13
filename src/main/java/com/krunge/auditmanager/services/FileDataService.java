package com.krunge.auditmanager.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.krunge.auditmanager.models.FileData;
import com.krunge.auditmanager.repositories.FileDataRepository;

@Service
public class FileDataService {
	@Autowired
	private FileDataRepository fileDataRepo;
	
	public String uploadAuditFile(MultipartFile file) {
		FileData newFile = FileData.builder()
				.name(file.getOriginalFilename())
				.filetype(file.getContentType())
				.filePath(file.getOriginalFilename());
				.build();
		this.fileDataRepo.save(newFile);
		if(newFile != null) {
			System.out.println(file.getOriginalFilename());
			return "Upload Successfull"+ file.getOriginalFilename();
		}
		return null;
	}
}
