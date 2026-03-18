<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>All Complaints (Database)</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: #eef2f3;
            padding: 20px;
        }
        .container {
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
        }
        h2 {
            color: #0056b3;
        }
        .btn-home {
            margin-top: 25px;
        }
    </style>
</head>

<body>

<div class="container">
    <h2 class="text-center mb-4">All Registered Complaints</h2>

    <c:if test="${not empty acclist}">
        <div class="table-responsive">
            <table class="table table-bordered table-hover text-center align-middle">
                <thead class="table-dark">
                    <tr>
                        <th>#</th>
                        <th>Citizen Name</th>
                        <th>Description</th>
                        <th>Address</th>
                        
                        <th>Department</th>
                        <th>File</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach var="ac" items="${acclist}" varStatus="loop">
                        <tr>
                            <td>${loop.index + 1}</td>
                            <td>${ac.citizenName}</td>
                            <td>${ac.description}</td>
                            <td>${ac.address}</td>
                            
                            <td>${ac.department}</td>
                            

                            <td>
                                <c:if test="${not empty ac.fileName}">
                                    <a href="/uploads/${ac.fileName}" 
                                       class="btn btn-primary btn-sm"
                                       target="_blank">
                                        View File
                                    </a>
                                </c:if>
                                <c:if test="${empty ac.fileName}">
                                    No File
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </c:if>

    <c:if test="${empty acclist}">
        <div class="alert alert-warning text-center">
            No complaints found in database!
        </div>
    </c:if>

    <div class="text-center btn-home">
<div class="text-center"> <a href="/Filelist.jsp"  class="btn btn-outline-success mt-3">Back to Panel</a> </div>
    </div>

</div>

</body>
</html>
