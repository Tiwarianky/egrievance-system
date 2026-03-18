package com.myproject.eGrievanceSystem.Repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.myproject.eGrievanceSystem.entity.UploadedFile;
import com.myproject.eGrievanceSystem.entity.User;
@Repository
public interface UserRepo extends JpaRepository<User, Integer> {
    User findByUsernameAndPasswordAndRole(String usernsame,String password,String role);

	User findByUsernameAndRole(String username, String role);

	void save(UploadedFile complaint);
	
}