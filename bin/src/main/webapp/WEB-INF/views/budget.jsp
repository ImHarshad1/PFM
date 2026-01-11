<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Monthly Budget</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>

    <style>
      
        :root {
            --primary: #007BFF;
            --primary-hover: #0056B3;
            --bg-light: #F4F6F8;
            --card-bg: #FFFFFF;
            --text-primary: #333333;
            --text-secondary: #555555;
            --border-light: #E0E4E8;
            --warning: #FFC107;
        }

        * {
            box-sizing: border-box;
            font-family: 'Inter', sans-serif;
        }

        body {
            background: var(--bg-light);
            min-height: 100vh;
            padding: 40px 0;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        /* ===== Budget Card ===== */
        .budget-card {
            background: var(--card-bg);
            width: 420px;
            padding: 32px;
            border-radius: 16px;
            box-shadow: 0 12px 28px rgba(0,0,0,0.08);
        }

        .budget-card h2 {
            color: var(--primary);
            text-align: center;
            margin-bottom: 6px;
        }

        .budget-card p {
            text-align: center;
            color: var(--text-secondary);
            font-size: 14px;
            margin-bottom: 26px;
        }

        .form-group {
            margin-bottom: 18px;
        }

        .form-group label {
            font-size: 13px;
            font-weight: 500;
            color: var(--text-primary);
            margin-bottom: 6px;
            display: block;
        }

        .form-group i {
            color: var(--primary);
            margin-right: 6px;
        }

        .form-group select,
        .form-group input {
            width: 100%;
            padding: 12px 14px;
            border-radius: 10px;
            border: 1px solid var(--border-light);
            font-size: 14px;
            outline: none;
            background-color: #fff;
            transition:
                border-color 0.25s ease,
                box-shadow 0.25s ease,
                background-color 0.25s ease,
                transform 0.15s ease;
        }

        .form-group select:hover,
        .form-group input:hover {
            background-color: rgba(0, 123, 255, 0.05);
        }

        .form-group select:focus,
        .form-group input:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 2px rgba(0,123,255,0.2);
            transform: translateY(-1px);
        }

        .enhanced-select {
            position: relative;
        }

        .enhanced-select .dropdown {
            position: absolute;
            top: calc(100% + 6px);
            left: 0;
            width: 100%;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 16px 32px rgba(0, 0, 0, 0.15);
            overflow: hidden;
            opacity: 0;
            transform: translateY(-8px);
            pointer-events: none;
            transition: opacity 0.25s ease, transform 0.25s ease;
            z-index: 20;
        }

        .enhanced-select.open .dropdown {
            opacity: 1;
            transform: translateY(0);
            pointer-events: auto;
        }

        .enhanced-select .option {
            padding: 11px 12px;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.2s ease, color 0.2s ease;
        }

        .enhanced-select .option:hover {
            background-color: rgba(0,123,255,0.12);
            color: var(--primary);
        }

        /* ===== Save Button ===== */
        .save-btn {
            width: 100%;
            padding: 13px;
            border-radius: 10px;
            border: none;
            background: linear-gradient(135deg, var(--primary), var(--primary-hover));
            color: #fff;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            margin-top: 10px;
        }

        .save-btn:hover {
            opacity: 0.95;
        }

        /* ===== Existing Budget ===== */
        .existing-budget {
            width: 90%;
            max-width: 900px;
            margin-top: 40px;
            background: var(--card-bg);
            padding: 22px;
            border-radius: 14px;
            box-shadow: 0 12px 28px rgba(0,0,0,0.08);
        }

        .existing-budget h3 {
            font-size: 16px;
            margin-bottom: 14px;
            color: var(--primary);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            overflow: hidden;
            border-radius: 10px;
        }

        table th {
            background: rgba(0,123,255,0.12);
            color: var(--text-primary);
            padding: 12px;
            text-align: left;
            font-size: 14px;
        }

        table td {
            padding: 12px;
            border-bottom: 1px solid var(--border-light);
            font-size: 14px;
            color: var(--text-secondary);
        }

        table tr:last-child td {
            border-bottom: none;
        }

        .no-budget {
            text-align: center;
            color: var(--text-secondary);
            padding: 16px;
        }
    </style>
</head>

<body>

<jsp:include page="navbar.jsp" />

<!-- ===== Add Monthly Budget ===== -->
<div class="budget-card">
    <h2>Add Monthly Budget</h2>
    <p>Track and control your spending goals</p>

    <form action="saveBudget" method="post">

        <div class="form-group">
            <label><i class="fa-solid fa-calendar"></i> Month</label>
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
            <label><i class="fa-solid fa-calendar-days"></i> Year</label>
            <select name="year" required>
                <option value="">Select Year</option>
                <option>2024</option>
                <option>2025</option>
                <option>2026</option>
            </select>
        </div>

        <div class="form-group">
            <label><i class="fa-solid fa-tags"></i> Category</label>
            <select name="categoryId" required>
                <option value="">Select Category</option>
                <option value="1">Food</option>
                <option value="2">Rent</option>
                <option value="3">Shopping</option>
                <option value="4">Movie</option>
                <option value="5">Salary</option>
                <option value="6">Travel</option>
                <option value="7">EMI</option>
                <option value="8">Mobile Recharge</option>
                <option value="9">Bills</option>
                <option value="10">Other Expense</option>
                <option value="11">Other Income</option>
            </select>
        </div>

        <div class="form-group">
            <label><i class="fa-solid fa-indian-rupee-sign"></i> Amount</label>
            <input type="number" name="amount" placeholder="Enter amount" required>
        </div>

        <button class="save-btn">Save Budget</button>
    </form>
</div>

<!-- ===== Existing Budget ===== -->
<div class="existing-budget">
    <h3>Existing Budget</h3>

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
            <td colspan="4" class="no-budget">Budgets Does Not Exists</td>
        </tr>
        </tbody>
    </table>
</div>

<!-- ===== JS ===== -->
<script>
document.querySelectorAll('.form-group select').forEach(select => {

    const wrapper = document.createElement('div');
    wrapper.className = 'enhanced-select';

    const dropdown = document.createElement('div');
    dropdown.className = 'dropdown';

    [...select.options].forEach(opt => {
        if (!opt.value) return;

        const div = document.createElement('div');
        div.className = 'option';
        div.textContent = opt.textContent;

        div.addEventListener('click', () => {
            select.value = opt.value;
            wrapper.classList.remove('open');
        });

        dropdown.appendChild(div);
    });

    select.parentNode.insertBefore(wrapper, select);
    wrapper.appendChild(select);
    wrapper.appendChild(dropdown);

    select.addEventListener('mousedown', e => {
        e.preventDefault();
        wrapper.classList.toggle('open');
    });

    document.addEventListener('click', e => {
        if (!wrapper.contains(e.target)) {
            wrapper.classList.remove('open');
        }
    });
});
</script>

</body>
</html>
