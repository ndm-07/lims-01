<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>LifeShield | Premium Payments</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary: #1a3a5f;
            --secondary: #2c3e50;
            --accent: #27ae60;
            --light: #f4f7f9;
            --border: #e1e8ed;
            --white: #ffffff;
            --danger: #e74c3c;
            --warning: #f39c12;
        }

        body {
            font-family: 'Segoe UI', sans-serif;
            background: var(--light);
            margin: 0;
            padding: 20px 5%;
        }

        .payment-grid {
            display: grid;
            grid-template-columns: 350px 1fr;
            gap: 30px;
            margin-top: 30px;
        }

        .page-header {
            background: var(--primary);
            color: white;
            padding: 25px 40px;
            border-radius: 12px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        .payment-card {
            background: var(--white);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 8px 24px rgba(0,0,0,0.05);
            height: fit-content;
        }

        .payment-card h3 {
            color: var(--primary);
            margin-top: 0;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-size: 0.8rem;
            font-weight: 700;
            color: var(--secondary);
            text-transform: uppercase;
            margin-bottom: 8px;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 12px;
            border: 1px solid var(--border);
            border-radius: 6px;
            box-sizing: border-box;
            font-size: 1rem;
        }

        .btn-pay {
            width: 100%;
            background: var(--accent);
            color: white;
            border: none;
            padding: 15px;
            border-radius: 6px;
            font-weight: 700;
            cursor: pointer;
            transition: 0.3s;
            font-size: 1rem;
        }

        .btn-pay:hover {
            background: #219150;
            transform: translateY(-2px);
        }

        .history-card {
            background: var(--white);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 8px 24px rgba(0,0,0,0.05);
        }

        .history-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }

        .filter-box {
            display: flex;
            gap: 10px;
        }

        .filter-box input {
            padding: 8px 15px;
            border: 1px solid var(--border);
            border-radius: 20px;
            outline: none;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            text-align: left;
            padding: 15px;
            background: #f8f9fa;
            color: var(--secondary);
            font-size: 0.85rem;
            text-transform: uppercase;
            border-bottom: 2px solid var(--border);
        }

        td {
            padding: 15px;
            border-bottom: 1px solid var(--border);
            color: var(--primary);
            font-size: 0.95rem;
        }

        /* Dynamic Status Pills */
        .status-pill {
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 0.75rem;
            font-weight: 800;
            text-transform: uppercase;
        }

        .status-SUCCESS {
            background: #e8f5e9;
            color: var(--accent);
        }

        .status-PENDING {
            background: #fff3e0;
            color: var(--warning);
        }

        .status-FAILED {
            background: #ffebee;
            color: var(--danger);
        }

        .policy-tag {
            background: #e1f5fe;
            color: #0288d1;
            padding: 2px 8px;
            border-radius: 4px;
            font-family: monospace;
            font-weight: bold;
        }
    </style>

</head>
<body>

<div class="page-header">
    <div>
        <h1 style="margin:0;"><i class="fas fa-credit-card"></i> Payment Center</h1>
        <p style="margin:5px 0 0 0; opacity: 0.8;">Secure Premium Management for LifeShield Policies</p>
    </div>
    <div class="header-actions">
        <a href="<c:url value='/auth/homePage' />" style="color:white; text-decoration:none; font-weight:600;">
            <i class="fas fa-home"></i> Home
        </a>
    </div>
</div>

<div class="payment-grid">
    <aside class="payment-card">
        <h3><i class="fas fa-wallet"></i> Pay Premium</h3>
        <form:form method="post" modelAttribute="newPayment" action="${pageContext.request.contextPath}/payment/makePayment">
            <div class="form-group">
                <label>Policy ID</label>
                <form:input path="policyId" placeholder="Enter Policy ID" required="required"/>
            </div>
            <div class="form-group">
                <label>Amount ($)</label>
                <form:input path="paymentAmount" type="number" placeholder="0.00" step="0.01" required="required"/>
            </div>
            <div class="form-group">
                <label>Payment Method</label>
                <select name="method">
                    <option value="CARD">Credit / Debit Card</option>
                    <option value="NETBANKING">Net Banking</option>
                    <option value="UPI">UPI Transfer</option>
                </select>
            </div>
            <button type="submit" class="btn-pay">Securely Make Payment</button>
        </form:form>
        <div style="margin-top: 20px; text-align: center; color: #7f8c8d; font-size: 0.8rem;">
            <i class="fas fa-lock"></i> SSL Encrypted Transaction
        </div>
    </aside>

    <main class="history-card">
        <div class="history-header">
            <h3 style="margin:0; color: var(--primary);">Recent Transactions</h3>
            <div class="filter-box">
                <form method="get" action="${pageContext.request.contextPath}/payment/filter">
                    <input type="text" name="policyId" placeholder="Filter by Policy ID..."/>
                    <button type="submit" style="background:none; border:none; cursor:pointer; color:var(--primary);">
                        <i class="fas fa-search"></i>
                    </button>
                </form>
            </div>
        </div>

        <table>
            <thead>
            <tr>
                <th>Payment ID</th>
                <th>Policy</th>
                <th>Date</th>
                <th>Amount</th>
                <th>Status</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="p" items="${payments}">
                <tr>
                    <td>#PAY-${p.paymentId}</td>
                    <td><span class="policy-tag">POL-${p.policyId}</span></td>
                    <td><c:out value="${p.paymentDate != null ? p.paymentDate : 'Pending'}"/></td>
                    <td>$<c:out value="${p.paymentAmount}"/></td>
                    <td>
                        <span class="status-pill status-${p.paymentStatus}">${p.paymentStatus}</span>
                    </td>
                </tr>
            </c:forEach>
            <c:if test="${empty payments}">
                <tr>
                    <td colspan="5" style="text-align:center; padding: 40px; color: #7f8c8d;">
                        No payment history found for this account.
                    </td>
                </tr>
            </c:if>
            </tbody>
        </table>
    </main>
</div>

</body>
</html>
