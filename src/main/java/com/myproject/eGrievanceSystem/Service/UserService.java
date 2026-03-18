package com.myproject.eGrievanceSystem.Service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ankit.jpastepsdemo.entities.Account;
import com.myproject.eGrievanceSystem.Repository.FileRepository;
import com.myproject.eGrievanceSystem.Repository.QueryRepository;
import com.myproject.eGrievanceSystem.Repository.UserRepo;
import com.myproject.eGrievanceSystem.entity.Contact;
import com.myproject.eGrievanceSystem.entity.UploadedFile;
import com.myproject.eGrievanceSystem.entity.User;

@Service
public class UserService {
	@Autowired
	public QueryRepository qrepo;
	@Autowired
	public UserRepo userrepo;
	@Autowired
	public FileRepository frepo;
	public String validateUser(String username, String password, String role) {
		
        User user = userrepo.findByUsernameAndPasswordAndRole(username,password,role);
        String status;
        
		{
        if (user !=null) {
        	user.setUsername(user.getUsername()+username);
        	user.setPassword(user.getPassword()+password); 
                user.setRole(user.getRole()+role); 
           if(role!=null){  
        	   switch (role.toLowerCase()) {
                case "admin":
                    return "admindash.jsp";
                    
                case "officer":
                    return "officerdash.jsp";
                case "citizen":
                    return "citizendash.jsp";
                default:
                    throw new RuntimeException("Unknown role");
            }}
        	status="success";
		}
		else
		{
			status="failed";
		}
		return "status.jsp";
	}
	}
	public String adduser(User obj)
	{
		String status;
		try {
			userrepo.save(obj);
			status="adduser.jsp";
		}catch(Exception e)
		{e.printStackTrace();
			status="userfailed.jsp";
		}
		return status;
		
	}
	public List<User>getallUsers(){
		List<User> list=userrepo.findAll();
		return list;
	}
	public List<UploadedFile>getallComplaint(){
		List<UploadedFile> list=frepo.findAll();
		return list;
	}
	
	
	
	//#Admin=====================================================
	
	public String deleteUser(String username, String role)
	{
		String status="";
		User obj=userrepo.findByUsernameAndRole( username,role);

		if(obj!=null)
		{
			System.out.println(obj.getUsername());
			System.out.println(obj.getRole());
			userrepo.delete(obj);
			status="success";
		}
		else
		{
			System.out.println("not found");
			status ="failed";
			
		}
			
		return status;
		
	}
	public List<Contact>getallMessage(){
		List<Contact> list=qrepo.findAll();
		return list;
	}
  
	public String DeleteComp(String citizenName, String department)
	{
		String status="";
		UploadedFile obj=frepo.findByCitizenNameAndDepartment(citizenName, department);

		if(obj!=null)
		{
			System.out.println(obj.getCitizenName());
			System.out.println(obj.getDepartment());
			frepo.delete(obj);
			status="success";
		}else
		{
			System.out.println("not found");
			status ="failed";
			
		}
			
		return status;
		
	}	
	
	
	//#Saved Complaint=====================================
	
	
	public String savedComplaitn(UploadedFile obj)
	{
	String status;
	try {
		frepo.save(obj);
		status="Filelist.jsp";
	}catch(Exception e)
	{e.printStackTrace();
		status="userfailed.jsp";
	}
	return status;
	
}
	public UploadedFile serachstatusONUserName(String citizenName,String department)
	{
	UploadedFile obj=frepo.findByCitizenNameAndDepartment(citizenName, department);
	if(obj==null)
	{
		obj=new UploadedFile();
		obj.setCitizenName(citizenName);
		obj.setDepartment("Not Found");
	}
		return obj;
		
	}
	
	
}


