<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Status</title>

<!-- Bootstrap CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
        background: #f5f6fa;
        font-family: 'Segoe UI', sans-serif;
    }

    .container-box {
        max-width: 600px;
        margin: 80px auto;
        background: #ffffff;
        padding: 40px 45px;
        border-radius: 8px;
        border: 1px solid #e0e0e0;
        box-shadow: 0 4px 12px rgba(0,0,0,0.07);
    }

    h1 {
        font-size: 26px;
        font-weight: 600;
        color: #1d3557;
        margin-bottom: 10px;
        text-align: center;
    }

    .status-label {
        font-size: 18px;
        color: #333;
        margin-top: 20px;
        font-weight: 500;
        text-align: center;
    }

    .status-value {
        font-size: 20px;
        font-weight: 600;
        color: #0056b3;
    }

    .back-btn {
        margin-top: 35px;
        display: flex;
        width: 170px;
        text-align: center;
        padding: 10px 0;
        background: #1d3557;
        color: #faff;
        border-radius: 6px;
        text-decoration: none;
        font-weight: 500;
    }

    .back-btn:hover {
        background: #16324f;
        color: #fff;
    }
</style>

</head>
<body>

<div class="container-box">

    <h1>${msg}</h1>
    <hr>

    <p class="status-label">
        Status: <span class="status-value">${status}</span>
    </p>
<div>
    <a href="/" class="back-btn">← Back to Home</a>

</div>

</body>
</html>
