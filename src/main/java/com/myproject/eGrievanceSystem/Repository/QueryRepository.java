package com.myproject.eGrievanceSystem.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.myproject.eGrievanceSystem.entity.Contact;
import com.myproject.eGrievanceSystem.entity.UploadedFile;

@Repository
public interface QueryRepository extends JpaRepository<Contact, Long>{



}
