<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Admin Dashboard</title>

  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

<style>
    body {
      background: #dce6f5; /* medium-light professional sky grey/blue */
      font-family: 'Segoe UI', sans-serif;
    }

    /* -------------------- Top Navbar -------------------- */
    .top-bar {
      background: #1565c0; /* DARK SKY BLUE */
      padding: 18px 25px;
      color: #fff;
      border-radius: 8px;
      margin-bottom: 35px;
      box-shadow: 0 3px 12px rgba(0,0,0,0.15);
    }

    .top-bar h2 {
      margin: 0;
      font-weight: 600;
    }

    .logout-btn {
      background: #d32f2f;
      border: none;
      color: #fff;
      padding: 7px 18px;
      border-radius: 5px;
    }

    .logout-btn:hover {
      background: #b71c1c;
    }

    /* -------------------- Stat Cards -------------------- */
    .stat-card {
      background: #ffffff;
      border-radius: 12px;
      padding: 30px 25px;
      border: 1px solid #cbd9ee; /* darker sky highlight */
      box-shadow: 0 5px 14px rgba(0,0,0,0.07);
      transition: 0.2s ease;
      height: 100%;
    }

    .stat-card:hover {
      transform: translateY(-3px);
      box-shadow: 0 8px 20px rgba(0,0,0,0.15);
    }

    .stat-icon {
      font-size: 2.5rem;
      color: #1976d2; /* SKY BLUE DARK */
      margin-bottom: 10px;
    }

    .stat-number {
      font-size: 2rem;
      font-weight: 700;
      color: #1976d2; /* Same sky blue family */
      margin: 5px 0;
    }

    .stat-label {
      color: #5c6b7e;
      font-size: 1rem;
      margin-bottom: 15px;
    }

    .stat-btn {
      background: #1976d2; /* Blue Button */
      color: #fff;
      border-radius: 6px;
      padding: 8px 12px;
      width: 100%;
      border: none;
      font-weight: 500;
      transition: .2s ease-in-out;
    }

    .stat-btn:hover {
      background: #0d47a1; /* darker shade */
    }

    .back-btn {
      margin-top: 30px;
    }

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

<div class="container my-4">

  <!-- HEADER -->
  <div class="d-flex justify-content-between align-items-center top-bar">
    <h2>Admin Dashboard</h2>
    <a href="/" class="logout-btn">Logout</a>
  </div>

  <!-- DASHBOARD CARDS -->
  <div class="row g-4">

    <!-- Total Users -->
    <div class="col-md-3">
      <div class="stat-card">
        <div class="stat-icon"><i class="bi bi-people-fill"></i></div>
        <div class="stat-number">${totalUsers}</div>
        <div class="stat-label">Total Users</div>
        <a href="/Userinfo" class="stat-btn">View Details</a>
      </div>
    </div>

    <!-- Total Complaints -->
    <div class="col-md-3">
      <div class="stat-card">
        <div class="stat-icon"><i class="bi bi-clipboard-data"></i></div>
        <div class="stat-number">${totalComplaints}</div>
        <div class="stat-label">Total Complaints</div>
        <a href="/compliantInfo" class="stat-btn">View Details</a>
      </div>
    </div>

    <!-- Deleted Users -->
    <div class="col-md-3">
      <div class="stat-card">
        <div class="stat-icon"><i class="bi bi-person-x-fill"></i></div>
        <div class="stat-number">${DeleteUser}</div>
        <div class="stat-label">Deleted Users</div>
        <a href="/delusers" class="stat-btn">View Details</a>
      </div>
    </div>

    <!-- Pending Complaints -->
    <div class="col-md-3">
      <div class="stat-card">
        <div class="stat-icon"><i class="bi bi-hourglass-split"></i></div>
        <div class="stat-number">${pendingComplaints}</div>
        <div class="stat-label">Pending Complaints</div>
        <a href="/" class="stat-btn">View Details</a>
        
      </div>
    </div>

    <!-- Resolved Complaints -->
    <div class="col-md-3">
      <div class="stat-card">
        <div class="stat-icon"><i class="bi bi-check-circle-fill"></i></div>
        <div class="stat-number">${resolvedComplaints}</div>
        <div class="stat-label">Resolved Complaints</div>
        <a href="/" class="stat-btn">View Details</a>
        
      </div>
    </div>
    
     <!-- Deleted Complaints -->
    <div class="col-md-3">
      <div class="stat-card">
        <div class="stat-icon"><i class="bi bi-check-circle-fill"></i></div>
        <div class="stat-number">${DeleteComplaints}</div>
        <div class="stat-label">Delete Complaints</div>
        <a href="/delcomplaints" class="stat-btn">View Details</a>
        
      </div>
    </div>
    <div class="col-md-3">
      <div class="stat-card">
        <div class="stat-icon"><i class="bi bi-clipboard-data"></i></div>
        <div class="stat-number">${WebQuery}</div>
        <div class="stat-label">Web Query</div>
        <a href="/webmsg" class="stat-btn">View Details</a>
      </div>
    </div>

  </div>

  <!-- BACK BUTTON -->
  <div class="back-btn">
    <a href="/loginSection" class="btn btn-outline-secondary">Back to Panel</a>
  </div>

</div>

</body>
</html>
