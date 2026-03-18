 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Complaints</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body { background-color: #f4f6f8; }
        .container { margin-top: 40px; }
        .btn-all { margin-top: 20px; }
        
    </style>
</head>
<body>

<div class="container">

    <!-- ✳️ PART–1 : LATEST COMPLAINTS (SESSION) -->
    <h2 class="mb-3 text-center">Latest Complaints (User Submitted)</h2>
    <p class="text-end time-date" id="datetime"></p>

    <c:if test="${not empty complaints}">
        <table class="table table-bordered table-striped">
            <thead class="table-dark">
                <tr>
                    <th>#</th>
                    <th>Citizen Name</th>
                    <th>Complaint</th>
                    <th>Department</th>
                    <th>Address</th>
                    <th>File</th>
                    <th>Action</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="complaint" items="${complaints}" varStatus="status">
                    <tr>
                        <td>${status.index + 1}</td>
                        <td>${complaint.citizenName}</td>
                        <td>${complaint.description}</td>
                        <td>${complaint.department}</td>
                        <td>${complaint.address}</td>

                        <!-- FILE OPEN -->
                        <td>
                            <c:if test="${not empty complaint.fileName}">
                                <a class="btn btn-primary btn-sm"
                                   href="/uploads/${complaint.fileName}" 
                                   target="_blank">View</a>
                            </c:if>
                        </td>

                        <!-- DELETE BUTTON -->
                        <td>
                            <form action="${pageContext.request.contextPath}/delete" 
                                  method="post" style="display:inline;">
                                <input type="hidden" name="index" value="${status.index}" />
                                <button type="submit" 
                                    class="btn btn-danger btn-sm"
                                    onclick="return confirm('Delete this complaint?')">
                                    Delete
                                </button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>

    <c:if test="${empty complaints}">
        <div class="alert alert-warning text-center">
            No recent complaints found.
        </div>
    </c:if>

    <!-- BUTTON TO SHOW ALL COMPLAINTS -->
    <div class="text-center btn-all">
        <a href="/compliantInfo" class="btn btn-outline-success btn-lg">View All Complaints</a>
    </div>
<div class="text-center"> <a href="/officerdash.jsp"  class="btn btn-outline-success mt-3">Back to Panel</a> </div>
</div>
<script>
    function updateDateTime() {
      const now = new Date();
      const formatted = now.toLocaleString();
      document.getElementById('datetime').textContent = 'Date & Time: ' + formatted;
    }

    updateDateTime();
    setInterval(updateDateTime, 1000);
  </script>
</body>
</html>
