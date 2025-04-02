<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Document</title>
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/component.css">
    <link rel="stylesheet" href="/css/variables.css">


    <!-- JavaScript -->
    <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


</head>
<body>

<header class="header" onload=title()>
    <div class="header-breadcrumb">
<%--        <span class="breadcrumb-icon"></span>--%>
        <div>
            <p class="breadcrumb-text"></p>
            <p class="page-title">대시보드</p>
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
    <hr>
</header>


<div class="sidebar-container">
    <div class="sidebar">
        <a href="/">
            <img class="sidebar-logo" src="/icons/logo.png" alt="로고">
        </a>

        <div class="menu-group">
            <div class="menu-item" id='home' onclick="toggleSubmenu('dashboard-submenu')">
                <img src="/icons/home.png" alt="대시보드 아이콘">
                <div class="menu-title"><a href="/">대시보드</a></div>
            </div>
            <%-- <div id="dashboard-submenu" class="submenu-container"></div> --%>

            <div class="menu-item" onclick="toggleSubmenu('mypage-submenu')">
                <img src="/icons/user_box.png" alt="마이페이지 아이콘">
                <div class="menu-title">마이페이지</div>
                <img src="/icons/expand_left.png" style="width: 24px; height: 24px;" alt="">
            </div>

            <div id="mypage-submenu" class="submenu-container">
                <div class="submenu-item active">
                    <div class="submenu-text"><a href="myPage.st?title1=마이페이지&title2=개인정보 수정">개인정보 수정</a></div>
                </div>
                <div class="submenu-item">
                    <div class="submenu-text"><a href="finish.bo?title1=마이페이지&title2=수료증 발급">수료증 발급</a></div>
                </div>
            </div>

            <div class="menu-item" onclick="toggleSubmenu('attendance-submenu')">
                <img src="/icons/calendar.png" alt="출석관리 아이콘">
                <div class="menu-title">출석 관리</div>
                <img src="/icons/expand_left.png" style="width: 24px; height: 24px;">
            </div>

            <div id="attendance-submenu" class="submenu-container">
                <div class="submenu-item">
                    <div class="submenu-text"><a href="attendance.st?title1=출석 관리&title2=출석률 조회">출석률 조회</a></div>
                </div>
                <div class="submenu-item">
                    <div class="submenu-text"><a href="studentVacation.li?title1=출석 관리&title2=휴가 관리">휴가 관리</a></div>
                </div>
                <div class="submenu-item">
                    <div class="submenu-text"><a href="studentPay.li?title1=출석 관리&title2=급여 조회">급여 조회</a></div>
                </div>
            </div>

            <div class="menu-item" onclick="toggleSubmenu('resume-submenu')">
                <img src="/icons/file.png" alt="자소서 아이콘">
                <div class="menu-title">자소서 및 이력서</div>
                <img src="/icons/expand_left.png" style="width: 24px; height: 24px;">
            </div>

            <div id="resume-submenu" class="submenu-container">
                <div class="submenu-item">
                    <div class="submenu-text"><a href="resume.bo?title1=자소서 및 이력서&title2=자소서 및 이력서 관리">자소서 및 이력서 관리</a></div>
                </div>
                <div class="submenu-item">
                    <div class="submenu-text"><a href="resumeForm.bo?title1=자소서 및 이력서&title2=자소서 및 이력서 작성">자소서 및 이력서 작성</a>
                    </div>
                </div>
            </div>

            <div class="menu-item" onclick="toggleSubmenu('community-submenu')">
                <img src="/icons/group.png" alt="커뮤니티 아이콘">
                <div class="menu-title">커뮤니티</div>
                <img src="/icons/expand_left.png" style="width: 24px; height: 24px;">
            </div>

            <div id="community-submenu" class="submenu-container">
                <div class="submenu-item">
                    <div class="submenu-text"><a href="notice.bo?title1=커뮤니티&title2=공지사항">공지사항</a></div>
                </div>
                <div class="submenu-item">
                    <div class="submenu-text"><a href="myClass.bo?title1=커뮤니티&title2=우리반 게시판">우리반 게시판</a></div>
                </div>
            </div>

            <%--강사용--%>
            <div class="menu-item" onclick="toggleSubmenu('myclass-submenu')">
                <img src="/icons/calendar.png" alt="">
                <div class="menu-title">강의 관리</div>
                <img src="/icons/expand_left.png" style="width: 24px; height: 24px;">
            </div>

            <%--관리자용--%>
            <div id="myclass-submenu" class="submenu-container">
                <div class="submenu-item">
                    <div class="submenu-text"><a href="course.li?title1=강의 관리&title2=진행중인 과정">진행중인 과정</a></div>
                </div>
                <div class="submenu-item">
                    <div class="submenu-text"><a href="completedCourse.li?title1=강의 관리&title2=종료된 과정">종료된 과정</a></div>
                </div>
            </div>

            <div class="menu-item" id='home' onclick="toggleSubmenu('money-submenu')">
                <img src="/icons/fluent_money-calculator-24-regular.png" alt="대시보드 아이콘">
                <div class="menu-title"><a href="adminPay.li?title2=급여관리">급여관리</a></div>
            </div>

            <div id="money-submenu" class="submenu-container"></div>

            <div class="menu-item" id='home' onclick="toggleSubmenu('setting-submenu')">
                <img src="/icons/setting_line.png" alt="대시보드 아이콘">
                <div class="menu-title"><a href="adminSiteSetting.fo?title2=환경설정">환경설정</a></div>
            </div>

            <div id="setting-submenu" class="submenu-container"></div>

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

    // 페이지가 로드되면 URL에서 값을 파싱해서 p 태그에 넣음
    window.onload = function () {
        // URL에서 쿼리 파라미터 파싱
        const urlParams = new URLSearchParams(window.location.search);
        const title1 = urlParams.get('title1');
        const title2 = urlParams.get('title2');

        console.log(title1 || title2);
        if (title2) {
            document.getElementsByClassName('breadcrumb-text')[0].innerHTML = title1;
            document.getElementsByClassName('page-title')[0].innerHTML = title2;
        }
    };
</script>



</body>
</html>
