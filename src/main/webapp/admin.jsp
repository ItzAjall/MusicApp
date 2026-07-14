<%@ page import="com.daniyal.finalapp.model.Users" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:include page="header.jsp"/>
<%
    Users user = (Users) session.getAttribute("user");
    if (user == null)
        response.sendRedirect("index.jsp");
    else if (!user.isAdmin())
        response.sendRedirect("member.jsp");
%>
<div class="container">
    <h2 style="margin-bottom: 32px;">داشبورد مدیریت سیستم</h2>

    <div class="grid">
        <div class="card glass">
            <div class="card-header"><h3 style="color: var(--accent);">۱. تعریف خواننده</h3></div>
            <form method="POST" action="add_singer">
                <div class="form-group"><label>نام</label><input type="text" required name="firstName"></div>
                <div class="form-group"><label>نام خانوادگی</label><input type="text" required name="lastName"></div>
                <div class="form-group"><label>نام مستعار (یکتا)</label><input type="text" required name="nickName"></div>
                <button type="submit" class="btn btn-primary">ثبت خواننده</button>
            </form>
        </div>

        <div class="card glass">
            <div class="card-header"><h3 style="color: var(--accent);">۲. اطلاعات آلبوم</h3></div>
            <form onsubmit="alert('آلبوم ذخیره شد'); return false;">
                <div class="form-group">
                    <label>خواننده</label>
                    <select required><option value="">انتخاب...</option><option value="1">محسن چاوشی</option></select>
                </div>
                <div class="form-group"><label>نام آلبوم</label><input type="text" required></div>
                <div class="row">
                    <div class="col form-group"><label>تاریخ انتشار</label><input type="date" required></div>
                    <div class="col form-group"><label>قیمت (تومان)</label><input type="number" required></div>
                </div>
                <div class="row">
                    <div class="col form-group">
                        <label>سبک</label>
                        <select required><option value="پاپ">پاپ</option><option value="راک">راک</option><option value="سنتی">سنتی</option></select>
                    </div>
                    <div class="col form-group"><label>آهنگ نمونه (URL)</label><input type="text"></div>
                </div>
                <button type="submit" class="btn btn-primary">ثبت آلبوم</button>
            </form>
        </div>
    </div>

    <div class="card glass" style="margin-top: 24px;">
        <div class="card-header flex-between">
            <h3>گزارشات سیستم</h3>
            <button class="btn" onclick="fetchReports()">بروزرسانی جدول ↻</button>
        </div>

        <div class="segmented-control">
            <div class="segment active" id="seg-1" onclick="switchTab('tab-bestselling', this)">پر فروش‌ترین در ماه</div>
            <div class="segment" id="seg-2" onclick="switchTab('tab-topvoted', this)">Top ترین‌ها بر اساس رای</div>
            <div class="segment" id="seg-3" onclick="switchTab('tab-singers_name', this)">لیست خواننده ها</div>
        </div>

        <div id="tab-bestselling" class="tab-content active">
            <table>
                <thead><tr><th>ماه</th><th>سبک</th><th>نام آلبوم</th><th>تعداد فروش</th></tr></thead>
                <tbody id="bestSellingData"><tr><td colspan="4" style="text-align: center;" class="text-muted">روی بروزرسانی کلیک کنید</td></tr></tbody>
            </table>
        </div>

        <div id="tab-topvoted" class="tab-content">
            <table>
                <thead><tr><th>سبک</th><th>نام آلبوم</th><th>خواننده</th><th>آرای کسب شده</th></tr></thead>
                <tbody id="topVotedData"><tr><td colspan="4" style="text-align: center;" class="text-muted">روی بروزرسانی کلیک کنید</td></tr></tbody>
            </table>
        </div>

        <div id="tab-singers_name" class="tab-content">
            <table>
                <thead><tr><th>نام</th><th>نام خانوادگی</th><th>نام مستعار</th></tr></thead>
                <tbody id="singers_name"><tr><td colspan="3" style="text-align: center;" class="text-muted">روی بروزرسانی کلیک کنید</td></tr></tbody>
            </table>
        </div>
    </div>
</div>

<script>
    function switchTab(tabId, element) {
        document.querySelectorAll('.segment').forEach(t => t.classList.remove('active'));
        document.querySelectorAll('.tab-content').forEach(c => c.classList.remove('active'));
        document.querySelectorAll('.tab-content').forEach(c => c.classList.remove('active'));
        element.classList.add('active');
        document.getElementById(tabId).classList.add('active');
    }

    function fetchReports() {
        document.getElementById('bestSellingData').innerHTML = `
                <tr><td>تیر</td><td>پاپ</td><td>بی نام</td><td>۱,۲۴۰</td></tr>
                <tr><td>تیر</td><td>سنتی</td><td>رگ خواب</td><td>۸۹۰</td></tr>`;
        document.getElementById('topVotedData').innerHTML = `
                <tr><td>پاپ</td><td>بی نام</td><td>محسن چاوشی</td><td>۴۵۰</td></tr>
                <tr><td>سنتی</td><td>رگ خواب</td><td>همایون شجریان</td><td>۳۱۰</td></tr>`;
    }
</script>
<%@ include file="footer.jsp" %>