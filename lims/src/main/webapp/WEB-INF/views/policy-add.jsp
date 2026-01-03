<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>LifeShield | Initialize Policy</title>
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
            max-width: 800px;
            background: white;
            border-radius: 12px;
            padding: 40px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
            border: 1px solid var(--border);
        }

        header {
            text-align: center;
            margin-bottom: 35px;
            border-bottom: 2px solid var(--light);
            padding-bottom: 20px;
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
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
        }

        .input-group {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .full-width {
            grid-column: span 2;
        }

        label {
            font-size: 0.9rem;
            font-weight: 600;
            color: var(--primary);
        }

        input, select {
            padding: 12px 15px;
            border: 2px solid var(--border);
            border-radius: 8px;
            font-size: 1rem;
            color: var(--primary);
            outline: none;
            transition: border-color 0.3s;
        }

        input:focus, select:focus {
            border-color: var(--accent);
        }

        .action-bar {
            grid-column: span 2;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 30px;
            padding-top: 25px;
            border-top: 2px solid var(--light);
        }

        .btn-submit {
            background: var(--accent);
            color: white;
            padding: 12px 35px;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            font-size: 1rem;
            cursor: pointer;
            transition: background 0.3s;
        }

        .btn-submit:hover {
            background: #219150;
        }

        .btn-back {
            color: var(--text-gray);
            text-decoration: none;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 8px;
            transition: color 0.3s;
        }

        .btn-back:hover {
            color: var(--primary);
        }
    </style>
</head>

<body>
<div class="container">
    <header>
        <h1>Initialize <span>Policy</span></h1>
        <p class="subtitle">Enter new contract parameters into the system</p>
    </header>

    <form:form action="/policy/save" method="POST" modelAttribute="policy">
        <div class="form-grid">

            <div class="input-group full-width">
                <label>Policy Identification Number</label>
                <form:input path="policyNumber" placeholder="e.g. LS-1001" required="required"/>
            </div>

            <div class="input-group">
                <label>Coverage Amount ($)</label>
                <form:input path="coverageAmount" type="number" step="0.01" placeholder="0.00"/>
            </div>

            <div class="input-group">
                <label>Premium Amount ($)</label>
                <form:input path="premiumAmount" type="number" step="0.01" placeholder="0.00"/>
            </div>

            <div class="input-group">
                <label>Contract Term (Years)</label>
                <form:input path="termYears" type="number" placeholder="e.g. 10"/>
            </div>

            <div class="input-group">
                <label>Current Status</label>
                <form:select path="policyStatus">
                    <form:option value="ACTIVE" label="ACTIVE"/>
                    <form:option value="LAPSED" label="LAPSED"/>
                    <form:option value="MATURED" label="MATURED"/>
                </form:select>
            </div>

            <div class="input-group">
                <label>Effective Start Date</label>
                <form:input path="startDate" type="date"/>
            </div>

            <div class="input-group">
                <label>Expiration Date</label>
                <form:input path="endDate" type="date"/>
            </div>

            <div class="action-bar full-width">
                <a href="/policy/home" class="btn-back">
                    <i class="fas fa-arrow-left"></i> Return to Dashboard
                </a>
                <button type="submit" class="btn-submit">Create Policy</button>
            </div>
        </div>
    </form:form>
</div>
</body>
</html>
