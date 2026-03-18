<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Citizen Complaint Form</title>

  <style>
    body {
      font-family: 'Segoe UI', Arial, sans-serif;
      background: #f4f6f8;
      margin: 0;
      padding: 0;
    }
    .container {
      background: #fff;
      max-width: 700px;
      margin: 40px auto;
      padding: 25px;
      border-radius: 12px;
      box-shadow: 0 3px 10px rgba(0,0,0,0.1);
    }
    h2 {
      text-align: center;
      color: #1976d2;
      margin-bottom: 20px;
    }
    label {
      display: block;
      font-weight: bold;
      margin-top: 12px;
    }
    input, select, textarea {
      width: 100%;
      padding: 10px;
      margin-top: 6px;
      border: 1px solid #ccc;
      border-radius: 6px;
      box-sizing: border-box;
    }
    button {
      margin-top: 20px;
      padding: 12px 20px;
      background: #1976d2;
      color: white;
      border: none;
      border-radius: 6px;
      cursor: pointer;
      width: 100%;
      font-size: 16px;
    }
    button:hover {
      background: #0d47a1;
    }
  </style>
</head>
<body>
  <div class="container">
    <h2>Citizen Complaint Form</h2>

    <form method="post" action="/upload" enctype="multipart/form-data">
      <label>Name:</label>
      <input type="text" name="citizenName" required placeholder="Enter your name">


      <label>Complaint Description:</label>
      <textarea name="description" required placeholder="Describe your issue"></textarea>

      <label>Address:</label>
      <textarea name="address" required placeholder="Enter your address"></textarea>

      <label>Department (optional):</label>
      <select name="department">
        <option value="">Select Department</option>
        <option value="Water Supply">Water Supply</option>
        <option value="Electricity">Electricity</option>
        <option value="Health">Health</option>
        <option value="Pollution">Pollution</option>
        <option value="Waste Management">Waste Management</option>
        <option value="Road Maintenance">Road Maintenance</option>
      </select>

      <label>Upload Photo/Video:</label>
      <input type="file" name="file" accept="image/*,video/*" >
     
      <button type="submit">Submit Complaint</button>
      
    </form><br>
    <div class="link">
        <a href="/loginSection"><b>←Back</b></a>
    </div>
  </div>
</body>
</html>