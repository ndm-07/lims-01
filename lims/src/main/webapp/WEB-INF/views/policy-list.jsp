<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>LifeShield | Policy Ledger</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary: #1a3a5f;
            --accent: #27ae60;
            --light: #f4f7f9;
            --text-gray: #5a6c7f;
            --border: #e1e8ed;
            --danger: #e74c3c;
            --warning: #f1c40f;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--light);
            color: var(--primary);
            margin: 0;
            padding: 40px 20px;
            display: flex;
            justify-content: center;
        }

        .container {
            width: 100%;
            max-width: 1100px;
            background: white;
            border-radius: 12px;
            padding: 40px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
            border: 1px solid var(--border);
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 35px;
            border-bottom: 2px solid var(--light);
            padding-bottom: 20px;
        }

        header h1 {
            margin: 0;
            font-size: 1.8rem;
            color: var(--primary);
        }

        header h1 span {
            color: var(--accent);
        }

        .subtitle {
            color: var(--text-gray);
            margin-top: 5px;
            font-size: 0.95rem;
        }

        /* Table Styling */
        .table-container {
            overflow-x: auto;
            margin-top: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            text-align: left;
        }

        th {
            background-color: #f8fafc;
            padding: 15px 18px;
            font-weight: 700;
            text-transform: uppercase;
            font-size: 0.75rem;
            letter-spacing: 1px;
            color: var(--text-gray);
            border-bottom: 2px solid var(--border);
        }

        td {
            padding: 18px;
            border-bottom: 1px solid var(--border);
            font-size: 0.95rem;
            color: var(--primary);
        }

        tr:hover {
            background-color: #fcfdfe;
        }

        /* Status Badge Styling */
        .status-badge {
            padding: 6px 14px;
            border-radius: 6px;
            font-size: 0.75rem;
            font-weight: 700;
            display: inline-block;
        }

        .status-active { background: #e8f5e9; color: var(--accent); border: 1px solid #c8e6c9; }
        .status-lapsed { background: #fdeaea; color: var(--danger); border: 1px solid #fad2d2; }
        .status-matured { background: #fff9e6; color: #9a7d0a; border: 1px solid #ffeeba; }

        .btn-home {
            text-decoration: none;
            color: var(--primary);
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 8px;
            padding: 10px 18px;
            border: 2px solid var(--primary);
            border-radius: 8px;
            transition: all 0.3s ease;
            font-size: 0.9rem;
        }

        .btn-home:hover {
            background-color: var(--primary);
            color: white;
        }

        .policy-num {
            font-family: 'Courier New', Courier, monospace;
            font-weight: 700;
            color: var(--primary);
        }
    </style>
</head>
<body>

<div class="container">
    <header>
        <div>
            <h1>Policy <span>Ledger</span></h1>
            <p class="subtitle">Global registry of all active and historical insurance contracts</p>
        </div>
        <a href="/policy/home" class="btn-home">
            <i class="fas fa-arrow-left"></i> Return to Dashboard
        </a>
    </header>

    <div class="table-container">
        <table>
            <thead>
            <tr>
                <th>Policy Identifier</th>
                <th>Coverage Value</th>
                <th>Premium Rate</th>
                <th>Current Status</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="p" items="${policies}">
                <tr>
                    <td class="policy-num">${p.policyNumber}</td>
                    <td>$${p.coverageAmount}</td>
                    <td>$${p.premiumAmount}</td>
                    <td>
                        <span class="status-badge
                             <c:choose>
                                 <c:when test="${p.policyStatus == 'ACTIVE'}">status-active</c:when>
                                 <c:when test="${p.policyStatus == 'LAPSED'}">status-lapsed</c:when>
                                 <c:otherwise>status-matured</c:otherwise>
                             </c:choose>">
                                ${p.policyStatus}
                        </span>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
