<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Officer Dashboard - eGrievance</title>

  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

  <style>

    body {
      background: #dce6f5;  /* slightly darkened professional sky */
      font-family: 'Segoe UI', sans-serif;
    }

    /* ------------------ HEADER ------------------ */
    .welcome-header {
      background: #1565c0; /* dark sky blue */
      color: #fff;
      padding: 16px 22px;
      border-radius: 8px;
      box-shadow: 0 3px 12px rgba(0,0,0,0.15);
      margin-bottom: 35px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .welcome-text {
      font-size: 1.2rem;
      font-weight: 500;
    }
.heading{ text-align: center;
  font-size: 1.9rem;
  font-weight: 700;
  color: #1565c0;   /* dark sky blue */
  margin-top: 10px;
  margin-bottom: 35px;
  letter-spacing: 0.5px;
}
    .username {
      color: #ffeb3b;
      font-weight: 600;
    }

    .logout-btn {
      background: #d32f2f;
      border: none;
      padding: 7px 18px;
      color: #fff;
      border-radius: 5px;
      font-weight: 500;
    }

    .logout-btn:hover {
      background: #b71c1c;
    }

    /* ------------------ CARD DESIGN ------------------ */
    .dash-card {
      background: #fff;
      border-radius: 12px;
      padding: 28px;
      border: 1px solid #cbd9ee;
      box-shadow: 0 5px 14px rgba(0,0,0,0.07);
      transition: .2s ease;
      text-align: center;
    }

    .dash-card:hover {
      transform: translateY(-3px);
      box-shadow: 0 8px 22px rgba(0,0,0,0.15);
    }

    .dash-card h5 {
      font-weight: 600;
      color: #1565c0;
    }

    .dash-card p {
      color: #5c6b7e;
      margin-bottom: 15px;
    }

    /* BUTTONS */
    .btn-sky {
      background: #1976d2;
      border: none;
      color: #fff;
      padding: 8px 14px;
      border-radius: 6px;
      font-weight: 500;
    }

    .btn-sky:hover {
      background: #0d47a1;
    }

    .btn-action {
      background: #2e7d32;
      border: none;
      color: #fff;
      padding: 8px 14px;
      border-radius: 6px;
      font-weight: 500;
    }

    .btn-action:hover {
      background: #1b5e20;
    }

    /* Back button */
    .back-btn .btn-outline-secondary {
      border-color: #1976d2 !important;
      color: #1976d2 !important;
    }

    .back-btn .btn-outline-secondary:hover {
      background: #1976d2 !important;
      color: #fff !important;
    }

  </style>
</head>

<body>

<div class="container py-4">

  <!-- HEADER -->
  <div class="welcome-header">
    <div class="welcome-text">
      Welcome: <span class="username">${Username}</span>
    </div>

    <a href="/loginSection" class="logout-btn">Logout</a>
  </div>
<div  class="heading">
  <h3 class="flex"style="color:#0056b3; font-weight:630;">Officer Dashboard</h3>
</div>
  <!-- CARDS -->
  <div class="row g-4">

    <!-- View Complaints -->
    <div class="col-md-6">
      <div class="dash-card">
        <h5><i class="bi bi-clipboard-data me-2"></i>View Complaints</h5>
        <p>See all complaints assigned to you for resolution.</p>
        <a href="/viewComplaints" class="btn btn-sky">View Complaints</a>
      </div>
    </div>

    <!-- Take Action -->
    <div class="col-md-6">
      <div class="dash-card">
        <h5><i class="bi bi-check2-square me-2"></i>Take Action</h5>
        <p>Update the status or resolve the assigned complaints.</p>
        <a href="/takeAction" class="btn btn-action">Take Action</a>
      </div>
    </div>

  </div>

  <!-- Back -->
  <div class="back-btn mt-4">
    <a href="/login.jsp" class="btn btn-outline-secondary">Back to Panel</a>
  </div>

</div>

</body>
</html>
