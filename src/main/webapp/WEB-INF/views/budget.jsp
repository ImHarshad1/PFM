<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Budget</title>

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

    /* === BUDGET CARD === */
    .budget-card {
        max-width: 520px;             
        margin: 0 auto 40px;          
        padding: 42px 38px 46px;
        background: #ffffff;
        border-radius: 20px;
        box-shadow: 0 25px 55px rgba(0,0,0,0.14);
    }

    .budget-form {
        width: 100%;
    }

    .form-group {
        margin-bottom: 20px;
    }

    .field-label {
        display: flex;
        align-items: center;
        gap: 8px;
        font-size: 13px;
        font-weight: 600;
        color: #64748b;
        margin-bottom: 6px;
    }

    .field-label i {
        color: #3b82f6;
        font-size: 14px;
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

    /* TABLE */
    .table-wrapper {
        max-width: 1200px;
        margin: 0 auto;
        border-radius: 16px;
        overflow: hidden;
        box-shadow: 0 12px 28px rgba(0,0,0,0.08);
        background: #ffffff;
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    thead {
        background: linear-gradient(135deg, #1e3a8a, #2563eb);
    }

    thead th {
        color: white;
        padding: 14px;
        text-align: center;
        font-size: 14px;
    }

    tbody td {
        padding: 14px;
        text-align: center;
        border-bottom: 1px solid #e2e8f0;
        color: #475569;
        font-size: 14px;
    }

    tbody tr:nth-child(even) {
        background: #f8fafc;
    }

    .no-budget {
        color: #64748b;
        font-weight: 500;
        padding: 18px;
    }
</style>
</head>

<body>

<jsp:include page="navbar.jsp" />

<%
java.util.List<com.pfm.entity.Category> ctgs = (java.util.List<com.pfm.entity.Category>) request.getAttribute("categories");
%>

<div class="page-container">

    <div class="budget-card">
        <div class="page-title">Add Monthly Budget</div>
        <div class="page-subtitle">Track and control your spending goals</div>

        <form class="budget-form" action="saveBudget" method="post">

            <div class="form-group">
                <div class="field-label">
                    <i class="fa-solid fa-calendar"></i>
                    <span>Month</span>
                </div>
                <select name="month" required>
                    <option value="">Select Month</option>
                    <option value="1">January</option>
                    <option value="2">February</option>
                    <option value="3">March</option>
                    <option value="4">April</option>
                    <option value="5">May</option>
                    <option value="6">June</option>
                    <option value="7">July</option>
                    <option value="8">August</option>
                    <option value="9">September</option>
                    <option value="10">October</option>
                    <option value="11">November</option>
                    <option value="12">December</option>
                </select>
            </div>

            <div class="form-group">
                <div class="field-label">
                    <i class="fa-solid fa-clock"></i>
                    <span>Year</span>
                </div>
                <select name="year" required>
                    <option value="">Select Year</option>
                    <option>2024</option>
                    <option>2025</option>
                    <option>2026</option>
                </select>
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

            <div class="form-group">
                <div class="field-label">
                    <i class="fa-solid fa-indian-rupee-sign"></i>
                    <span>Amount</span>
                </div>
                <input type="number" name="amount" placeholder="Enter Amount" required>
            </div>

            <button class="save-btn">Save Budget</button>
        </form>
    </div>

    <div class="table-wrapper">
        <table>
            <thead>
                <tr>
                    <th>Month</th>
                    <th>Year</th>
                    <th>Category</th>
                    <th>Amount</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td colspan="4" class="no-budget">Budgets Do Not Exist</td>
                </tr>
            </tbody>
        </table>
    </div>

</div>

</body>
</html>
