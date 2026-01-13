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

    .page-container {
        max-width: 1200px;
        margin: 40px auto;
        display: flex;
        gap: 30px;
        padding: 0 20px;
    }

    /* ===== FILTER CARD ===== */
    .filter-card {
        width: 280px;
        background: #ffffff;
        border-radius: 18px;
        padding: 26px 22px;
        box-shadow: 0 15px 35px rgba(0,0,0,0.12);
    }

    .filter-card h3 {
        text-align: center;
        color: #1e293b;
        margin-bottom: 22px;
        margin-top: 0px;
        font-size: 25px;
        font-weight: 700;
    }

    .filter-group {
        margin-bottom: 18px;
    }

    /* ICON + LABEL */
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
        font-size: 13px;
    }

    .filter-group input,
    .filter-group select {
        width: 100%;
        height: 44px;
        padding: 0 14px;
        border-radius: 10px;
        border: 1px solid #e2e8f0;
        font-size: 14px;
        color: #334155;
        background: #ffffff;
        box-sizing: border-box;
    }

    .filter-group input:focus,
    .filter-group select:focus {
        border-color: #2563eb;
        box-shadow: 0 0 0 2px rgba(37,99,235,0.15);
        outline: none;
    }

    /* TYPE BUTTONS */
    .type-buttons {
        display: flex;
        gap: 12px;
        margin-top: 10px;
    }

    .type-btn {
        flex: 1;
        height: 42px;
        border-radius: 10px;
        border: none;
        font-weight: 600;
        font-size: 13px;
        cursor: pointer;
        background: #e0e7ff;
        color: #1e3a8a;
    }

    .type-btn:hover {
        background: #c7d2fe;
    }

    /* ===== REPORT CARD ===== */
    .report-card {
        flex: 1;
        background: #ffffff;
        border-radius: 18px;
        padding: 24px;
        box-shadow: 0 12px 30px rgba(0,0,0,0.1);
    }

    .report-card h2 {
        text-align: center;
        font-size: 26px;
        font-weight: 700;
        color: #1e293b;
        margin-bottom: 18px;
        margin-top: 0px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        border-radius: 14px;
        overflow: hidden;
        font-size: 14px;
    }

    /* TABLE */
    thead {
        background: linear-gradient(135deg, #1e3a8a, #2563eb);
    }

    thead th {
        color: #ffffff;
        padding: 14px;
        text-align: center;
        font-size: 14px;
    }

    tbody td {
        padding: 14px;
        text-align: center;
        border-bottom: 1px solid #e2e8f0;
        color: #475569;
    }

    tbody tr:nth-child(even) {
        background: #f8fafc;
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
        background: linear-gradient(135deg, #2563eb, #1e3a8a);
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

    <!-- FILTERS -->
    <div class="filter-card">
        <h3>Filters</h3>

        <div class="filter-group">
                <div class="field-label">
                    <i class="fa-solid fa-calendar"></i>
                    <span>From Date</span>
                </div>
                <input type="date" name="fromDate">
            </div>

            <div class="filter-group">
                <div class="field-label">
                    <i class="fa-solid fa-calendar-check"></i>
                    <span>To Date</span>
                </div>
                <input type="date" name="toDate">
            </div>

        <div class="type-buttons">
            <button class="type-btn">INCOME</button>
            <button class="type-btn">EXPENSE</button>
            <button class="type-btn">BOTH</button>
        </div>
    </div>

    <!-- REPORT -->
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
