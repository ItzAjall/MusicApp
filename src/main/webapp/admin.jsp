<%@ page import="com.daniyal.finalapp.model.Users" %>
<%@ page import="com.daniyal.finalapp.dao.SingerDAO" %>
<%@ page import="com.daniyal.finalapp.model.Singer" %>
<%@ page import="com.daniyal.finalapp.dao.GenreDAO" %>
<%@ page import="com.daniyal.finalapp.model.Genre" %>
<%@ page import="com.daniyal.finalapp.model.Album" %>
<%@ page import="com.daniyal.finalapp.dao.VoteDAO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:include page="header.jsp"/>
<%
    Users user = (Users) session.getAttribute("user");
    SingerDAO singerDAO = new SingerDAO();
    GenreDAO genreDAO = new GenreDAO();
    VoteDAO voteDAO = new VoteDAO();
    if (user == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    if (!user.isAdmin()) {
        response.sendRedirect("member.jsp");
        return;
    }
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
            <br><br>
            <div class="card-header"><h3 style="color: var(--accent);">۲. تعریف سبک آهنگ</h3></div>
            <form method="POST" action="add_genre">
                <div class="form-group"><label>نام</label><input type="text" required name="name"></div>
                <button type="submit" class="btn btn-primary">ثبت سبک</button>
            </form>
        </div>

        <div class="card glass">
            <div class="card-header"><h3 style="color: var(--accent);">۳. اطلاعات آلبوم</h3></div>
            <form method="post" action="add_album" enctype="multipart/form-data">
                <div class="form-group">
                    <label>خواننده</label>
                    <select required name="singerId">
                        <option hidden>انتخاب...</option>
                        <%
                        for (Singer singer : singerDAO.findAll()){
                        %>
                        <option value="<%=singer.getId()%>"><%=singer.getFirstName()%> <%=singer.getLastName()%></option>
                        <%}%>
                    </select>
                </div>
                <div class="form-group"><label>نام آلبوم</label><input type="text" required name="albumName"></div>
                <div class="row">
                    <div class="col form-group"><label>تاریخ انتشار</label><input type="date" required name="releaseDate"></div>
                    <div class="col form-group"><label>قیمت (تومان)</label><input type="number" required name="albumPrice"></div>
                </div>
                <div class="row">
                    <div class="col form-group">
                        <label>سبک</label>
                        <select required name="genreId">
                            <option hidden>انتخاب...</option>
                            <%
                                for (Genre genre : genreDAO.findAll()){
                            %>
                            <option value="<%=genre.getId()%>"><%=genre.getGenreName()%> </option>
                            <%}%>
                        </select>
                    </div>
                    <div class="col form-group"><label>آهنگ نمونه</label><input type="file" name="music" accept="audio/*"></div>
                </div>
                <button type="submit" class="btn btn-primary">ثبت آلبوم</button>
            </form>
        </div>
    </div>

    <div class="card glass" style="margin-top: 24px;">

        <div class="segmented-control">
            <div class="segment active" id="seg-1" onclick="switchTab('tab-bestselling', this)">پر فروش‌ترین در ماه</div>
            <div class="segment" id="seg-2" onclick="switchTab('tab-topvoted', this)">ترین‌ها بر اساس رای</div>
            <div class="segment" id="seg-3" onclick="switchTab('tab-singers_name', this)">لیست خواننده ها</div>
        </div>

        <div id="tab-bestselling" class="tab-content active">
            <div class="col form-group">
                <form method="get" action="get_bestsellers">
                <label>انتخواب تاریخ</label><input type="date" required name="date">
                    <br><br>
                    <button type="submit" class="btn btn-primary">جست و جو</button>
                </form>

            </div>
            <table>
                <thead><tr><th>سبک</th><th>نام آلبوم</th><th>تعداد فروش</th></tr></thead>
                <%
                    List<Object[]> bestSeller = (List<Object[]>) session.getAttribute("bestSeller");

                    if (bestSeller != null) {
                        for (Object[] row : bestSeller) {
                            Album album = (Album) row[0];
                            Long sells = (Long) row[1];
                %>
                <tr><td><%=album.getGenre().getGenreName()%></td><td><%=album.getAlbumName()%></td><td><%=sells%></td></tr>
                <%}
                        session.removeAttribute("bestSeller");
                    }
                %>
            </table>
        </div>

        <div id="tab-topvoted" class="tab-content">
            <table>
                <thead><tr><th>سبک</th><th>نام آلبوم</th><th>خواننده</th><th>آرای کسب شده</th></tr></thead>
                <%
                    List<Object[]> result = voteDAO.getTopAlbumByVote();
                    for (Object[] row : result) {
                        Album album = (Album) row[0];
                        Long votes = (Long) row[1];
                %>
                <tr><td><%=album.getGenre().getGenreName()%></td><td><%=album.getAlbumName()%></td><td><%=album.getSinger().getFirstName()%> <%=album.getSinger().getLastName()%></td><td><%=votes%></td></tr>
                <%}%>
            </table>
        </div>

        <div id="tab-singers_name" class="tab-content">
            <table>
                <thead><tr><th>نام</th><th>نام خانوادگی</th><th>نام مستعار</th></tr></thead>
                <%for (Singer singer : singerDAO.findAll()) {
                %>
                <tr><td><%=singer.getFirstName()%></td><td><%=singer.getLastName()%></td><td><%=singer.getNickName()%></td></tr>
                <%}%>
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
</script>
<%@ include file="footer.jsp" %>