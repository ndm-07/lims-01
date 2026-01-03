<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>LifeShield | Claim Status Details</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        /* SAME CSS AS HTML VERSION */
        :root {
            --primary: #1a3a5f;
            --accent: #27ae60;
            --light: #f4f7f9;
            --border: #e1e8ed;
            --text-muted: #7f8c8d;
            --danger: #e74c3c;
            --warning: #f39c12;
        }
        body { font-family: 'Segoe UI', sans-serif; background: var(--light); margin:0; padding:40px 5%; }
        .container { max-width: 900px; margin: 0 auto; background:white; border-radius:12px; box-shadow:0 10px 30px rgba(0,0,0,0.1); overflow:hidden; }
        .header { background: var(--primary); color:white; padding:30px; display:flex; justify-content:space-between; align-items:center; }
        .content { padding:40px; }
        .stepper { display:flex; justify-content:space-between; margin-bottom:60px; position:relative; }
        .stepper::before { content:""; position:absolute; top:22px; left:16.6%; width:66.6%; height:3px; background:#e0e6ed; z-index:1; }
        .progress-bar-fill { position:absolute; top:22px; left:16.6%; height:3px; background:var(--accent); z-index:1; transition: width 0.8s ease; }
        .step { z-index:2; text-align:center; width:33.33%; position:relative; }
        .step-icon { width:45px; height:45px; border-radius:50%; background:white; border:3px solid #e0e6ed; display:flex; align-items:center; justify-content:center; margin:0 auto 12px; transition:all 0.4s ease; color:#b0bec5; font-size:1.2rem; }
        .step.completed .step-icon { background:var(--accent); color:white; border-color:var(--accent); }
        .step.active .step-icon { border-color:var(--warning); color:var(--warning); background:#fff8e1; animation:pulse 2s infinite; }
        .step.rejected .step-icon { background:var(--danger); color:white; border-color:var(--danger); }
        .step-label { font-size:0.85rem; font-weight:700; color:var(--text-muted); text-transform:uppercase; }
        .step.completed .step-label, .step.active .step-label { color:var(--primary); }
        .step.rejected .step-label { color:var(--danger); }
        .details-card { background:#fcfdfe; border:1px solid var(--border); border-radius:10px; padding:30px; }
        .details-grid { display:grid; grid-template-columns:1fr 1fr; gap:25px; }
        .detail-item label { display:block; font-size:0.7rem; color:var(--text-muted); text-transform:uppercase; font-weight:800; margin-bottom:6px; }
        .detail-item span { font-size:1.1rem; color:var(--primary); font-weight:600; }
        .status-text { display:inline-flex; align-items:center; gap:8px; padding:5px 12px; border-radius:20px; font-size:0.9rem; font-weight:700; }
        .btn-back { background: rgba(255,255,255,0.1); border:1px solid rgba(255,255,255,0.4); color:white; padding:10px 20px; border-radius:6px; text-decoration:none; font-weight:600; font-size:0.9rem; }
        .btn-back:hover { background:white; color:var(--primary); }
        @keyframes pulse { 0% {transform:scale(1);} 50% {transform:scale(1.05);} 100% {transform:scale(1);} }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <div>
            <h2 style="margin:0;"><i class="fas fa-shield-alt"></i> Claim #${claim.claimId}</h2>
            <p style="margin:5px 0 0 0; opacity:0.8;">LifeShield Insurance Management System</p>
        </div>
        <a href="/claims/home" class="btn-back"><i class="fas fa-arrow-left"></i> Return to Claims</a>
    </div>

    <div class="content">
        <div class="stepper">
            <div class="progress-bar-fill"
                 style="<c:choose>
                 <c:when test='${claim.claimStatus == "OPEN"}'>width:33.33%;</c:when>
                 <c:when test='${claim.claimStatus == "APPROVED"}'>width:100%;</c:when>
                 <c:otherwise>width:66.66%;</c:otherwise>
                         </c:choose>">
            </div>

            <!-- Stepper Icons -->
            <div class="step completed">
                <div class="step-icon"><i class="fas fa-file-alt"></i></div>
                <div class="step-label">Submitted</div>
            </div>
            <div class="<c:choose>
                           <c:when test='${claim.claimStatus == "OPEN"}'>step active</c:when>
                           <c:otherwise>step completed</c:otherwise>
                        </c:choose>">
                <div class="step-icon"><i class="fas fa-search"></i></div>
                <div class="step-label">Under Review</div>
            </div>
            <div class="<c:choose>
                           <c:when test='${claim.claimStatus == "APPROVED"}'>step completed</c:when>
                           <c:when test='${claim.claimStatus == "REJECTED"}'>step rejected</c:when>
                           <c:otherwise>step</c:otherwise>
                        </c:choose>">
                <div class="step-icon">
                    <i class="<c:choose>
                                <c:when test='${claim.claimStatus == "REJECTED"}'>fas fa-times-circle</c:when>
                                <c:otherwise>fas fa-check-circle</c:otherwise>
                             </c:choose>"></i>
                </div>
                <div class="step-label">
                    <c:choose>
                        <c:when test='${claim.claimStatus == "REJECTED"}'>Rejected</c:when>
                        <c:otherwise>Finalized</c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>

        <div class="details-card">
            <div class="details-grid">
                <div class="detail-item">
                    <label>Policy Reference</label>
                    <span>POL-${claim.policyId}</span>
                </div>
                <div class="detail-item">
                    <label>Requested Settlement</label>
                    <span>$${claim.claimAmount}</span>
                </div>
                <div class="detail-item">
                    <label>Filing Date</label>
                    <span>${claim.claimDate}</span>
                </div>
                <div class="detail-item">
                    <label>Assigned Adjuster</label>
                    <span>
                        <c:choose>
                            <c:when test="${claim.adjusterId != null}">EMP-${claim.adjusterId}</c:when>
                            <c:otherwise>Awaiting Assignment</c:otherwise>
                        </c:choose>
                    </span>
                </div>
                <div class="detail-item" style="grid-column: span 2;">
                    <label>Official Processing Status</label>
                    <div class="status-text"
                         style="<c:choose>
                         <c:when test='${claim.claimStatus == "APPROVED"}'>background:#e8f5e9;color:#27ae60;</c:when>
                         <c:when test='${claim.claimStatus == "REJECTED"}'>background:#ffebee;color:#e74c3c;</c:when>
                         <c:otherwise>background:#fff3e0;color:#f39c12;</c:otherwise>
                                 </c:choose>">
                        <i class="<c:choose>
                                    <c:when test='${claim.claimStatus == "APPROVED"}'>fas fa-check-circle</c:when>
                                    <c:when test='${claim.claimStatus == "REJECTED"}'>fas fa-times-circle</c:when>
                                    <c:otherwise>fas fa-clock</c:otherwise>
                                 </c:choose>"></i>
                        <span>${claim.claimStatus}</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
