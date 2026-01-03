<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>LifeShield | Edit Policy</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary: #1a3a5f;
            --accent: #27ae60;
            --light: #f4f7f9;
            --text-gray: #5a6c7f;
            --border: #e1e8ed;
            --danger: #e74c3c;
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
            max-width: 850px;
            background: white;
            border-radius: 12px;
            padding: 45px;
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
            margin-top: 8px;
            font-size: 1rem;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 25px;
        }

        .input-group {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .full-width { grid-column: span 2; }

        label {
            font-size: 0.85rem;
            font-weight: 700;
            color: var(--primary);
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        input, select {
            padding: 14px;
            border: 2px solid var(--border);
            border-radius: 8px;
            font-size: 1rem;
            color: var(--primary);
            outline: none;
            transition: all 0.3s;
        }

        input[readonly] {
            background-color: #f8fafc;
            border-color: var(--border);
            color: var(--text-gray);
            cursor: not-allowed;
        }

        input:focus:not([readonly]), select:focus {
            border-color: var(--accent);
            background-color: #fff;
        }

        .action-footer {
            grid-column: span 2;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 30px;
            padding-top: 30px;
            border-top: 2px solid var(--light);
        }

        .btn-save {
            background-color: var(--accent);
            color: white;
            padding: 14px 45px;
            border: none;
            border-radius: 8px;
            font-weight: 700;
            font-size: 1rem;
            cursor: pointer;
            transition: background 0.3s;
        }

        .btn-save:hover {
            background-color: #219150;
        }

        .btn-cancel {
            color: var(--text-gray);
            text-decoration: none;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 8px;
            transition: color 0.3s;
        }

        .btn-cancel:hover {
            color: var(--danger);
        }
    </style>
</head>
<body>

<div class="container">
    <header>
        <h1>Update <span>Policy</span></h1>
        <p class="subtitle">
            Modifying Record: <strong>${policy.policyNumber}</strong>
        </p>
    </header>

    <form:form action="/policy/update" modelAttribute="policy" method="POST">
        <form:hidden path="policyId"/>

        <div class="form-grid">
            <div class="input-group full-width">
                <label>Immutable Policy Number</label>
                <form:input path="policyNumber" readonly="true"/>
            </div>

            <div class="input-group">
                <label>Coverage Adjustment ($)</label>
                <form:input path="coverageAmount" type="number" step="0.01" required="true"/>
            </div>

            <div class="input-group">
                <label>Premium Rate ($)</label>
                <form:input path="premiumAmount" type="number" step="0.01" required="true"/>
            </div>

            <div class="input-group">
                <label>Contract Term (Years)</label>
                <form:input path="termYears" type="number" required="true"/>
            </div>

            <div class="input-group">
                <label>Policy Status</label>
                <form:select path="policyStatus">
                    <form:option value="ACTIVE" label="ACTIVE"/>
                    <form:option value="LAPSED" label="LAPSED"/>
                    <form:option value="MATURED" label="MATURED"/>
                </form:select>
            </div>

            <div class="input-group">
                <label>Effective Date</label>
                <form:input path="startDate" type="date" required="true"/>
            </div>

            <div class="input-group">
                <label>Expiration Date</label>
                <form:input path="endDate" type="date" required="true"/>
            </div>

            <div class="action-footer">
                <a href="/policy/home" class="btn-cancel">
                    <i class="fas fa-times"></i> Abort Changes
                </a>
                <button type="submit" class="btn-save">Save Changes</button>
            </div>
        </div>
    </form:form>
</div>

</body>
</html>
