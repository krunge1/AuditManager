package com.krunge.auditmanager.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.krunge.auditmanager.models.Comment;

public interface CommentRepository extends CrudRepository <Comment, Long>{
	List <Comment> findAll();
	List <Comment> findAllByAuditRequest(Long auditRequestId);
	List <Comment> findAllByUser(Long userId);
}
