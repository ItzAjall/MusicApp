<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fa" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>موزیک استور</title>
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
            <!-- دکمه ورود (باز کردن مُدال در صورت وجود در صفحه) -->
            <button class="btn" onclick="openLoginModal()">ورود</button>

            <!-- دکمه ثبت‌نام (رفتن به صفحه جدید) -->
            <a href="signup.jsp" class="btn btn-primary">ثبت‌نام</a>
        </div>
    </nav>
</div>

<script>
    // تابعی برای باز کردن مُدال ورود که از خطای جاوا اسکریپت در صفحاتی که مُدال ندارند جلوگیری می‌کند
    function openLoginModal() {
        const modal = document.getElementById('authModal');
        if(modal) {
            modal.classList.add('active');
        } else {
            // اگر کاربر در صفحه دیگری بود و ورود را زد، او را به صفحه اصلی بفرست تا لاگین کند
            window.location.href = 'index.jsp';
        }
    }
</script>