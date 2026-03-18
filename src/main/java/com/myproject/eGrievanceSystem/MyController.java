package com.myproject.eGrievanceSystem;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.http.MediaType;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.myproject.eGrievanceSystem.Repository.FileRepository;
import com.myproject.eGrievanceSystem.Repository.QueryRepository;
import com.myproject.eGrievanceSystem.Repository.UserRepo;
import com.myproject.eGrievanceSystem.Service.UserService;
import com.myproject.eGrievanceSystem.entity.Contact;
import com.myproject.eGrievanceSystem.entity.UploadedFile;
import com.myproject.eGrievanceSystem.entity.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class MyController {

	 @Autowired
	 private QueryRepository qrepo;
	 
	  @Autowired
	    private UserRepo userrepo;

	    @Autowired
	    private UserService userserv;
	    
	    
	    @Autowired
	    private FileRepository frepo;

	 @GetMapping("/")
	 public String loginpage()
	 {
		 return "index.html";
	 }
	 @GetMapping("/help")
	    public String helpPage() {
	        return "help.html"; // JSP or HTML file
	    }

	 
	 @GetMapping("/loginSection")
	 public String Newppage()
	 {
		
		return "login.jsp";
		 
	 }
	 @GetMapping("/resetpass")	    
	 public String Forgotpass()
	 {
	 	
	 	return "forgotpass.jsp";
	 	 
	 }
	 
	 //#send query================================
	 
     @PostMapping("/query")
	 @ResponseBody
	 public String saveQuery(
	         @RequestParam String name,
	         @RequestParam String email,
	         @RequestParam String message
	 ) {
	     try {
	         Contact msg = new Contact();
	         msg.setName(name);
	         msg.setEmail(email);
	         msg.setMessage(message);

	         qrepo.save(msg);

	         return "success";

	     } catch (Exception e) {
	         return "error";
	     }
	 }

	    

@PostMapping("/login")
public String loginUser(String username, String password, String role,String full_name,String email,String state,String district, Model m, User obj, HttpSession session) {
    String status=userserv.validateUser(username, password, role);

	m.addAttribute("status",status);
	m.addAttribute("msg","Sorry.....");
    System.out.println("username="+username+" pass="+password+" role="+role);

    if (status != null) {
        // Store user info in session
        session.setAttribute("username", obj.getUsername());
        session.setAttribute("password", obj.getPassword());
        session.setAttribute("userRole", obj.getRole());
        m.addAttribute("Username",username);
        return status;

    } else {
    	
       // model.addAttribute("error", "Invalid Email or Password");
        return "login";
    }
}
	    
	    @GetMapping("/registerSection")
		 public String registerpage()
		 {
			
			return "newregistration.jsp";
			 
		 }
	    @PostMapping("/registerUser")
	    public String NewRegister(User obj,Model m)
	    {
	    	String status;
	    	status=userserv.adduser(obj);
	    	m.addAttribute("msg","Now you are register as user...");
			m.addAttribute("status",status);
	    	
		    //System.out.println(obj);

	    	return status;
	    }
	    
	    @GetMapping("/fileComplaint")
		 public String Complaintpage()
		 {
			
			return "ComplaintForm.jsp";
			 
		 }
	    @Value("${file.upload-dir}")
	    private String uploadDir;
	    @PostMapping("/upload")
	    public String uploadComplaint(
	            @RequestParam("file") MultipartFile file,
	            @RequestParam("citizenName") String citizenName,
	            @RequestParam("description") String description,
	            @RequestParam("address") String address,
	            @RequestParam("department") String department,
	            HttpSession session,  
	            Model m) {

	        try {

	            if (file.isEmpty()) {
	                m.addAttribute("msg", "Please select a file to upload!");
	                return "ComplaintForm.jsp";
	            }

	            // Save directory in project
	            String uploadPath = System.getProperty("user.dir")
	                    + File.separator + "uploads" + File.separator;

	            File folder = new File(uploadPath);
	            if (!folder.exists()) folder.mkdirs();

	            // Save file
	            String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
	            File destination = new File(uploadPath + fileName);
	            file.transferTo(destination);

	            // Create complaint object
	            UploadedFile c = new UploadedFile();
	            c.setCitizenName(citizenName);
	            c.setDescription(description);
	            c.setAddress(address);
	            c.setDepartment(department);
	            c.setFileName(fileName);


	            // SAVE IN DATABASE
	            userserv.savedComplaitn(c);

	            // -------------------------
	            // SESSION LIST UPDATE (LATEST FIRST)
	            // -------------------------
	            List<UploadedFile> complaints = (List<UploadedFile>) session.getAttribute("complaints");
	            if (complaints == null) {
	                complaints = new ArrayList<>();
	            }

	            complaints.add(0, c);  // Latest complaint at TOP
	            session.setAttribute("complaints", complaints);
	            // -------------------------

	            m.addAttribute("msg", "Complaint registered successfully!");

	        } catch (Exception e) {
	            e.printStackTrace();
	            m.addAttribute("msg", "Error while uploading complaint.");
	        }
	         return "Upload.jsp";  // FINAL FIX
	    }



	  //Officer=====================

	    @GetMapping("/viewComplaints")
	    public String listUploadedFiles(HttpSession session, Model model) {
	        List<UploadedFile> complaints = (List<UploadedFile>) session.getAttribute("complaints");
	        if (complaints == null) {
	            complaints = new ArrayList<>();
	        }
	        model.addAttribute("complaints", complaints);
	        return "Filelist.jsp";
	    }
	    @GetMapping("/view/{filename:.+}")
	    public ResponseEntity<InputStreamResource> viewFile(@PathVariable String filename) throws IOException {
	        File file = new File("C:/uploads/" + filename);

	        if (!file.exists()) {
	            return ResponseEntity.notFound().build();
	        }

	        // Detect file type dynamically
	        String contentType = Files.probeContentType(file.toPath());
	        if (contentType == null) {
	            contentType = "application/octet-stream";
	        }

	        InputStreamResource resource = new InputStreamResource(new FileInputStream(file));

	        return ResponseEntity.ok()
	                .contentType(MediaType.parseMediaType(contentType))
	                .header("Content-Disposition", "inline; filename=\"" + filename + "\"")
	                .body(resource);
	    }

	    
	    @GetMapping("/takeAction")
	    public String Action() {
			return "Action.jsp";
	    	
	    }
	    
	    
	    //#Delete files======
	    
@PostMapping("/delete")
public String deleteComplaint(@RequestParam("index") int index, HttpSession session) {
    List<UploadedFile> complaints = (List<UploadedFile>) session.getAttribute("complaints");

    if (complaints != null && index >= 0 && index < complaints.size()) {
        // delete file from disk if exists
        UploadedFile toDelete = complaints.get(index);
        try {
            File f = new File(uploadDir + File.separator + toDelete.getFileName());
            if (f.exists()) {
                boolean deleted = f.delete();
                System.out.println("Deleted file " + toDelete.getFileName() + ": " + deleted);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // remove from session list
        complaints.remove(index);
        session.setAttribute("complaints", complaints);
    }

    return "redirect:/viewComplaints";

} 
//#Admin panel

@GetMapping("/Userinfo")
public String report(Model m)
{
	List<User> list=userserv.getallUsers();
	m.addAttribute("acclist",list);
	return "userinfo.jsp";
	
}
@GetMapping("/compliantInfo")
public String ShowComplaint(Model m)
{
	List<UploadedFile> list=userserv.getallComplaint();
	m.addAttribute("acclist",list);
	return "AllComplaint.jsp";
	
}
@GetMapping("/trackcomplaint")
public String track(Model m)
{	
return "trackcomplaint.jsp";
}

@PostMapping("/showStatus")
public String Status(String citizenName,String department,Model m)
{
	UploadedFile obj=userserv.serachstatusONUserName(citizenName, department);
	m.addAttribute("data", obj);
	return "showstatus.jsp";
	
}

@GetMapping("/delcomplaints")
public String delCompl()
{
	return"Delete Complaint.jsp";
}
@PostMapping("/removeComp")
public String Compremove(String citizenName ,String department, Model m )
{ String status= userserv.DeleteComp(citizenName, department);
m.addAttribute("msg","User account deleted...");
m.addAttribute("status",status);
	return "UserRemovestatus.jsp";
	
}

@GetMapping("/delusers")
public String delAcc()
{
	return"DeleteUser.jsp";
}

@PostMapping("/closeacc")
public String closeAcc(String username,String role, Model m)
{
	String status;
	status=userserv.deleteUser(username, role);
	m.addAttribute("msg","User account deleted...");
	m.addAttribute("status",status);
	return"UserRemovestatus.jsp";
}
@GetMapping("/webmsg")
public String contactmsg(Model m)
{
	List<Contact> list=userserv.getallMessage();
	m.addAttribute("acclist",list);
	return "UserMessage.jsp";
	
}

}


	  


	 

