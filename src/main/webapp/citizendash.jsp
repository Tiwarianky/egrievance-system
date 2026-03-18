<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Citizen Dashboard - eGrievance</title>

  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

  <style>

    body {
      background: #dce6f5;  /* professional sky-grey background */
      font-family: 'Segoe UI', sans-serif;
    }

    /* ------------------ HEADER ------------------ */
    .welcome-container {
      background: #1565c0; /* dark sky blue */
      padding: 16px 22px;
      border-radius: 8px;
      color: #ffffff;
      margin-bottom: 35px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      box-shadow: 0 3px 12px rgba(0,0,0,0.15);
    }

    .welcome-container span {
      font-weight: 600;
      color: #ffeb3b;
    }

    .logout-btn {
      background: #e53935;
      border: none;
      padding: 7px 16px;
      color: #fff;
      border-radius: 5px;
      font-weight: 500;
      text-decoration: none;
    }

    .logout-btn:hover {
      background: #b71c1c;
    }

    /* ------------------ HEADING ------------------ */
    .dashboard-title {
      text-align: center;
      font-size: 1.9rem;
      font-weight: 700;
      color: #1565c0;
      margin-top: 10px;
      margin-bottom: 35px;
      letter-spacing: 0.5px;
    }

    /* ------------------ DASHBOARD CARDS ------------------ */
    .dash-card {
      background: #ffffff;
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

    .btn-green {
      background: #2e7d32;
      border: none;
      color: #fff;
      padding: 8px 14px;
      border-radius: 6px;
      font-weight: 500;
    }

    .btn-green:hover {
      background: #1b5e20;
    }

    /* BACK BUTTON */
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
  <div class="welcome-container">
    <div>Welcome: <span>${Username}</span></div>
    <a href="/" class="logout-btn">Logout</a>
  </div>

  <!-- HEADING -->
  <h3 class="dashboard-title">Citizen Dashboard</h3>

  <!-- DASHBOARD CARDS -->
  <div class="row g-4">

    <!-- File Complaint -->
    <div class="col-md-6">
      <div class="dash-card">
        <h5><i class="bi bi-pencil-square me-2"></i>File a Complaint</h5>
        <p>Submit a new grievance with details and attachments.</p>
        <a href="/fileComplaint" class="btn-sky">File Complaint</a>
      </div>
    </div>

    <!-- Track Complaint -->
    <div class="col-md-6">
      <div class="dash-card">
        <h5><i class="bi bi-search me-2"></i>Track Complaint</h5>
        <p>Check the current status of your submitted complaints.</p>
        <a href="/trackcomplaint" class="btn-green">Track Complaint</a>
      </div>
    </div>

  </div>

  <!-- BACK BUTTON -->
  <div class="back-btn mt-4">
    <a href="/loginSection" class="btn btn-outline-secondary">Back to Panel</a>
  </div>

</div>

</body>
</html>
