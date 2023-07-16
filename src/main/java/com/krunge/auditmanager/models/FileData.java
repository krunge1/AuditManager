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

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "files")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class FileData {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(updatable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createdAt;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date updatedAt;

    @PrePersist
    protected void onCreate() {
        this.createdAt = new Date();
    }

    @PreUpdate
    protected void onUpdate() {
        this.updatedAt = new Date();
    }

    private String filePath;
    private String name;
    private String filetype;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User fileUser;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "auditRequest_id")
    private AuditRequest requestFile;

    public FileData(Long id, Date createdAt, Date updatedAt, String filePath, String name, String filetype, User fileUser, AuditRequest requestFile) {
        this.id = id;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.filePath = filePath;
        this.name = name;
        this.filetype = filetype;
        this.fileUser = fileUser;
        this.requestFile = requestFile;
    }

}
