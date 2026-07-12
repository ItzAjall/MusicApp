<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fa" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>موزیک استور | پنل مدیریت</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="navbar-container">
    <nav class="navbar glass">
        <a href="index.jsp" class="navbar-brand">
            <div class="mac-dots"><span class="dot red"></span><span class="dot yellow"></span><span class="dot green"></span></div>
            موزیک استور
        </a>
        <div class="nav-actions">
            <!-- Unified Admin Profile Button -->
            <div class="user-pill" style="border-color: var(--danger);">
                <div class="avatar" style="background: var(--danger);">A</div>
                <span>مدیر سایت</span>
            </div>
            <a href="index.jsp" class="btn" style="color: var(--danger); border-color: rgba(255,69,58,0.3);">خروج</a>
        </div>
    </nav>
</div>

<div class="container">
    <h2 style="margin-bottom: 32px;">داشبورد مدیریت سیستم</h2>

    <div class="grid">
        <!-- Add Singer Form -->
        <div class="card glass">
            <div class="card-header"><h3 style="color: var(--accent);">۱. تعریف خواننده</h3></div>
            <form onsubmit="alert('خواننده ذخیره شد'); return false;">
                <div class="form-group"><label>نام</label><input type="text" required></div>
                <div class="form-group"><label>نام خانوادگی</label><input type="text" required></div>
                <div class="form-group"><label>نام مستعار (یکتا)</label><input type="text" required></div>
                <button type="submit" class="btn btn-primary">ثبت خواننده</button>
            </form>
        </div>

        <!-- Add Album Form -->
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

    <!-- Reports -->
    <div class="card glass" style="margin-top: 24px;">
        <div class="card-header flex-between">
            <h3>گزارشات سیستم</h3>
            <button class="btn" onclick="fetchReports()">بروزرسانی جدول ↻</button>
        </div>

        <div class="segmented-control">
            <div class="segment active" id="seg-1" onclick="switchTab('tab-bestselling', this)">پر فروش‌ترین در ماه</div>
            <div class="segment" id="seg-2" onclick="switchTab('tab-topvoted', this)">Top ترین‌ها بر اساس رای</div>
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
    </div>
</div>

<script>
    function switchTab(tabId, element) {
        document.querySelectorAll('.segment').forEach(t => t.classList.remove('active'));
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
</body>
</html>