package com.krunge.auditmanager.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.krunge.auditmanager.models.AuditRequest;

public interface AuditRequestRepository extends CrudRepository <AuditRequest, Long>{
	List <AuditRequest> findAll();
	List <AuditRequest> findAllByUser(Long userId);
	Optional <AuditRequest> findByRequest(String request);
}
