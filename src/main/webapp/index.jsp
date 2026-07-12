<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fa" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>موزیک استور | خانه</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="navbar-container">
    <nav class="navbar glass">
        <a href="index.jsp" class="navbar-brand">
            <div class="mac-dots">
                <span class="dot red"></span><span class="dot yellow"></span><span class="dot green"></span>
            </div>
            موزیک استور
        </a>
        <div class="nav-actions">
            <button class="btn btn-primary" onclick="document.getElementById('authModal').classList.add('active')">ورود / ثبت‌نام</button>
        </div>
    </nav>
</div>

<div class="container">
    <h2 style="margin-bottom: 8px;">ویترین آلبوم‌ها</h2>
    <p class="text-muted" style="margin-bottom: 32px;">گوش دادن به نمونه آهنگ‌ها و مشاهده آلبوم‌های موجود</p>

    <div class="grid">
        <!-- در Java EE این بخش با JSTL حلقه زده می‌شود -->
        <div class="card glass">
            <h3 style="margin-bottom: 4px;">بی نام</h3>
            <div class="text-muted" style="font-size: 0.85rem; margin-bottom: 12px;">محسن چاوشی • سبک پاپ</div>
            <audio controls><source src="#" type="audio/mpeg"></audio>
            <div style="margin-top: 16px; font-weight: bold; font-size: 1.1rem; color: var(--accent);">۶۵,۰۰۰ تومان</div>
        </div>

        <div class="card glass">
            <h3 style="margin-bottom: 4px;">رگ خواب</h3>
            <div class="text-muted" style="font-size: 0.85rem; margin-bottom: 12px;">همایون شجریان • سبک سنتی</div>
            <audio controls><source src="#" type="audio/mpeg"></audio>
            <div style="margin-top: 16px; font-weight: bold; font-size: 1.1rem; color: var(--accent);">۸۰,۰۰۰ تومان</div>
        </div>
    </div>
</div>

<!-- Login Modal -->
<div class="modal-overlay" id="authModal">
    <div class="modal-content glass">
        <div class="flex-between" style="margin-bottom: 20px;">
            <h3 style="margin: 0;">ورود به سیستم</h3>
            <button class="btn" onclick="document.getElementById('authModal').classList.remove('active')" style="padding: 4px 10px; border-radius: 50%;">✕</button>
        </div>
        <p class="text-muted" style="font-size: 0.8rem; margin-bottom: 16px;">برای تست: نام <b>admin</b> برای مدیر، و نام‌های دیگر برای کاربر عضو.</p>

        <form onsubmit="handleLogin(event)">
            <div class="form-group"><label>نام کاربری</label><input type="text" id="loginUsername" required></div>
            <div class="form-group"><label>رمز عبور</label><input type="password" required></div>
            <button type="submit" class="btn btn-primary" style="width: 100%; margin-top: 10px;">ورود</button>
        </form>
    </div>
</div>

<script>
    function handleLogin(e) {
        e.preventDefault();
        const username = document.getElementById('loginUsername').value.trim();
        // In a real app, form submits to a Servlet. Here we simulate redirection:
        if(username.toLowerCase() === 'admin') {
            window.location.href = 'admin.jsp';
        } else {
            window.location.href = 'member.jsp';
        }
    }
</script>
</body>
</html>