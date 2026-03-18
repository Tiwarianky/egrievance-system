<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Complaint Status</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: #f4f6f8;
            font-family: "Segoe UI", Arial, sans-serif;
            padding-top: 50px;
        }

        .status-card {
            max-width: 600px;
            margin: auto;
            background: #ffffff;
            border-radius: 10px;
            padding: 30px 35px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
        }

        h1 {
            text-align: center;
            font-size: 26px;
            color: #1a1a1a;
            font-weight: 600;
            margin-bottom: 25px;
        }

        .label-cell {
            width: 30%;
            font-weight: 600;
            font-size: 16px;
            color: #333;
            padding: 12px;
        }

        .value-cell {
            padding: 120px;
        }

        /* Corporate status box */
        .status-box {
            padding: 14px;
            background: #e7f1ff;
            color: #0d6efd;
            border-left: 6px solid #0d6efd;
            border-radius: 6px;
            font-size: 17px;
            font-weight: 600;
        }

        table {
            width: 100%;
        }

        hr {
            margin-bottom: 25px;
        }
    </style>
</head>

<body>

<div class="status-card">
    <h1>Status of Your Complaint</h1>

    <table class="table table-borderless align-middle">
        <tbody>
            <tr>
                <td class="value-cell">
                    <div class="status-box">
                        ${data.status}
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
</div>

</body>
</html>
