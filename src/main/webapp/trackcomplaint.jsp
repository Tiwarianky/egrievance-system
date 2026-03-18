<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Track Complaint Status</title>

    <style>
        body {
            margin: 0;
            font-family: "Segoe UI", Arial, sans-serif;
            background: #f4f6f8;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .box {
            background: #ffffff;
            padding: 35px;
            border-radius: 10px;
            width: 380px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
        }

        h2 {
            color: #1a1a1a;
            text-align: center;
            font-weight: 600;
            margin-bottom: 25px;
        }

        label {
            font-size: 14px;
            color: #333;
            font-weight: 500;
        }

        input, select {
            width: 100%;
            padding: 12px;
            margin-top: 6px;
            margin-bottom: 18px;
            font-size: 15px;
            border: 1px solid #cbd2d9;
            border-radius: 6px;
            background: #fafafa;
            transition: 0.25s ease;
        }

        input:focus, select:focus {
            outline: none;
            border-color: #0d6efd;
            background: #ffffff;
        }

        button {
            width: 100%;
            padding: 12px;
            margin-top: 10px;
            background: #0d6efd;
            color: #ffffff;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            font-weight: 500;
            transition: 0.25s;
        }

        button:hover {
            background: #0b5ed7;
        }
    </style>
</head>

<body>

<div class="box">
    <h2>Track Complaint</h2>

    <!-- Corporate Form -->
    <form action="showStatus" method="POST">
        
        <label>Name:</label>
        <input type="text" name="citizenName" placeholder="Enter your name" required>

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

        <button type="submit">Check Status</button>
    </form>
</div>

</body>
</html>
