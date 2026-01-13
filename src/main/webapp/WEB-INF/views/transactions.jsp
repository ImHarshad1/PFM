<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Transactions</title>

<style>
    body {
        margin: 0;
        font-family: 'Segoe UI', system-ui, sans-serif;
        background: linear-gradient(180deg, #eef2f7, #f8fafc);
        min-height: 100vh;
    }

    .page-container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 40px;
    }

    .content-grid {
        display: grid;
        grid-template-columns: 280px 1fr;
        gap: 30px;
    }

/* 	filter card */
    .filters-card {
        background: #ffffff;
        padding: 26px 22px;
        border-radius: 18px;
        box-shadow: 0 15px 35px rgba(0,0,0,0.12);
    }

    .filters-card h3 {
        text-align: center;
        color: #1e293b;
        margin-bottom: 22px;
        margin-top: 0px;
        font-size: 25px;
        font-weight: 700;
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

    .filter-group {
        margin-bottom: 18px;
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

    /* select arrow */
    .filter-group select {
        appearance: none;
        background-image:
          url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='14' height='14' fill='%2394a3b8' viewBox='0 0 16 16'%3E%3Cpath d='M1.5 5.5l6 6 6-6'/%3E%3C/svg%3E");
        background-repeat: no-repeat;
        background-position: right 14px center;
        padding-right: 40px;
    }

    /* TYPE BUTTONS */
    .type-buttons {
        display: flex;
        gap: 12px;
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

    .apply-btn {
        width: 100%;
        height: 46px;
        margin-top: 14px;
        border-radius: 12px;
        border: none;
        background: linear-gradient(135deg, #2563eb, #1e3a8a);
        color: #fff;
        font-weight: 600;
        font-size: 14px;
        cursor: pointer;
    }
    
    .apply-btn:hover {
	    background: linear-gradient(135deg, #2563eb, #0d6efd);

	}
    
    /* Clear Filters Button */
	.clear-btn {
	    width: 100%;
	    height: 44px;
	    margin-top: 10px;
	    border-radius: 12px;
	    border: 1px solid #c7d2fe;
	    background: #ffffff;
	    color: #1e3a8a;
	    font-size: 14px;
	    font-weight: 600;
	    cursor: pointer;
	    transition: all 0.2s ease;
	}

	.clear-btn:hover {
	    background: #eef2ff;
	}
    

    /* TABLE */
    .table-card {
        background: #ffffff;
        padding: 24px;
        border-radius: 18px;
        box-shadow: 0 12px 30px rgba(0,0,0,0.1);
        max-width: 850px;
    	width: 100%;
    }

    .table-title {
        text-align: center;
        font-size: 26px;
        font-weight: 700;
        color: #1e293b;
        margin-bottom: 18px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        border-radius: 14px;
        overflow: hidden;
        font-size: 14px;
    }

    thead {
        background: linear-gradient(135deg, #1e3a8a, #2563eb);
    }

    thead th {
        color: #ffffff;
        padding: 14px;
        font-size: 14px;
        text-align: center;
    }

    tbody td {
        padding: 14px;
        text-align: center;
        border-bottom: 1px solid #e2e8f0;
        font-size: 14px;
        color: #475569;
    }

    tbody tr:nth-child(even) {
        background: #f8fafc;
    }

    .no-data {
        color: #dc2626;
        font-weight: 600;
        padding: 20px;
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
    <div class="content-grid">

        <!-- FILTERS -->
        <form class="filters-card" action="filterTransactions" method="get">

            <h3>Filters</h3>

            <div class="filter-group">
                <div class="field-label">
                    <i class="fa-solid fa-list"></i>
                    <span>Type</span>
                </div>
                <div class="type-buttons">
                    <button type="submit" name="type" value="INCOME" class="type-btn">INCOME</button>
                    <button type="submit" name="type" value="EXPENSE" class="type-btn">EXPENSE</button>
                </div>
            </div>

            <div class="filter-group">
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

            <button class="apply-btn">Apply Filters</button>
            <button type="button" class="clear-btn" onclick="clearFilters()">Clear Filters</button>
            
        </form>

        <!-- TABLE -->
        <div class="table-card">
            <div class="table-title">Monthly Transactions</div>

            <table>
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Description</th>
                        <th>Category</th>
                        <th>Type</th>
                        <th>Amount</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="6" class="no-data">No Transactions Found</td>
                    </tr>
                </tbody>
            </table>
        </div>

    </div>
</div>

</body>
</html>
