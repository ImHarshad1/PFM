<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Monthly Report</title>

<style>
    body {
        margin: 0;
        font-family: 'Segoe UI', system-ui, sans-serif;
        background: #eef2f7;
        min-height: 100vh;
    }

    /* PAGE LAYOUT */
    .page-container {
        max-width: 1200px;
        margin: 30px auto;
        display: flex;
        gap: 25px;
        padding: 0 20px;
    }

    /* FILTER CARD */
    .filter-card {
        width: 260px;
        background: rgba(255, 255, 255, 0.95);
        border-radius: 18px;
        padding: 22px;
        box-shadow: 0 20px 40px rgba(0, 0, 0, 0.12);
    }

    .filter-card h3 {
        margin: 0 0 18px;
        text-align: center;
        font-size: 18px;
        font-weight: 700;
        color: #1e293b;
    }

    .filter-group {
        margin-bottom: 15px;
    }

    .filter-group label {
        font-size: 13px;
        font-weight: 600;
        color: #64748b;
        margin-bottom: 6px;
        display: block;
    }

    .filter-group select {
        width: 100%;
        padding: 10px;
        border-radius: 10px;
        border: 1px solid #cbd5e1;
        font-size: 14px;
        background: white;
    }

    .filter-btn {
        width: 100%;
        padding: 11px;
        margin-top: 12px;
        border: none;
        border-radius: 12px;
        font-size: 14px;
        font-weight: 600;
        cursor: pointer;
        color: white;
        background: linear-gradient(135deg, #0d6efd, #003d99);
    }

    .filter-btn.secondary {
        margin-top: 10px;
        background: #0d6efd;
    }

    /* REPORT CARD */
    .report-card {
        flex: 1;
        background: rgba(255, 255, 255, 0.95);
        border-radius: 20px;
        padding: 28px;
        box-shadow: 0 20px 40px rgba(0, 0, 0, 0.12);
    }

    .report-card h2 {
        margin: 0 0 18px;
        text-align: center;
        font-size: 22px;
        font-weight: 700;
        color: #1e293b;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        font-size: 14px;
    }

    th, td {
        padding: 12px;
        text-align: left;
        border-bottom: 1px solid #e2e8f0;
    }

    th {
        background: #f1f5f9;
        font-weight: 700;
        color: #334155;
    }

    td {
        color: #475569;
    }

    .empty-row {
        text-align: center;
        padding: 25px;
        color: #64748b;
        font-style: italic;
    }

    .download-btn {
        margin-top: 22px;
        width: 100%;
        padding: 13px;
        background: linear-gradient(135deg, #0d6efd, #003d99);
        color: white;
        border: none;
        border-radius: 14px;
        font-size: 15px;
        font-weight: 600;
        cursor: pointer;
    }

    @media (max-width: 900px) {
        .page-container {
            flex-direction: column;
        }

        .filter-card {
            width: 100%;
        }
    }
</style>

</head>
<body>


<jsp:include page="navbar.jsp" />


<div class="page-container">

    <div class="filter-card">
        <h3>Filters</h3>

        <div class="filter-group">
            <label>Month</label>
            <select>
                <option>Select Month</option>
            </select>
        </div>

        <div class="filter-group">
            <label>Year</label>
            <select>
                <option>Select Year</option>
            </select>
        </div>

        <button class="filter-btn">INCOME</button>
        <button class="filter-btn secondary">EXPENSE</button>
    </div>


    <div class="report-card">
        <h2>Monthly Transactions</h2>

        <table>
            <thead>
                <tr>
                    <th>Date</th>
                    <th>Description</th>
                    <th>Category</th>
                    <th>Type</th>
                    <th>Amount</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td colspan="5" class="empty-row">
                        Please select a Month, Year, and Type to view the report.
                    </td>
                </tr>
            </tbody>
        </table>

        <button class="download-btn">Download PDF</button>
    </div>

</div>

</body>
</html>
