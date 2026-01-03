<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>LifeShield | Manage Beneficiaries</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary: #1a3a5f;
            --accent: #27ae60;
            --light: #f4f7f9;
            --white: #ffffff;
            --text-gray: #5a6c7f;
            --border: #e1e8ed;
            --danger: #e74c3c;
        }

        body {
            font-family: 'Segoe UI', Roboto, sans-serif;
            background-color: var(--light);
            color: var(--primary);
            margin: 0;
            padding: 40px 5%;
            line-height: 1.6;
        }

        .container {
            max-width: 1100px;
            margin: 0 auto;
            background: var(--white);
            border-radius: 15px;
            padding: 40px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
            border: 1px solid var(--border);
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 35px;
            border-bottom: 2px solid var(--light);
            padding-bottom: 25px;
        }

        .header-title h1 {
            margin: 0;
            font-size: 2rem;
            font-weight: 700;
        }

        .header-title h1 span { color: var(--accent); }

        .btn-back {
            text-decoration: none;
            color: var(--text-gray);
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 8px;
            transition: 0.3s;
        }

        .btn-back:hover { color: var(--primary); }

        /* --- Registration Form Section --- */
        .registration-box {
            background: #f8fafc;
            padding: 30px;
            border-radius: 12px;
            border: 1px solid var(--border);
            margin-bottom: 50px;
        }

        .registration-box h3 {
            margin-top: 0;
            margin-bottom: 20px;
            font-size: 1.1rem;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: 20px;
            align-items: end;
        }

        .input-group { display: flex; flex-direction: column; gap: 8px; }

        label {
            font-size: 0.75rem;
            font-weight: 700;
            text-transform: uppercase;
            color: var(--text-gray);
            letter-spacing: 0.5px;
        }

        input, select {
            padding: 12px;
            border: 2px solid var(--border);
            border-radius: 8px;
            outline: none;
            font-size: 0.95rem;
            transition: 0.3s;
        }

        input:focus, select:focus {
            border-color: var(--accent);
            background: white;
        }

        .btn-submit {
            background: var(--accent);
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 8px;
            font-weight: 700;
            cursor: pointer;
            transition: 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            justify-content: center;
        }

        .btn-submit:hover {
            background: #219150;
            transform: translateY(-2px);
        }

        /* --- Table Section --- */
        .table-wrapper { overflow-x: auto; }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th {
            text-align: left;
            padding: 18px 15px;
            background: #f1f5f9;
            font-size: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            color: var(--primary);
            border-bottom: 2px solid var(--border);
        }

        td {
            padding: 18px 15px;
            border-bottom: 1px solid var(--border);
            font-size: 1rem;
            color: var(--secondary);
        }

        tr:last-child td { border-bottom: none; }
        tr:hover { background-color: #fcfdfe; }

        .policy-badge {
            background: #e1e8ed;
            padding: 4px 10px;
            border-radius: 6px;
            font-family: 'Courier New', monospace;
            font-weight: 700;
            font-size: 0.9rem;
        }

        .btn-delete {
            color: var(--danger);
            background: rgba(231, 76, 60, 0.1);
            width: 35px;
            height: 35px;
            border-radius: 6px;
            display: flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
            transition: 0.3s;
        }

        .btn-delete:hover {
            background: var(--danger);
            color: white;
        }

        .empty-state {
            text-align: center;
            padding: 40px;
            color: var(--text-gray);
        }
    </style>
</head>
<body>

<div class="container">
    <header>
        <div class="header-title">
            <h1>Beneficiary <span>Registry</span></h1>
            <p style="color: #5a6c7f; margin-top: 5px;">Configure nominee allocations for active policy records</p>
        </div>
        <a href="<c:url value='/auth/homePage' />" class="btn-back">
            <i class="fas fa-home"></i> Home
        </a>
    </header>

    <div class="registration-box">
        <h3><i class="fas fa-user-plus" style="color: #27ae60;"></i> Create New Allocation</h3>

        <form action="<c:url value='/beneficiary/add' />" method="post">
            <div class="form-grid">
                <div class="input-group">
                    <label>Policy ID</label>
                    <input type="number" name="policyId" placeholder="e.g. 1" required>
                </div>

                <div class="input-group">
                    <label>Full Name</label>
                    <input type="text" name="name" placeholder="Enter full name" required>
                </div>

                <div class="input-group">
                    <label>Relationship</label>
                    <select name="relationship">
                        <option value="Spouse">Spouse</option>
                        <option value="Brother">Brother</option>
                        <option value="Sister">Sister</option>
                        <option value="Child">Child</option>
                        <option value="Parent">Parent</option>
                        <option value="Other">Other</option>
                    </select>
                </div>

                <div class="input-group">
                    <label>Share (%)</label>
                    <input type="number" name="percentageShare" step="0.01" min="0" max="100" placeholder="0.00" required>
                </div>

                <button type="submit" class="btn-submit">
                    <i class="fas fa-save"></i> Add Nominee
                </button>
            </div>
        </form>
    </div>

    <div class="table-wrapper">
        <table>
            <thead>
            <tr>
                <th>B-ID</th>
                <th>Linked Policy</th>
                <th>Beneficiary Name</th>
                <th>Relationship</th>
                <th>Percentage Share</th>
                <th style="text-align: center;">Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="b" items="${beneficiaries}">
                <tr>
                    <td>${b.beneficiaryId}</td>
                    <td>ID-${b.policyId}</td>
                    <td>${b.name}</td>
                    <td>${b.relationship}</td>
                    <td>
                        <div style="display: flex; align-items: center; gap: 8px;">
                            <span>${b.percentageShare}%</span>
                            <div style="width: 60px; height: 6px; background: #eee; border-radius: 3px; overflow: hidden;">
                                <div style="width:${b.percentageShare}%; height:100%; background:#27ae60;"></div>
                            </div>
                        </div>
                    </td>
                    <td style="display: flex; justify-content: center;">
                        <a href="<c:url value='/beneficiary/delete/${b.beneficiaryId}' />"
                           class="btn-delete"
                           onclick="return confirm('Remove this beneficiary from the policy?')">
                            <i class="fas fa-trash-alt"></i>
                        </a>
                    </td>
                </tr>
            </c:forEach>

            <c:if test="${empty beneficiaries}">
                <tr>
                    <td colspan="6" class="empty-state">
                        <i class="fas fa-folder-open" style="font-size: 2rem; display: block; margin-bottom: 10px;"></i>
                        No beneficiaries found in the system.
                    </td>
                </tr>
            </c:if>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
