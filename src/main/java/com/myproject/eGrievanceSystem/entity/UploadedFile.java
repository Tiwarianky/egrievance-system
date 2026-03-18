package com.myproject.eGrievanceSystem.entity;


import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "user_complaint")

public class UploadedFile {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String citizenName;
    private String description;
    private String address;
    private String department;// ✅ New field added
    private String fileName;     // file saved in folder
    private String status = "Registered";  // default status
    // Default Constructor
    public UploadedFile() {}

    // Parameterized Constructor
    public UploadedFile(String citizenName, String description, String address,String department, String fileName,String status) {
        this.citizenName = citizenName;
        this.description = description;
        this.address = address;
        this.department=department;
        this.fileName = fileName;
        this.status=status;
    }

    // Getters & Setters
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }

    public String getCitizenName() {
        return citizenName;
    }
    public void setCitizenName(String citizenName) {
        this.citizenName = citizenName;
    }

    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }

    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }

    public String getFileName() {
        return fileName;
    }
    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setUserName(String username) {
		// TODO Auto-generated method stub
		
	}
}

