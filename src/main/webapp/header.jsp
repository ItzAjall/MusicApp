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
            <!-- دکمه ورود که حالا از حالت کامنت خارج شده و نمایش داده می‌شود -->
            <button class="btn btn-primary" onclick="document.getElementById('authModal').classList.add('active')">ورود / ثبت‌نام</button>
        </div>
    </nav>
</div>