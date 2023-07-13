package com.krunge.auditmanager.repositories;

import org.springframework.data.repository.CrudRepository;

import com.krunge.auditmanager.models.FileData;

public interface FileDataRepository extends CrudRepository<FileData, Long>{
	

}
