package com.krunge.auditmanager.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.krunge.auditmanager.models.FileData;

public interface FileDataRepository extends CrudRepository<FileData, Long>{
	List <FileData> findAll();
	List <FileData> findAllByFileUser(Long userId);
	List <FileData> findAllByRequestFileId(Long auditRequestId);

}
