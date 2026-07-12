<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!-- 1. اضافه کردن هدر سایت -->
<%@ include file="header.jsp" %>

<div class="container" style="max-width: 500px; margin-top: 40px; margin-bottom: 60px;">
    <div class="card glass">
        <h2 style="margin-bottom: 8px; text-align: center;">ثبت‌نام در سیستم</h2>
        <p class="text-muted" style="margin-bottom: 24px; text-align: center;">برای استفاده از امکانات سایت حساب کاربری بسازید.</p>

        <!-- در آینده می‌توانید action این فرم را به Servlet ثبت نام خود متصل کنید -->
        <form method="POST" action="signup">
            <div class="row">
                <div class="col form-group">
                    <label>نام</label>
                    <input type="text" name="firstName" required>
                </div>
                <div class="col form-group">
                    <label>نام خانوادگی</label>
                    <input type="text" name="lastName" required>
                </div>
            </div>

            <div class="form-group">
                <label>نام کاربری</label>
                <input type="text" name="username" required>
            </div>

            <div class="form-group">
                <label>رمز عبور</label>
                <input type="password" name="password" required>
            </div>
            <div class="form-group">
                <label>تکرار رمز عبور</label>
                <input type="password" name="re-password" required>
            </div>

            <button type="submit" class="btn btn-primary" style="width: 100%; margin-top: 16px;">ایجاد حساب کاربری</button>
        </form>

        <div style="text-align: center; margin-top: 20px; font-size: 0.9rem;">
            قبلاً ثبت‌نام کرده‌اید؟ <a href="index.jsp" style="color: var(--accent); font-weight: bold;">بازگشت به صفحه اصلی</a>
        </div>
    </div>
</div>

<!-- 2. اضافه کردن فوتر سایت -->
<%@ include file="footer.jsp" %>