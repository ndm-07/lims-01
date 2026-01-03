<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>LifeShield | Claims Management</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        /* SAME CSS AS ORIGINAL HTML */
        :root {
            --primary: #1a3a5f;
            --accent: #27ae60;
            --light: #f4f7f9;
            --border: #e1e8ed;
            --warning: #f39c12;
            --danger: #e74c3c;
            --text-muted: #666;
        }
        body { font-family: 'Segoe UI', sans-serif; background-color: var(--light); margin: 0; padding: 40px 5%; }
        .container { max-width: 1150px; margin: 0 auto; background: white; border-radius: 12px; box-shadow: 0 10px 25px rgba(0,0,0,0.05); overflow: hidden; }
        .header { background: var(--primary); color: white; padding: 30px; display: flex; justify-content: space-between; align-items: center; }
        .content { padding: 40px; }
        .claim-form-box { background: #f8fafc; border: 1px solid var(--border); border-radius: 10px; padding: 25px; margin-bottom: 40px; }
        .form-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(180px, 1fr)); gap: 20px; align-items: end; }
        .input-group { display: flex; flex-direction: column; gap: 8px; }
        label { font-size: 0.75rem; font-weight: 700; color: var(--primary); text-transform: uppercase; }
        input { padding: 10px; border: 2px solid var(--border); border-radius: 6px; font-size: 0.9rem; transition: 0.2s; }
        input:focus { border-color: var(--accent); outline: none; }
        .btn-submit { background: var(--accent); color: white; border: none; padding: 12px 25px; border-radius: 6px; font-weight: 700; cursor: pointer; transition: 0.3s; }
        .btn-submit:hover { background: #219150; transform: translateY(-1px); }
        table { width: 100%; border-collapse: collapse; }
        th { text-align: left; padding: 15px; background: #f1f5f9; font-size: 0.75rem; text-transform: uppercase; color: var(--primary); }
        td { padding: 15px; border-bottom: 1px solid var(--border); font-size: 0.95rem; }
        .badge { padding: 4px 10px; border-radius: 4px; font-size: 0.75rem; font-weight: 800; }
        .status-OPEN { background: #fff4e5; color: var(--warning); }
        .status-APPROVED { background: #e8f5e9; color: var(--accent); }
        .status-REJECTED { background: #ffebee; color: var(--danger); }
        .adjuster-id-text { color: var(--text-muted); font-size: 0.85rem; font-weight: 600; }
        .unassigned { color: #ccc; font-style: italic; font-size: 0.85rem; }
    </style>
</head>
<body>

<div class="container">
    <div class="header">
        <div>
            <h1 style="margin:0;"><i class="fas fa-file-invoice-dollar"></i> Claims Center</h1>
            <p style="margin:5px 0 0 0; opacity: 0.8;">Request settlement and track processing status</p>
        </div>
        <a href="/auth/homePage" style="color: white; text-decoration: none; font-weight: 600;">
            <i class="fas fa-home"></i> Home
        </a>
    </div>

    <div class="content">
        <div class="claim-form-box">
            <h3 style="margin-top:0; color: var(--primary);"><i class="fas fa-plus-circle" style="color: var(--accent);"></i> File New Claim</h3>
            <form action="/claims/add" method="POST">
                <div class="form-grid">
                    <div class="input-group">
                        <label>Policy ID</label>
                        <input type="number" name="policyId" placeholder="e.g. 1" required>
                    </div>
                    <div class="input-group">
                        <label>Claim Amount ($)</label>
                        <input type="number" step="0.01" name="claimAmount" placeholder="0.00" required>
                    </div>
                    <div class="input-group">
                        <label>Date of Event</label>
                        <input type="date" name="claimDate" required>
                    </div>
                    <div class="input-group">
                        <label>Adjuster ID (Optional)</label>
                        <input type="number" name="adjusterId" placeholder="e.g. 2">
                    </div>
                    <div class="input-group">
                        <button type="submit" class="btn-submit">Submit Claim</button>
                    </div>
                </div>
            </form>
        </div>

        <h3 style="color: var(--primary); margin-bottom: 20px;">Active & Past Claims</h3>
        <table>
            <thead>
            <tr>
                <th>Claim ID</th>
                <th>Policy ID</th>
                <th>Settlement Amount</th>
                <th>Date Filed</th>
                <th>Adjuster</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="c" items="${claims}">
                <tr>
                    <td style="font-weight: 700; color: var(--primary);">#CLM-${c.claimId}</td>
                    <td>${c.policyId}</td>
                    <td>$${c.claimAmount}</td>
                    <td>${c.claimDate}</td>
                    <td>
                        <c:choose>
                            <c:when test="${c.adjusterId != null}">
                                <span class="adjuster-id-text"><i class="fas fa-user-tie"></i> ID: ${c.adjusterId}</span>
                            </c:when>
                            <c:otherwise>
                                <span class="unassigned">Pending Assignment</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td><span class="badge status-${c.claimStatus}">${c.claimStatus}</span></td>
                    <td><a href="/claims/view/${c.claimId}" style="color: var(--primary); text-decoration: none;"><i class="fas fa-search-plus"></i> View</a></td>
                </tr>
            </c:forEach>
            <c:if test="${empty claims}">
                <tr>
                    <td colspan="7" style="text-align:center; padding:40px; color:var(--text-muted);">No claims found in the system.</td>
                </tr>
            </c:if>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
