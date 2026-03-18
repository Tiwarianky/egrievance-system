<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Take Action - eGrievance</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container mt-5">
    <div class="card shadow">
        <div class="card-header bg-primary text-white">
            <h4>Take Action on Complaint</h4>
        </div>

        <div class="card-body">

            <!-- Complaint Details -->
            <h5 class="mb-3">Complaint Details</h5>

           <p><strong>Current Status:</strong> ${complaint.status}</p>

            <hr>

            <!-- Action Form -->
            <form action="submitAction" method="post">

                <input type="hidden" name="complaintId" value="${complaint.id}"/>

                <div class="mb-3">
                    <label class="form-label">Select Action</label>
                    <select name="actionStatus" class="form-select" required>
                        <option value="">-- Select --</option>
                        <option>In Progress</option>
                        <option>Resolved</option>
                        <option>Rejected</option>
                        <option>Forwarded</option>
                        <option>Closed</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label">Action Description</label>
                    <textarea name="actionMessage" class="form-control" rows="3" required></textarea>
                </div>

                <button class="btn btn-success">Submit Action</button>
            </form>

        </div>
    </div>
</div>

</body>
</html>
