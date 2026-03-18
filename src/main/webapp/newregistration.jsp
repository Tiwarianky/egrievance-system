<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #6a11cb, #2575fc);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background: #fff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.2);
            width: 400px;
            text-align: center;
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
        }

        label {
            display: block;
            text-align: left;
            margin: 10px 0 5px;
            font-weight: bold;
            color: #444;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        button {
            width: 100%;
            padding: 12px;
            background: #2575fc;
            border: none;
            border-radius: 6px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s;
        }

        button:hover {
            background: #1b5edb;
        }

        .message {
            margin-top: 15px;
            font-weight: bold;
        }

        .success {
            color: green;
        }

        .error {
            color: red;
        }

        .link {
            margin-top: 15px;
            display: block;
        }

        .link a {
            color: #2575fc;
            text-decoration: none;
            font-weight: bold;
        }

        .link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Register New User</h2>

    <form action="/registerUser" method="post">
     <label>Fullname</label>
        <input type="text" name="full_name" placeholder="Enter fullname" required>
     <label>State</label>
        <input type="text" name="state" placeholder="Enter state" required>
     <label>District</label>
        <input type="text" name="district" placeholder="Enter district" required>
     <label>email</label>
        <input type="email" name="email" placeholder="Enter username" required>
    
        <label>Username</label>
        <input type="text" name="username" placeholder="Enter username" required>

        <label>Password</label>
        <input type="password" name="password" placeholder="Enter password" required>

        <label>Role</label>
        <select name="role" required>
            <option value="citizen">Citizen</option>
            <option value="officer">Officer</option>
           <option value="admin">Admin</option>
            
        </select>

        <button type="submit">Register</button>
    </form>

    <div class="link">
        <a href="/loginSection">← Back to Login</a>
    </div>

    <% if (request.getAttribute("message") != null) { %>
        <p class="message success"><%= request.getAttribute("message") %></p>
    <% } %>

    <% if (request.getAttribute("error") != null) { %>
        <p class="message error"><%= request.getAttribute("error") %></p>
    <% } %>
</div>
</body>
</html>