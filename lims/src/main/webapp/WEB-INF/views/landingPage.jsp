<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>LifeShield | Welcome</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary: #1a3a5f;
            --accent: #27ae60;
            --light: #f4f7f9;
            --white: #ffffff;
            --secondary: #2c3e50;
        }

        body {
            font-family: 'Segoe UI', Roboto, sans-serif;
            margin: 0;
            background-color: var(--light);
            color: var(--secondary);
            line-height: 1.6;
        }

        nav {
            background: var(--primary);
            padding: 1rem 5%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: white;
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .logo {
            font-size: 1.5rem;
            font-weight: bold;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            margin-left: 20px;
            font-weight: 600;
        }

        .btn-login {
            background: var(--accent);
            padding: 8px 20px;
            border-radius: 5px;
            color: white;
            text-decoration: none;
        }

        .hero {
            height: 100vh;
            background: linear-gradient(rgba(26, 58, 95, 0.8), rgba(26, 58, 95, 0.8)),
            url('https://images.unsplash.com/photo-1450101499163-c8848c66ca85?auto=format&fit=crop&w=1350&q=80');
            background-size: cover;
            background-position: center;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            color: white;
            text-align: center;
            padding: 0 20px;
        }

        .hero h1 {
            font-size: 3rem;
            margin-bottom: 20px;
        }

        .hero p {
            font-size: 1.2rem;
            max-width: 600px;
            margin-bottom: 40px;
        }

        .btn-get-started {
            background: var(--accent);
            color: white;
            padding: 15px 30px;
            font-size: 1.1rem;
            border-radius: 50px;
            text-decoration: none;
            font-weight: 600;
            box-shadow: 0 6px 15px rgba(0,0,0,0.2);
            transition: all 0.3s ease;
        }

        .btn-get-started:hover {
            background: #219150;
            transform: translateY(-3px);
        }

        footer {
            background: var(--secondary);
            color: rgba(255,255,255,0.8);
            text-align: center;
            padding: 2rem 1rem;
            position: relative;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>

<nav>
    <div class="logo">LifeShield</div>
    <div class="nav-links">
        <a href="/auth/register">Register</a>
        <a href="/auth/login" class="btn-login">Login</a>
    </div>
</nav>

<header class="hero">
    <h1>Welcome to LifeShield</h1>
    <p>Secure your future and protect your loved ones. Get started with managing your policies, submitting claims, and keeping your family safe financially.</p>


</header>

<footer>
    <p>&copy; 2026 LifeShield Insurance Management System</p>
</footer>

</body>
</html>
