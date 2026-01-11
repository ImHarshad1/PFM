<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<style>
    * {
        box-sizing: border-box;
        font-family: 'Segoe UI', system-ui, -apple-system, BlinkMacSystemFont, sans-serif;
    }

    body {
        margin: 0;
        height: 100vh;
        background: #eef2f7;
    }

    .container {
        display: flex;
        height: 100vh;
    }

    .left-panel {
        flex: 1;
        position: relative;
        overflow: hidden;
        background:
            radial-gradient(circle at top left, rgba(255,255,255,0.15), transparent 40%),
            linear-gradient(135deg, #0d6efd, #003d99);
        color: white;
        display: flex;
        align-items: center;
        padding: 80px;
    }

    .left-content {
        max-width: 520px;
        position: relative;
        z-index: 2;
    }

    .left-content h1 {
        font-size: 44px;
        font-weight: 700;
        letter-spacing: -0.5px;
        margin-bottom: 20px;
    }

    .left-content p {
        font-size: 18px;
        line-height: 1.8;
        opacity: 0.92;
    }

    
    .money-rain {
        position: absolute;
        inset: 0;
        pointer-events: none;
        z-index: 1;
    }

    .note {
        position: absolute;
        top: -80px;
        width: 80px;
        height: 40px;
        border-radius: 8px;
        background: linear-gradient(
            135deg,
            rgba(255,255,255,0.35),
            rgba(255,255,255,0.15)
        );
        box-shadow:
            0 10px 25px rgba(0,0,0,0.15),
            inset 0 0 0 1px rgba(255,255,255,0.3);
        opacity: 0.6;
        animation: floatNote linear infinite;
    }

   
    .note::before {
        content: "$";
        position: absolute;
        inset: 0;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 20px;
        font-weight: 700;
        color: rgba(255,255,255,0.35);
        text-shadow: 0 0 10px rgba(255,255,255,0.25);
    }

    @keyframes floatNote {
        0% {
            transform: translateY(-10%) translateX(0) rotate(0deg);
            opacity: 0;
        }
        15% {
            opacity: 0.6;
        }
        50% {
            transform: translateY(50vh) translateX(30px) rotate(180deg);
        }
        100% {
            transform: translateY(110vh) translateX(-30px) rotate(360deg);
            opacity: 0;
        }
    }

   
    .note:nth-child(1) { left: 10%; animation-duration: 14s; filter: blur(1px); }
    .note:nth-child(2) { left: 28%; animation-duration: 18s; width: 70px; height: 35px; filter: blur(2px); }
    .note:nth-child(3) { left: 50%; animation-duration: 12s; }
    .note:nth-child(4) { left: 70%; animation-duration: 16s; filter: blur(1.2px); }
    .note:nth-child(5) { left: 85%; animation-duration: 20s; width: 65px; height: 32px; filter: blur(2.5px); }


    .right-panel {
        flex: 1;
        display: flex;
        justify-content: center;
        align-items: center;
        background: #f9fbff;
    }

    .login-container {
        width: 380px;
        padding: 40px;
        border-radius: 18px;
        background: rgba(255, 255, 255, 0.85);
        backdrop-filter: blur(12px);
        box-shadow:
            0 20px 40px rgba(0, 0, 0, 0.12),
            inset 0 1px 0 rgba(255,255,255,0.5);
        animation: slideUp 0.6s ease;
    }

    @keyframes slideUp {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .login-container h2 {
        text-align: center;
        font-size: 26px;
        margin-bottom: 25px;
        color: #222;
    }

    .form-group {
        margin-bottom: 18px;
    }

    .form-group label {
        font-size: 13px;
        font-weight: 600;
        color: #555;
        margin-bottom: 6px;
        display: block;
    }

    .form-group input {
        width: 100%;
        padding: 14px;
        border-radius: 10px;
        border: 1px solid #dcdcdc;
        font-size: 14px;
        transition: 0.25s;
    }

    .form-group input:focus {
        border-color: #0d6efd;
        box-shadow: 0 0 0 3px rgba(13,110,253,0.15);
        outline: none;
    }

    .login-btn {
        width: 100%;
        padding: 14px;
        margin-top: 10px;
        background: linear-gradient(135deg, #0d6efd, #0047cc);
        color: white;
        border: none;
        border-radius: 12px;
        font-size: 16px;
        font-weight: 600;
        cursor: pointer;
        transition: transform 0.2s, box-shadow 0.2s;
    }

    .login-btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 10px 20px rgba(13,110,253,0.35);
    }

    .register-link {
        display: block;
        text-align: center;
        margin-top: 20px;
        font-size: 14px;
        color: #0d6efd;
        text-decoration: none;
    }

    .register-link:hover {
        text-decoration: underline;
    }

    .message {
        text-align: center;
        font-size: 13px;
        margin-bottom: 10px;
    }

   
    @media (max-width: 768px) {
        .container {
            flex-direction: column;
        }

        .left-panel {
            height: 40%;
            padding: 40px;
            text-align: center;
        }

        .money-rain {
            display: none;
        }
    }
</style>

</head>
<body>

<div class="container">

   
    <div class="left-panel">

        <div class="money-rain">
            <div class="note"></div>
            <div class="note"></div>
            <div class="note"></div>
            <div class="note"></div>
            <div class="note"></div>
        </div>

        <div class="left-content">
            <h1>Personal Finance Manager</h1>
			   <p>
			       Track spending, add budgets,  
			       and manage your money efficiently.
			   </p>
        </div>
    </div>

   
    <div class="right-panel">
        <div class="login-container">
            <h2>Login</h2>

            <div class="message" style="color:red">${error}</div>
            <div class="message" style="color:green">${success}</div>

            <form action="login" method="post">
                <div class="form-group">
                    <label>Email ID</label>
                    <input type="email" name="username" placeholder="Enter email" required>
                </div>

                <div class="form-group">
                    <label>Password</label>
                    <input type="password" name="password" placeholder="Enter password" required>
                </div>

                <button type="submit" class="login-btn">Login</button>

                <a href="register" class="register-link">
                    Don't have an account? Register Now
                </a>
            </form>
        </div>
    </div>

</div>

</body>
</html>
