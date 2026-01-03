<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>LifeShield | System Update</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary: #1a3a5f;
            --accent: #27ae60;
            --light: #f4f7f9;
            --text-gray: #5a6c7f;
            --border: #e1e8ed;
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
            text-align: center;
            margin-bottom: 40px;
            border-bottom: 2px solid var(--light);
            padding-bottom: 25px;
        }

        header h1 {
            margin: 0;
            font-size: 2rem;
            color: var(--primary);
        }

        header h1 span {
            color: var(--accent);
        }

        .subtitle {
            color: var(--text-gray);
            margin-top: 5px;
            font-size: 1rem;
        }

        .table-wrapper {
            margin-top: 20px;
            border: 1px solid var(--border);
            border-radius: 8px;
            overflow: hidden;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            text-align: left;
        }

        th {
            background-color: #f8fafc;
            padding: 18px 20px;
            font-size: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            color: var(--text-gray);
            border-bottom: 2px solid var(--border);
        }

        td {
            padding: 15px 20px;
            border-bottom: 1px solid var(--border);
            color: var(--primary);
            font-size: 0.95rem;
        }

        tr:last-child td { border-bottom: none; }

        tr:hover {
            background-color: #fcfdfe;
        }

        .btn-edit {
            background-color: transparent;
            border: 2px solid var(--accent);
            color: var(--accent);
            padding: 6px 16px;
            border-radius: 6px;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            font-size: 0.75rem;
            text-decoration: none;
            display: inline-block;
        }

        .btn-edit:hover {
            background-color: var(--accent);
            color: white;
        }

        .back-link {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            margin-top: 30px;
            color: var(--text-gray);
            text-decoration: none;
            font-weight: 600;
            font-size: 0.95rem;
            transition: color 0.3s;
        }

        .back-link:hover { color: var(--primary); }

        .policy-id {
            color: var(--primary);
            font-weight: 700;
            font-family: 'Courier New', Courier, monospace;
        }
    </style>
</head>
<body>

<div class="container">
    <header>
        <h1>Modify <span>Records</span></h1>
        <p class="subtitle">Select a policy record from the registry to update its parameters</p>
    </header>

    <div class="table-wrapper">
        <table>
            <thead>
            <tr>
                <th>Policy Identifier</th>
                <th>Coverage Value</th>
                <th>Premium Rate</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="p" items="${policies}">
                <tr>
                    <td class="policy-id">${p.policyNumber}</td>
                    <td>$${p.coverageAmount}</td>
                    <td>$${p.premiumAmount}</td>
                    <td>${p.policyStatus}</td>
                    <td>
                        <a href="/policy/edit/${p.policyNumber}" class="btn-edit">
                            Edit
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <a href="/policy/home" class="back-link">
        <i class="fas fa-arrow-left"></i> Return to Dashboard
    </a>
</div>

</body>
</html>
