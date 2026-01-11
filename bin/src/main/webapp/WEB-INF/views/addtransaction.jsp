<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Transaction</title>

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

        /* ===== Transaction Card ===== */
        .transaction-card {
            background: var(--card-bg);
            width: 420px;
            padding: 32px;
            border-radius: 16px;
            box-shadow: 0 12px 28px rgba(0,0,0,0.08);
        }

        .transaction-card h2 {
            color: var(--primary);
            text-align: center;
            margin-bottom: 6px;
        }

        .transaction-card p {
            text-align: center;
            color: var(--text-secondary);
            font-size: 14px;
            margin-bottom: 26px;
        }

        .form-group {
            margin-bottom: 18px;
        }

        .form-group i {
            color: var(--primary);
            margin-right: 6px;
        }

        .form-group label {
            font-size: 13px;
            font-weight: 500;
            color: var(--text-primary);
            margin-bottom: 6px;
            display: block;
        }

        .form-group input,
        .form-group select {
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

        .form-group input:hover,
        .form-group select:hover {
            background-color: rgba(0, 123, 255, 0.05);
        }

        .form-group input:focus,
        .form-group select:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 2px rgba(0, 123, 255, 0.2);
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
            background-color: rgba(0, 123, 255, 0.12);
            color: var(--primary);
        }


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
    </style>
</head>

<body>

<jsp:include page="navbar.jsp" />
<%
           java.util.List<com.pfm.entity.Category> ctgs =(java.util.List<com.pfm.entity.Category>) request.getAttribute("categories");
%>
<!-- ===== Add Transaction ===== -->
<div class="transaction-card">
    <h2>Add Transaction</h2>
    <p>Add a new transaction to track your spending</p>

    <form action="addtransaction" method="post">

        <div class="form-group">
            <label><i class="fa-solid fa-indian-rupee-sign"></i>Amount</label>
            <input type="number" name="amount" placeholder="Enter amount" required>
        </div>

        <div class="form-group">
            <label><i class="fa-solid fa-file-prescription"></i>Description</label>
            <input type="text" name="description" placeholder="e.g. Groceries">
        </div>

        <div class="form-group">
            <label><i class="fa-solid fa-calendar-day"></i>Date</label>
            <input type="date" name="date" required>
        </div>

        <div class="form-group">
            <label><i class="fa-solid fa-tags"></i>Category</label>
            <select name="catId" required>
                <option value="">Select category</option>
                 <%
                	if(!ctgs.isEmpty())
                	{
                		for(com.pfm.entity.Category cat : ctgs)
                		{
                %>
                	<option value="<%=cat.getId()%>"><%=cat.getName()%></option>
            
            		<%
                		} 
                	%>
                		</select>
                <%
                	}else{
               	%>
                    	<p style="color: red">Categories Not Found!!!!</p>
               	<%
               		}
               	%>
        </div>

        <button class="save-btn">Save Transaction</button>
    </form>
</div>

 <!-- ===== JS===== -->
 <!--
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
</script> -->

</body>
</html>
