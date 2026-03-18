<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Delete Complaint</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap 5 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

  <div class="container mt-5">
    <div class="row justify-content-center">
      <div class="col-md-6">

        <div class="card shadow-lg rounded">
          <div class="card-header bg-danger text-white text-center">
            <h4>Delete Complaint</h4>
          </div>
            <form action="/removeComp" method="POST">

          <div class="card-body">

            <!-- Success Message -->
            <c:if test="${not empty success}">
              <div class="alert alert-success">${success}</div>
            </c:if>

            <!-- Error Message -->
            <c:if test="${not empty error}">
              <div class="alert alert-danger">${error}</div>
            </c:if>

            <form action="/admin/deleteComplaint" method="POST">

              <!-- Complaint ID -->
              <div class="mb-3">
                <label class="form-label">Complaint ID</label>
                <input type="number" class="form-control" name="id" placeholder="Enter Complaint ID" required>
              </div>

              <!-- Citizen Name -->
              <div class="mb-3">
                <label class="form-label">Citizen Name</label>
                <input type="text" class="form-control" name="citizenName" placeholder="Enter Citizen Name" required>
              </div>

              <!-- Department -->
              <div class="mb-3">
                <label class="form-label">Department</label>
                <select class="form-select" name="department" required>
                  <option value="">Select Department</option>
                  <option value="Water Supply">Water Supply</option>
                  <option value="Electricity">Electricity</option>
                  <option value="Waste Management">Waste Management</option>
                  <option value="Health">Health</option>
                  <option value="Road Maintenance">Road Maintenance</option>
                </select>
              </div>

              <!-- Delete Button -->
              <button type="submit" class="btn btn-danger w-100">Delete Complaint</button>
            </form>

          </div>

          <div class="card-footer text-muted text-center">
            Please verify the details before deleting a complaint.
          </div>

          <a href="/admindash.jsp" class="btn mt-2">
            <b style="color:green">Back to Panel</b>
          </a>

        </div>
        </form>
      </div>
    </div>
  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
