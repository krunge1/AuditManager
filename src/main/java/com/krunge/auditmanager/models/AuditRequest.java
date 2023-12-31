package com.krunge.auditmanager.models;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;


@Entity
@Table(name="auditrequest")
public class AuditRequest {
	//Standard Model Items
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;

	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;

	@PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
//Added default Request Status on creation
    	this.status = "Open";
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
//Unique Model Items
    @NotEmpty(message="Audit Request is required!")
    @Size(min=3, message="Audit Request must be at least 3 characters")
    private String request;

    @NotEmpty(message="Details are required!")
    @Size(min=3, message="Details must be at least 5 characters")
    private String details;

    @NotNull(message="Due Date is required")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date dueDate;

    @NotEmpty(message="Account type is required")
    private String accountType;

    private String status;

//  One to Many
  @OneToMany(mappedBy="requestComment", fetch=FetchType.LAZY, cascade=CascadeType.ALL)
  private List<Comment> comments;

  @OneToMany(mappedBy="requestFile", fetch=FetchType.LAZY, cascade=CascadeType.ALL)
  private List<FileData> fileData;

//Many to One
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="user_id")
    private User requestUser;

//Constructor
    public AuditRequest() {}

//Getters and Setters

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getRequest() {
		return request;
	}
	public void setRequest(String request) {
		this.request = request;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public Date getDueDate() {
		return dueDate;
	}
	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}
	public String getAccountType() {
		return accountType;
	}
	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public List<Comment> getComments() {
		return comments;
	}
	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}
	public List<FileData> getFileData() {
		return fileData;
	}
	public void setFileData(List<FileData> fileData) {
		this.fileData = fileData;
	}
	public User getRequestUser() {
		return requestUser;
	}
	public void setRequestUser(User requestUser) {
		this.requestUser = requestUser;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}

}
