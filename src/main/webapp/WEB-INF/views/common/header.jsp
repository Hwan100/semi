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
        <div id="welcome">
            <div class="welcome-msg">
                <span id="welcomeMsg">환영합니다.</span>
                <span>
                <strong>${loginUser.userName}</strong> 님
            </span>
            </div>
            <div id="dropdown-arrow">
                <img src="/icons/expand_down.png" style="width: 24px; height: 24px;" alt="">
            </div>
        </div>
    </div>

    <script>
        // 헤더 드롭다운 메뉴 생성
        const triggerBtn = document.getElementById('dropdown-arrow');
        let dropdownEl = null;

        triggerBtn.addEventListener('click', (e) => {
            // 기존 드롭다운 제거
            if (dropdownEl) {
                dropdownEl.remove();
                dropdownEl = null;
                return;
            }

            // 새 드롭다운 생성
            dropdownEl = document.createElement('div');
            dropdownEl.className = 'dropdown-menu';
            dropdownEl.innerHTML = `
      <div class="dropdown-item">내정보 수정</div>
      <div class="dropdown-item" onclick="location.href='logout.us'">로그아웃</div>
    `;

            // 버튼 아래에 위치
            const rect = triggerBtn.getBoundingClientRect();
            dropdownEl.style.top = (rect.bottom + window.scrollY) + 'px';
            dropdownEl.style.left = (rect.left + window.scrollX - 100) + 'px';

            // body에 추가
            document.body.appendChild(dropdownEl);

            // 마우스가 벗어나면 닫기
            dropdownEl.addEventListener('mouseleave', () => {
                dropdownEl.remove();
                dropdownEl = null;
            });
        });

        // 버튼 외 다른 곳 누르면 닫기
        document.addEventListener('click', (e) => {
            if (dropdownEl && !dropdownEl.contains(e.target) && e.target !== triggerBtn) {
                dropdownEl.remove();
                dropdownEl = null;
            }
        });
    </script>

    <hr>
</header>

