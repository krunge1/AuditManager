package com.krunge.auditmanager.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.krunge.auditmanager.models.AuditRequest;
import com.krunge.auditmanager.repositories.AuditRequestRepository;

@Service
public class AuditRequestService {
	@Autowired
	private AuditRequestRepository auditRequestRepo;
	
//Get all Audit Requests
	public List <AuditRequest> getAll(){
		return auditRequestRepo.findAll();
	}
//Get one Audit Request by ID
	public AuditRequest getOne(Long id) {
		return auditRequestRepo.findById(id).orElse(null);
	}
//Create or Update Audit Request
	public AuditRequest createOrUpdate (AuditRequest auditRequest, BindingResult result) {
//		Test if Audit Request exists in DB
//		Optional<AuditRequest>potentialAuditRequest = auditRequestRepo.findByRequest(auditRequest.getRequest());
//		if(potentialAuditRequest.isPresent()) {
//			result.rejectValue("request", "requestMatch", "Audit Request already exists");
//			return null;
//		}
		if(result.hasErrors()) {
			return null;
		}else {
			return auditRequestRepo.save(auditRequest);
		}
	}
//Get Audit Request by User Id
	public List<AuditRequest> getByUserId(Long userId){
		return auditRequestRepo.findAllByUser(userId);
	}
//Delete Audit Request
	public void deleteById(Long id) {
		auditRequestRepo.deleteById(id);
	}
}
