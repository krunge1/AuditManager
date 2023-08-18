package com.krunge.auditmanager.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.krunge.auditmanager.models.Comment;
import com.krunge.auditmanager.repositories.CommentRepository;

@Service
public class CommentService {
	@Autowired
	private CommentRepository commentRepo;

	//Get all Comments
		public List <Comment> getAll(){
			return commentRepo.findAll();
		}
	//Get one Audit Request by ID
		public Comment getOne(Long id) {
			return commentRepo.findById(id).orElse(null);
		}
	//Create or Update Comment
		public Comment createOrUpdate (Comment comment, BindingResult result) {
			if(result.hasErrors()) {
				return null;
			}else {
				return commentRepo.save(comment);
				}
			}
	//Get Comment by Audit Request Id
		public List <Comment> getByAuditRequestId (Long auditRequestId){
			return commentRepo.findAllByRequestCommentId(auditRequestId);
		}
	//Delete Comment
		public void deleteById(Long id) {
			commentRepo.deleteById(id);
		}

}
