package com.krunge.auditmanager.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;

import javax.validation.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="comment")
public class Comment {
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
	}
	
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
    
  //Unique Model Items
    @NotEmpty(message="Ope your comment is blank.")
    private String text;
    
  //Constructor
    public Comment() {}
    
  //Many to One
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="user_id")
    private User user;
    
  //Many to One
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="auditRequest_id")
    private AuditRequest auditRequest;

  //Getters and Setters
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public AuditRequest getAuditRequest() {
		return auditRequest;
	}

	public void setAuditRequest(AuditRequest auditRequest) {
		this.auditRequest = auditRequest;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}
        
}

