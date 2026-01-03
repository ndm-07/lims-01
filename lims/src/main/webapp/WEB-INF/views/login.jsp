
<%-- Responsiblity of com.example.lims.user.controller.AuthController--%>



<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LifeShield | Secure Login</title>
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
            background: linear-gradient(135deg, var(--primary) 0%, #2c3e50 100%);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }

        .login-container {
            background: var(--white);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.3);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }

        /* --- Logo Styling --- */
        .logo-box {
            margin-bottom: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 10px;
        }

        .logo-text {
            font-size: 1.8rem;
            font-weight: bold;
            color: var(--primary);
            letter-spacing: 1px;
        }

        .fa-stack {
            font-size: 2.5rem;
        }

        /* --- Form Styling --- */
        h2 {
            color: var(--secondary);
            margin-bottom: 25px;
            font-weight: 600;
            font-size: 1.4rem;
        }

        .form-group {
            text-align: left;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: var(--secondary);
            font-size: 0.9rem;
        }

        input {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        input:focus {
            outline: none;
            border-color: var(--accent);
            box-shadow: 0 0 0 4px rgba(39, 174, 96, 0.1);
        }

        .btn-login {
            background: var(--accent);
            color: white;
            border: none;
            width: 100%;
            padding: 13px;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
            margin-top: 10px;
            box-shadow: 0 4px 15px rgba(39, 174, 96, 0.3);
        }

        .btn-login:hover {
            background: #219150;
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(39, 174, 96, 0.4);
        }

        .register-link {
            margin-top: 25px;
            display: block;
            text-decoration: none;
            color: var(--primary);
            font-size: 0.9rem;
            font-weight: 600;
            transition: 0.2s;
        }

        .register-link:hover {
            color: var(--accent);
        }

        .error-msg {
            background: #fff5f5;
            color: #e53e3e;
            padding: 12px;
            border-radius: 8px;
            border-left: 4px solid #e53e3e;
            margin-bottom: 20px;
            font-size: 0.85rem;
            text-align: left;
        }
    </style>
</head>
<body>

<div class="login-container">
    <div class="logo-box">
        <span class="fa-stack">
            <i class="fas fa-shield-alt fa-stack-2x" style="color: var(--primary);"></i>
            <i class="fas fa-stethoscope fa-stack-1x" style="color: var(--accent); margin-top: 2px;"></i>
        </span>
        <div class="logo-text">LifeShield</div>
    </div>

    <h2>Secure User Login</h2>

    <form action="/auth/submit-login" method="POST">
        <div class="form-group">
            <label><i class="fas fa-envelope"></i> Email Address</label>
            <input type="email" name="email" placeholder="e.g. name@example.com" required>
        </div>

        <div class="form-group">
            <label><i class="fas fa-lock"></i> Password</label>
            <input type="password" name="password" placeholder="Enter the password" required>
        </div>

        <button type="submit" class="btn-login">Login to Dashboard</button>

        <a href="/auth/register" class="register-link">
            New to LifeShield? Create an Account
        </a>
    </form>
</div>

</body>
</html>
