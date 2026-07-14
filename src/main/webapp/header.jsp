<%@ page import="com.daniyal.finalapp.model.Users" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    Users user = (Users) session.getAttribute("user");

    String homePage = "index.jsp";

    if (user != null) {

        if (user.isAdmin()) {
            homePage = "admin.jsp";
        } else {
            homePage = "member.jsp";
        }
    }

    String contextPath = request.getContextPath();
%>

<!DOCTYPE html>
<html lang="fa" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>موزیک استور</title>
    <link rel="stylesheet" href="<%=contextPath%>/css/style.css">
</head>

<body>

<div class="navbar-container">
    <nav class="navbar glass">

        <a href="<%=contextPath%>/<%=homePage%>" class="navbar-brand">
            <div class="mac-dots">
                <span class="dot red"></span>
                <span class="dot yellow"></span>
                <span class="dot green"></span>
            </div>

            موزیک استور
        </a>


        <% if (user == null) { %>

        <div class="nav-actions">
            <button class="btn" onclick="openLoginModal()">ورود</button>

            <a href="<%=contextPath%>/signup.jsp" class="btn btn-primary">
                ثبت‌نام
            </a>
        </div>


        <% } else { %>

        <div class="nav-actions">
            <a href="<%=contextPath%>/<%=homePage%>" class="btn">
                <%=user.getFirstName()%> <%=user.getLastName()%>
            </a>
        </div>

        <% } %>


    </nav>
</div>


<script>
    function openLoginModal() {
        const modal = document.getElementById('authModal');

        if (modal) {
            modal.classList.add('active');
        } else {
            window.location.href = '<%=contextPath%>/index.jsp';
        }
    }
</script>