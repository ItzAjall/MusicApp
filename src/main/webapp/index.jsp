<%@ page import="com.daniyal.finalapp.model.Users" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:include page="header.jsp"/>
<%
    Users user = (Users) session.getAttribute("user");
    if (user!=null)
        response.sendRedirect("member.jsp");
%>
<div class="container">
    <h2 style="margin-bottom: 8px;">ویترین آلبوم‌ها</h2>
    <p class="text-muted" style="margin-bottom: 32px;">گوش دادن به نمونه آهنگ‌ها و مشاهده آلبوم‌های موجود</p>

    <div class="grid">


        <div class="card glass">
            <h3 style="margin-bottom: 4px;">sample</h3>
            <div class="text-muted" style="font-size: 0.85rem; margin-bottom: 12px;"> singer name •  music genre </div>
            <audio controls><source src="#" type="audio/mpeg"></audio>
            <div style="margin-top: 16px; font-weight: bold; font-size: 1.1rem; color: var(--accent);">price</div>
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
        <form method="post" action="login">
            <div class="form-group"><label>نام کاربری</label><input type="text" id="loginUsername" required name="username"></div>
            <div class="form-group"><label>رمز عبور</label><input type="password" required name="password"></div>
            <button type="submit" class="btn btn-primary" style="width: 100%; margin-top: 10px;">ورود</button>
        </form>
    </div>
</div>

<script>
    function handleLogin(e) {
        e.preventDefault();
        const username = document.getElementById('loginUsername').value.trim();
        // تغییر مسیرها به فایل‌های jsp
        if(username.toLowerCase() === 'admin') {
            window.location.href = 'admin.jsp';
        } else {
            window.location.href = 'member.jsp';
        }
    }
</script>

<%@ include file="footer.jsp" %>