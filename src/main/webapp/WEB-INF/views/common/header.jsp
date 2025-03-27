<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Document</title>
    <link rel="stylesheet" href="/css/header.css" >

    <!-- JavaScript -->
    <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


</head>
<body>
<header class="header">
    <div class="breadcrumb">
        <span class="breadcrumb-icon"></span>
        <div>
        <p class="breadcrumb-text">커뮤니티</p>
        <p class="page-title">공지사항</p>
        </div>
    </div>

    <div class="user-info">
        <img class="profile-img" src="https://placehold.co/70x70" alt="프로필">
        <div class="welcome-msg">
            <span>환영합니다.</span>
            <strong>KH학생</strong>님
        </div>
        <div class="dropdown-arrow"></div>
    </div>
</header>
<hr>
<div class="sidebar-container">
    <div class="sidebar">
        <img class="sidebar-logo" src="/icons/logo.png" alt="로고">

        <div class="menu-group">
            <div class="menu-item" onclick="toggleSubmenu('dashboard-submenu')">
                <img src="/icons/home.png" alt="대시보드 아이콘">
                <div class="menu-title"><a href="header.jsp">대시보드</a></div>
            </div>
            <div id="dashboard-submenu" class="submenu-container"></div>

            <div class="menu-item" onclick="toggleSubmenu('mypage-submenu')">
                <img src="/icons/user_box.png" alt="마이페이지 아이콘">
                <div class="menu-title">마이페이지</div>
                <img src="/icons/expand_left.png" style="width: 24px; height: 24px;">
            </div>
            <div id="mypage-submenu" class="submenu-container">
                <div class="submenu-item active">
                    <div class="submenu-text">개인정보 수정</div>
                </div>
                <div class="submenu-item">
                    <div class="submenu-text">수료증 발급</div>
                </div>
            </div>

            <div class="menu-item" onclick="toggleSubmenu('attendance-submenu')">
                <img src="/icons/calendar.png" alt="출석관리 아이콘">
                <div class="menu-title">출석 관리</div>
                <img src="/icons/expand_left.png" style="width: 24px; height: 24px;">
            </div>
            <div id="attendance-submenu" class="submenu-container">
                <div class="submenu-item">
                    <div class="submenu-text">출석률 조회</div>
                </div>
                <div class="submenu-item">
                    <div class="submenu-text">휴가 관리</div>
                </div>
                <div class="submenu-item">
                    <div class="submenu-text">급여 조회</div>
                </div>
            </div>

            <div class="menu-item" onclick="toggleSubmenu('resume-submenu')">
                <img src="/icons/file.png" alt="자소서 아이콘">
                <div class="menu-title">자소서 및 이력서</div>
                <img src="/icons/expand_left.png" style="width: 24px; height: 24px;">
            </div>
            <div id="resume-submenu" class="submenu-container">
                <div class="submenu-item">
                    <div class="submenu-text">자소서 및 이력서 관리</div>
                </div>
                <div class="submenu-item">
                    <div class="submenu-text">자소서 및 이력서 작성</div>
                </div>
            </div>

            <div class="menu-item" onclick="toggleSubmenu('community-submenu')">
                <img src="/icons/group.png" alt="커뮤니티 아이콘">
                <div class="menu-title">커뮤니티</div>
                <img src="/icons/expand_left.png" style="width: 24px; height: 24px;">
            </div>
            <div id="community-submenu" class="submenu-container">
                <div class="submenu-item">
                    <div class="submenu-text"><a href="board.bo">공지사항</a></div>
                </div>
                <div class="submenu-item">
                    <div class="submenu-text">우리반 게시판</div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function toggleSubmenu(id) {
        document.querySelectorAll('.submenu-container').forEach(menu => {
            if (menu.id !== id) {
                menu.classList.remove('open');
            }
        });

        const submenu = document.getElementById(id);
        submenu.classList.toggle('open');
    }
</script>
<script>
    // 페이지마다 다른 제목을 설정할 수 있게 해주는 JavaScript
    window.onload = function() {
        let pageHeader = document.getElementById('header').querySelector('h1');

        if (window.location.pathname === '/home') {
            pageHeader.textContent = '홈 페이지';
        } else if (window.location.pathname === '/about') {
            pageHeader.textContent = '소개 페이지';
        } else {
            pageHeader.textContent = '기본 제목';
        }
    }
</script>
</body>
</html>
