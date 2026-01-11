<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>

<style>
    body {
        margin: 0;
        font-family: 'Segoe UI', system-ui, sans-serif;
        background: #eef2f7;
        min-height: 100vh;
    }

    .dashboard-container {
        max-width: 1200px;
        margin: 30px auto;
        padding: 50px;
        background: rgba(255, 255, 255, 0.9);
        border-radius: 18px;
        box-shadow:
            0 20px 40px rgba(0, 0, 0, 0.12),
            inset 0 1px 0 rgba(255,255,255,0.5);
        text-align: center;
        animation: fadeIn 0.6s ease;
    }

    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: translateY(15px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .dashboard-container h1 {
        margin: 0;
        font-size: 34px;
        color: #1e293b;
        font-weight: 700;
    }

    .dashboard-container span {
        color: #0d6efd;
    }

    .dashboard-container p {
        margin-top: 10px;
        font-size: 16px;
        color: #64748b;
    }
</style>

</head>
<body>

<jsp:include page="navbar.jsp" />

<div class="dashboard-container">
    <h1>Welcome, <span>${sessionScope.userName}</span></h1>
    <p>Your financial health snapshot</p>
</div>

</body>
</html>
