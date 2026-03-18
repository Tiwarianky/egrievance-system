<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Remove User</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Bootstrap 5 CDN -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
  <div class="container mt-5">
    <div class="row justify-content-center">
      <div class="col-md-6">
        <div class="card shadow-lg rounded">
          <div class="card-header bg-danger text-white text-center">
            <h4>Delete User Account</h4>
          </div>
          <div class="card-body">
            <form action="/closeacc" method="POST">
              <div class="mb-3">
                <label for="username" class="form-label">UserName</label>
                <input type="text" class="form-control" id="username" name="username" placeholder="Enter your username" autocomplete="off" required>
              </div>
              <div class="mb-3">
            <label for="role" class="form-label">Select Role</label>
            <select id="role" name="role" class="form-select" required>
              <option value="">Choose your role</option>
              <option value="citizen">Citizen</option>
              <option value="officer">Officer</option>
              <option value="admin">Admin</option>
              
            </select>
          </div>
              <button type="submit" class="btn btn-danger w-100">Submit Request</button>
            </form>
          </div>
          <div class="card-footer text-muted text-center">
            Ensure your details are correct before submitting.
          </div>
    <a href="/" class="btn btn"><b style="color:green">Back to Panel</b></a>
          
        
    </div>
  </div>

  <!-- Bootstrap JS (optional) -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>