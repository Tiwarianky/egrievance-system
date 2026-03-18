<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Login Page</title>

  <!-- Bootstrap 5 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

  <style>
    body {
      background: linear-gradient(135deg, #4facfe, #00f2fe);
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .login-card {
      background: #fff;
      border-radius: 15px;
      box-shadow: 0 8px 20px rgba(0,0,0,0.2);
      padding: 2rem;
      max-width: 420px;
      margin: auto;
      animation: fadeInUp 0.8s ease-in-out;
    }

    @keyframes fadeInUp {
      from { transform: translateY(40px); opacity: 0; }
      to { transform: translateY(0); opacity: 1; }
    }

    .captcha-box {
      background: #f8f9fa;
      padding: 10px;
      border-radius: 8px;
      border: 1px dashed #6c757d;
    }

    #capText {
      font-weight: bold;
      font-size: 1.1rem;
      color: #007bff;
      letter-spacing: 2px;
    }

    .btn-primary {
      background: linear-gradient(135deg, #007bff, #0056b3);
      border: none;
      transition: transform 0.2s;
    }

    .btn-primary:hover {
      transform: scale(1.03);
    }
  </style>
</head>
<body>

  <!-- Login Section -->
  <section id="loginSection" class="py-5">
    <div class="container">
      <div class="login-card">
        <h3 class="text-center mb-3">Login</h3>
        <p class="text-center text-muted mb-4">Access is role-based. Please sign in to continue.</p>

        <div id="loginError" class="alert alert-danger d-none" role="alert">
          Invalid credentials or role. Please try again.
        </div>

        <!-- FORM with POST -->
        <form action="/login" method="POST" onsubmit="return validateCaptcha()" novalidate>
          <div class="mb-3">
            <label for="username" class="form-label">Username</label>
            <input id="username" name="username" class="form-control" placeholder="Enter username" required />
          </div>

          <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input id="password" name="password" type="password" class="form-control" placeholder="Enter password" required />
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

          <div class="mb-3 captcha-box">
            <strong>Captcha:</strong> <span id="capText"></span>
            <div class="input-group mt-2">
              <input id="capInput" type="text" class="form-control" placeholder="Enter captcha" aria-label="Captcha Input">
              <button class="btn btn-outline-secondary" type="button" onclick="makeCaptcha()">Refresh</button>
            </div>
          </div>

          <div class="d-flex justify-content-between align-items-center mb-3">
            <div class="form-check">
              <input class="form-check-input" type="checkbox" id="rememberMe" name="rememberMe">
              <label class="form-check-label" for="rememberMe">Remember me</label>
            </div>
            <a href="/resetpass" class="link-primary text-decoration-none">Forgot Password?</a>
          </div>

          <button type="submit" class="btn btn-primary w-100 py-2 fw-semibold mb-3">Login</button>

          <div class="text-center">
            <span class="text-muted">New User?</span>
            <a href="registerSection" class="link-primary text-decoration-none"> Register Here</a>
          </div>
          
        </form>
        <div class="link">
        <a href="/"><button>Back</button></a>
    </div>
      </div>
    </div>
  </section>

  <!-- Bootstrap & JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    function makeCaptcha() {
      let chars = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789";
      let captcha = "";
      for (let i = 0; i < 5; i++) {
        captcha += chars.charAt(Math.floor(Math.random() * chars.length));
      }
      document.getElementById("capText").innerText = captcha;
    }

    function validateCaptcha() {
      let capInput = document.getElementById("capInput").value.trim();
      let capText = document.getElementById("capText").innerText;

      if (capInput !== capText) {
        document.getElementById("loginError").classList.remove("d-none");
        return false; // stop form submission
      }
      return true; // allow form POST
    }

    window.onload = makeCaptcha;
  </script>
</body>
</html>