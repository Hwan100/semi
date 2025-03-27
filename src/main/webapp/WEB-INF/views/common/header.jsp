<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Document</title>
    <%--    <link rel="stylesheet" href="globals.css"/>--%>
    <%--    <link rel="stylesheet" href="styleguide.css"/>--%>
    <link rel="stylesheet" href="style.css"/>

    <!-- JavaScript -->
    <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: 'Inter', sans-serif;
        }

        .sidebar-container {
            width: 270px;
            height: 1080px;
            background: white;
            overflow: hidden;
            border-right: 0.3px solid rgba(0, 0, 0, 0.5);
            position: relative;
        }

        .sidebar {
            width: 100%;
            height: 100%;
            position: absolute;
            display: flex;
            flex-direction: column;
            gap: 28px;
        }

        .sidebar-logo {
            width: 100%;
            height: 100px;
        }

        .menu-group {
            padding: 10px;
            display: flex;
            flex-direction: column;
            gap: 11px;
        }

        .menu-item {
            display: flex;
            align-items: center;
            gap: 11px;
            padding: 10px;
        }

        .menu-item img {
            width: 40px;
            height: 40px;
        }

        .menu-title {
            font-size: 20px;
            color: #003252;
            font-weight: 400;
        }

        .submenu-container {
            padding: 0 10px;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .submenu-item {
            height: 50px;
            padding: 10px 40px;
            display: flex;
            align-items: center;
            border-radius: 10px;
        }

        .submenu-item.active {
            background-color: rgba(11, 155, 227, 0.4);
            color: white;
        }

        .submenu-text {
            font-size: 16px;
            font-weight: 400;
        }
    </style>
</head>
<body>
<div class="sidebar-container">
    <div class="sidebar">
        <img class="sidebar-logo" src="resources/icons/logo.png" alt="로고">

        <div class="menu-group">
            <div class="menu-item">
                <img src="resources/icons/home.png" alt="대시보드 아이콘">
                <div class="menu-title">대시보드</div>
            </div>

            <div class="menu-item">
                <img src="resources/icons/user_box.png" alt="마이페이지 아이콘">
                <div class="menu-title">마이페이지</div>
            </div>
            <div class="submenu-container">
                <div class="submenu-item active">
                    <div class="submenu-text">개인정보 수정</div>
                </div>
                <div class="submenu-item">
                    <div class="submenu-text">수료증 발급</div>
                </div>
            </div>

            <div class="menu-item">
                <img src="resources/icons/calendar.png" alt="출석관리 아이콘">
                <div class="menu-title">출석 관리</div>
            </div>
            <div class="submenu-container">
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

            <div class="menu-item">
                <img src="resources/icons/file.png" alt="자소서 아이콘">
                <div class="menu-title">자소서 및 이력서</div>
            </div>
            <div class="submenu-container">
                <div class="submenu-item">
                    <div class="submenu-text">자소서 및 이력서 관리</div>
                </div>
                <div class="submenu-item">
                    <div class="submenu-text">자소서 및 이력서 작성</div>
                </div>
            </div>

            <div class="menu-item">
                <img src="resources/icons/group.png" alt="커뮤니티 아이콘">
                <div class="menu-title">커뮤니티</div>
            </div>
            <div class="submenu-container">
                <div class="submenu-item">
                    <div class="submenu-text">공지사항</div>
                </div>
                <div class="submenu-item">
                    <div class="submenu-text">우리반 게시판</div>
                </div>
            </div>

        </div>
    </div>
</div>
</body>
</html>