<div class="sidebar-container">
    <div class="sidebar">
        <a href="/">
            <img class="sidebar-logo" src="${siteSetting.changeName}" alt="로고" onerror="this.src='/icons/logo.png'">
        </a>

        <div class="menu-group">
            <c:if test="${loginUser.userRole > 0}">
                <div class="menu-item" id='home' onclick="toggleSubmenu('dashboard-submenu')">
                    <img src="/icons/home.png" alt="대시보드 아이콘">
                    <div class="menu-title"><a href="/">대시보드</a></div>
                </div>
                <div id="dashboard-submenu" class="submenu-container"></div>
                <c:if test="${loginUser.userRole == 1}">
                    <div class="menu-item" onclick="toggleSubmenu('mypage-submenu')">
                        <img src="/icons/user_box.png" alt="마이페이지 아이콘">
                        <div class="menu-title">마이페이지</div>
                        <img src="/icons/expand_left.png" style="width: 24px; height: 24px;" alt="">
                    </div>

                    <div id="mypage-submenu" class="submenu-container">
                        <div class="submenu-item active"
                             onclick="location.href='myPage.me?title1=마이페이지&title2=개인정보 수정';">
                            <div class="submenu-text"><a href="myPage.me">개인정보 수정</a></div>
                        </div>
                        <div class="submenu-item" onclick="location.href='finish.bo?title1=마이페이지&title2=수료증 발급'">
                            <div class="submenu-text">수료증 발급</div>
                        </div>
                    </div>
                </c:if>
                <c:if test="${loginUser.userRole > 1}">
                    <div class="menu-item" onclick="location.href='myPage.me?title1=마이페이지&title2=개인정보 수정';">
                        <img src="/icons/user_box.png" alt="마이페이지 아이콘">
                        <div class="menu-title">마이페이지</div>
                    </div>

                    <div id="mypage-submenu" class="submenu-container"></div>
                </c:if>
                <c:if test="${loginUser.userRole == 1}">
                    <div class="menu-item" onclick="toggleSubmenu('attendance-submenu')">
                        <img src="/icons/calendar.png" alt="출석관리 아이콘">
                        <div class="menu-title">출석 관리</div>
                        <img src="/icons/expand_left.png" style="width: 24px; height: 24px;">
                    </div>

                    <div id="attendance-submenu" class="submenu-container">
                        <div class="submenu-item" onclick="location.href='attendance.st?title1=출석 관리&title2=출석률 조회'">
                            <div class="submenu-text">출석률 조회</div>
                        </div>
                        <div class="submenu-item"
                             onclick="location.href='studentVacation.li?title1=출석 관리&title2=휴가 관리'">
                            <div class="submenu-text">휴가 관리</div>
                        </div>
                        <div class="submenu-item" onclick="location.href='studentPay.li?title1=출석 관리&title2=급여 조회'">
                            <div class="submenu-text">급여 조회</div>
                        </div>
                    </div>
                </c:if>
                <div class="menu-item" onclick="toggleSubmenu('resume-submenu')">
                    <img src="/icons/file.png" alt="자소서 아이콘">
                    <div class="menu-title">자소서 및 이력서</div>
                    <img src="/icons/expand_left.png" style="width: 24px; height: 24px;">
                </div>

                <div id="resume-submenu" class="submenu-container">
                    <div class="submenu-item" onclick="location.href='resume.bo?title1=자소서 및 이력서&title2=자소서 및 이력서 관리'">
                        <div class="submenu-text">자소서&이력서 관리</div>
                    </div>
                    <div class="submenu-item"
                         onclick="location.href='resumeForm.bo?title1=자소서 및 이력서&title2=자소서 및 이력서 작성'">
                        <div class="submenu-text">자소서&이력서 작성</div>
                    </div>
                </div>

                <c:if test="${loginUser.userRole == 1}">
                    <div class="menu-item" onclick="toggleSubmenu('community-submenu')">
                        <img src="/icons/group.png" alt="커뮤니티 아이콘">
                        <div class="menu-title">커뮤니티</div>
                        <img src="/icons/expand_left.png" style="width: 24px; height: 24px;">
                    </div>

                    <div id="community-submenu" class="submenu-container">
                        <div class="submenu-item" onclick="location.href='notice.bo?title1=커뮤니티&title2=공지사항'">
                            <div class="submenu-text">공지사항</div>
                        </div>
                        <div class="submenu-item" onclick="location.href='myClass.bo?title1=커뮤니티&title2=우리반 게시판'">
                            <div class="submenu-text">우리반 게시판</div>
                        </div>
                    </div>
                </c:if>

                <c:if test="${loginUser.userRole == 2}">
                    <div class="menu-item" id='home' onclick="toggleSubmenu('setting-submenu')">
                        <img src="/icons/group.png" alt="커뮤니티 아이콘">
                        <div class="menu-title"><a href="notice.bo?title1=커뮤니티&title2=공지사항">공지사항</a></div>
                    </div>
                    <div id="setting-submenu" class="submenu-container"></div>
                </c:if>

                <c:if test="${loginUser.userRole > 1}">
                    <div class="menu-item" onclick="toggleSubmenu('myclass-submenu')">
                        <img src="/icons/calendar.png" alt="">
                        <div class="menu-title">강의 관리</div>
                        <img src="/icons/expand_left.png" style="width: 24px; height: 24px;">
                    </div>

                    <div id="myclass-submenu" class="submenu-container">
                        <div class="submenu-item" onclick="location.href='course.li?title1=강의 관리&title2=진행중인 과정'">
                            <div class="submenu-text">진행중인 과정</div>
                        </div>
                        <div class="submenu-item"
                             onclick="location.href='completedCourse.li?title1=강의 관리&title2=종료된 과정'">
                            <div class="submenu-text">종료된 과정</div>
                        </div>

                        <c:if test="${loginUser.userRole == 3}">
                            <div class="submenu-item"
                                 onclick="location.href='createCourse.fo?title1=강의 관리&title2=강의 개설'">
                                <div class="submenu-text">강의 개설</div>
                            </div>
                            <div class="submenu-item"
                                 onclick="location.href='adminCourse.li?title1=강의 관리&title2=강의 조회'">
                                <div class="submenu-text">전체 강의 조회</div>
                            </div>
                        </c:if>
                    </div>
                </c:if>

                <c:if test="${loginUser.userRole == 3}">
                    <div class="menu-item" id='home' onclick="toggleSubmenu('money-submenu')">
                        <img src="/icons/fluent_money-calculator-24-regular.png" alt="대시보드 아이콘">
                        <div class="menu-title">관리자메뉴</div>
                        <img src="/icons/expand_left.png" style="width: 24px; height: 24px;">
                    </div>

                    <div id="money-submenu" class="submenu-container">
                        <div class="submenu-item" onclick="location.href='adminUser.li?title1=관리자메뉴&title2=사용자 조회'">
                            <div class="submenu-text">사용자 조회</div>
                        </div>
                        <div class="submenu-item" onclick="location.href='notice.bo?title1=관리자메뉴&title2=공지사항'">
                            <div class="submenu-text">공지사항</div>
                        </div>
                        <div class="submenu-item" onclick="location.href='adminPay.li?title1=관리자메뉴&title2=급여관리'">
                            <div class="submenu-text">급여관리</div>
                        </div>
                    </div>

                    <div class="menu-item" id='home' onclick="toggleSubmenu('setting-submenu')">
                        <img src="/icons/setting_line.png" alt="대시보드 아이콘">
                        <div class="menu-title"><a href="adminSiteSetting.fo?title2=환경설정">환경설정</a></div>
                    </div>

                    <div id="setting-submenu" class="submenu-container"></div>
                </c:if>
            </c:if>
        </div>
    </div>
</div>

<script>
    function toggleSubmenu(id) {
        document.querySelectorAll('.submenu-container').forEach(menu => {
            if (menu.id !== id) {
                // menu.classList.remove('open');
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

        // console.log(title1 || title2);
        if (title2) {
            document.getElementsByClassName('breadcrumb-text')[0].innerHTML = title1;
            document.getElementsByClassName('page-title')[0].innerHTML = title2;
        }
    };
</script>


</body>
</html>
