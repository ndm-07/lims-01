<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>LifeShield | Home</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
</head>
<style>
    :root {
        --primary: #1a3a5f;
        --secondary: #2c3e50;
        --accent: #27ae60;
        --light: #f4f7f9;
        --white: #ffffff;
        --text-muted: #666;
    }

    body {
        font-family: 'Segoe UI', Roboto, sans-serif;
        margin: 0;
        background-color: var(--light);
        color: var(--secondary);
        line-height: 1.6;
    }

    /* --- Navbar --- */
    nav {
        background: var(--primary);
        padding: 0.8rem 5%;
        display: flex;
        justify-content: space-between;
        align-items: center;
        color: white;
        position: sticky;
        top: 0;
        z-index: 1000;
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    }

    .logo {
        font-size: 1.5rem;
        font-weight: bold;
        letter-spacing: 1px;
        display: flex;
        align-items: center;
        white-space: nowrap;
    }

    .nav-links {
        display: flex;
        align-items: center;
        gap: 25px;
    }

    .nav-links a {
        color: white;
        text-decoration: none;
        font-size: 0.9rem;
        display: flex;
        align-items: center;
        gap: 8px;
        transition: 0.3s;
    }

    .nav-links a:hover {
        color: var(--accent);
    }

    .btn-login {
        background: var(--accent);
        color: white;
        border: none;
        padding: 8px 22px;
        border-radius: 5px;
        cursor: pointer;
        font-weight: bold;
        transition: 0.3s;
    }

    .btn-login:hover {
        background: #219150;
        transform: translateY(-10px);
    }

    /* --- Hero Section --- */
    .hero {
        background: linear-gradient(
                rgba(26, 58, 95, 0.85),
                rgba(26, 58, 95, 0.85)
        ), url('https://images.unsplash.com/photo-1450101499163-c8848c66ca85?auto=format&fit=crop&w=1350&q=80');
        background-size: cover;
        background-position: center;
        height: 450px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        color: white;
        text-align: center;
        padding: 0 20px;
    }

    .hero h1 {
        font-size: 3.2rem;
        margin-bottom: 15px;
        font-weight: 700;
    }

    .hero p {
        font-size: 1.25rem;
        max-width: 700px;
        opacity: 0.9;
        font-weight: 300;
    }

    /* --- Dashboard Grid --- */
    .container {
        max-width: 1100px;
        margin: -60px auto 60px;
        padding: 0 20px;
    }

    .grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
        gap: 25px;
    }

    .card {
        background: var(--white);
        padding: 35px 25px;
        border-radius: 15px;
        text-align: center;
        box-shadow: 0 10px 30px rgba(0,0,0,0.08);
        transition: 0.3s ease;
        text-decoration: none;
        color: inherit;
        display: block;
    }

    .card:hover {
        transform: translateY(-10px);
        box-shadow: 0 15px 35px rgba(0,0,0,0.12);
    }

    .card i {
        font-size: 2.8rem;
        color: var(--primary);
        margin-bottom: 20px;
    }

    .card h3 {
        margin: 10px 0;
        color: var(--primary);
        font-size: 1.3rem;
    }

    .card p {
        font-size: 0.95rem;
        color: var(--text-muted);
    }

    /* --- Features Section --- */
    .features {
        max-width: 1000px;
        margin: 80px auto;
        text-align: center;
        padding: 0 20px;
    }

    .features h2 {
        color: var(--primary);
        margin-bottom: 40px;
        font-size: 2.2rem;
    }

    .feature-grid {
        display: flex;
        justify-content: space-around;
        flex-wrap: wrap;
        gap: 30px;
    }

    .feature-item {
        flex: 1;
        min-width: 200px;
    }

    .feature-item i {
        color: var(--accent);
        font-size: 2rem;
        margin-bottom: 15px;
    }

    .feature-item p {
        font-weight: bold;
        color: var(--secondary);
        margin-top: 10px;
    }

    /* --- Footer --- */
    footer {
        background: var(--secondary);
        color: rgba(255,255,255,0.7);
        text-align: center;
        padding: 3rem 1rem;
        font-size: 0.9rem;
    }
</style>

<body>

<nav>
    <div class="logo">LifeShield</div>
    <div class="nav-links">
        <a href="/support"><i class="fas fa-headset"></i> Support</a>

        <c:choose>
            <c:when test="${empty sessionScope.user}">
                <a href="/auth/register">Register</a>
                <a href="/auth/login"><button class="btn-login">Login</button></a>
            </c:when>
            <c:otherwise>
                <a href="/profile"><i class="fas fa-user-circle"></i> Hi, ${sessionScope.user.username}</a>
                <a href="/auth/logout" style="color:#ff4d4d;">Logout</a>
            </c:otherwise>
        </c:choose>
    </div>
</nav>

<header class="hero">
    <h1>Protection for Your Loved Ones</h1>
    <p>Manage your life insurance policies, track claims, and secure your family's financial future.</p>
</header>

<main class="container">
    <div class="grid">
        <a href="<c:choose><c:when test='${not empty sessionScope.user}'>/policy/home</c:when><c:otherwise>/auth/login</c:otherwise></c:choose>" class="card">
            <i class="fas fa-file-contract"></i>
            <h3>Policy Management</h3>
            <p>View and manage your active policies.</p>
        </a>
        <a href="<c:choose><c:when test='${not empty sessionScope.user}'>/beneficiary/home</c:when><c:otherwise>/auth/login</c:otherwise></c:choose>" class="card">
            <i class="fas fa-users"></i>
            <h3>Beneficiaries</h3>
            <p>Update policy nominees.</p>
        </a>
        <a href="<c:choose><c:when test='${not empty sessionScope.user}'>/claims/home</c:when><c:otherwise>/auth/login</c:otherwise></c:choose>" class="card">
            <i class="fas fa-hand-holding-heart"></i>
            <h3>Claims Center</h3>
            <p>Track your settlement status.</p>
        </a>
        <a href="<c:choose><c:when test='${not empty sessionScope.user}'>/payment/home</c:when><c:otherwise>/auth/login</c:otherwise></c:choose>" class="card">
            <i class="fas fa-credit-card"></i>
            <h3>Payments</h3>
            <p>Pay premiums securely online.</p>
        </a>
    </div>
</main>

<footer>
    <p>&copy; 2025 LifeShield Insurance Management System</p>
</footer>
</body>
</html>
