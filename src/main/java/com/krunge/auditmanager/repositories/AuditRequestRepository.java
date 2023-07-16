package com.krunge.auditmanager.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.krunge.auditmanager.models.AuditRequest;

public interface AuditRequestRepository extends CrudRepository <AuditRequest, Long>{
	List <AuditRequest> findAll();
	List <AuditRequest> findAllByRequestUserId(Long userId);
	List<AuditRequest> findAllByOrderByStatusDesc();
}
