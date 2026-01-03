<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>LifeShield | Policy List</title>
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
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: var(--primary);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border: 1px solid var(--border);
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid var(--border);
        }

        th {
            background-color: var(--primary);
            color: white;
        }

        tr:hover {
            background-color: #f0f4f8;
        }

        a {
            color: var(--accent);
            text-decoration: none;
            font-weight: 500;
        }

        a:hover {
            color: #219150;
        }

        .back-link {
            display: inline-block;
            margin-top: 20px;
            color: var(--text-gray);
            text-decoration: none;
            font-weight: 500;
        }

        .back-link:hover {
            color: var(--primary);
        }
    </style>
</head>
<body>

<h2>All Insurance Policies</h2>

<table>
    <thead>
    <tr>
        <th>Policy Number</th>
        <th>Coverage</th>
        <th>Premium</th>
        <th>Status</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="p" items="${policies}">
        <tr>
            <td>${p.policyNumber}</td>
            <td>${p.coverageAmount}</td>
            <td>${p.premiumAmount}</td>
            <td>${p.policyStatus}</td>
            <td>
                <a href="/policy/execute-delete?policyNumber=${p.policyNumber}"
                   onclick="return confirm('Are you sure you want to delete this policy?')">Delete</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<a href="/policy/home" class="back-link">Back to Home</a>

</body>
</html>
