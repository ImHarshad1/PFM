<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Transaction</title>

<style>
    body {
        margin: 0;
        font-family: 'Segoe UI', system-ui, sans-serif;
        background: #eef2f7;
        min-height: 100vh;
    }

    .page-container {
        max-width: 1200px;
        margin: 40px auto;
        padding: 0;
        background: transparent;
    }

    .page-title {
        text-align: center;
        font-size: 26px;
        font-weight: 700;
        color: #1e293b;
        margin-bottom: 6px;
    }

    .page-subtitle {
        text-align: center;
        color: #64748b;
        margin-bottom: 32px;
        font-size: 14px;
    }

    .transaction-card {
        max-width: 520px;
        margin: 0 auto;
        padding: 42px 38px 46px;
        background: #ffffff;
        border-radius: 20px;
        box-shadow: 0 25px 55px rgba(0,0,0,0.14);
    }

    .form-group {
        margin-bottom: 20px;
    }

    .field-label {
        display: flex;
        align-items: center;
        gap: 8px;
        font-size: 14px;
        font-weight: 600;
        color: #64748b;
        margin-bottom: 6px;
    }

    .field-label i {
        color: #3b82f6;
        font-size: 13px;
    }

    .form-group input,
    .form-group select {
        width: 100%;
        height: 46px;
        padding: 0 14px;
        border-radius: 10px;
        border: 1px solid #e2e8f0;
        font-size: 14px;
        color: #334155;
        background-color: #ffffff;
        box-sizing: border-box;
    }

    .form-group select {
        appearance: none;
        background-image:
            url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='%2394a3b8' viewBox='0 0 16 16'%3E%3Cpath d='M1.5 5.5l6 6 6-6'/%3E%3C/svg%3E");
        background-repeat: no-repeat;
        background-position: right 14px center;
        background-size: 14px;
        padding-right: 42px;
    }

    .form-group input:focus,
    .form-group select:focus {
        border-color: #2563eb;
        box-shadow: 0 0 0 2px rgba(37,99,235,0.15);
        outline: none;
    }

    .save-btn {
        width: 100%;
        height: 46px;
        border-radius: 10px;
        border: none;
        background: linear-gradient(135deg, #0d6efd, #003d99);
        color: #fff;
        font-size: 15px;
        font-weight: 600;
        cursor: pointer;
        margin-top: 8px;
    }
</style>
</head>

<body>

<jsp:include page="navbar.jsp" />

<%
java.util.List<com.pfm.entity.Category> ctgs =
    (java.util.List<com.pfm.entity.Category>) request.getAttribute("categories");
%>

<div class="page-container">

    <div class="transaction-card">
        <div class="page-title">Add Transaction</div>
        <div class="page-subtitle">Add a new transaction to track your spending</div>
		<p style="color : green">${msg}</p>
        <form action="addtransaction" method="post">

            <div class="form-group">
                <div class="field-label">
                    <i class="fa-solid fa-indian-rupee-sign"></i>
                    <span>Amount</span>
                </div>
                <input type="number" name="amount" placeholder="Enter amount" required>
            </div>

            <div class="form-group">
                <div class="field-label">
                    <i class="fa-solid fa-file-lines"></i>
                    <span>Description</span>
                </div>
                <input type="text" name="description" placeholder="Enter Description" >
            </div>

            <div class="form-group">
                <div class="field-label">
                    <i class="fa-solid fa-calendar-days"></i>
                    <span>Date</span>
                </div>
                <input type="date" name="date" required>
            </div>

            <div class="form-group">
                <div class="field-label">
                    <i class="fa-solid fa-tags"></i>
                    <span>Category</span>
                </div>
                <select name="catId" required>
                    <option value="">Select Category</option>
                    <%
                    if (ctgs != null && !ctgs.isEmpty()) {
                        for (com.pfm.entity.Category c : ctgs) {
                    %>
                        <option value="<%=c.getId()%>"><%=c.getName()%></option>
                    <%
                        }
                    } else {
                    %>
                        <option disabled>No Categories Found</option>
                    <%
                    }
                    %>
                </select>
            </div>

            <button class="save-btn">Save Transaction</button>
        </form>
    </div>

</div>

</body>
</html>
