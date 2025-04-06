<%--
  Created by IntelliJ IDEA.
  User: user1
  Date: 25. 4. 3.
  Time: 오전 10:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/admin.css">5
    <link rel="stylesheet" href="/css/varibles.css">
    <link rel="stylesheet" href="/css/component.css">
</head>
<body>
<%--
    인사         결재 대기 목록(병,휴가 신청 등등)   일정
    근태관리      최근 알림(입퇴실 내역)
--%>
<jsp:include page="../common/header.jsp"/>
<div class="content-container">
    <%-- 인사 --%>
    <section class="intro-section">
        <div class="content-box">
            <h2>안녕하세요. KH강사님</h2>
            <p>강사님은 현재 N개의 반을 맡고 계세요. <br>
                오늘도 시작해볼까요?</p>
            <div class="intro-btn-box">
                <button class="btn-small">내 정보 수정</button>
                <button class="btn-blank-small">반관리</button>
            </div>
        </div>
    </section>
    <%-- 근태 관리 --%>
    <section class="attendance-section">
        <h2 class="checkin-title">출결 체크</h2>
        <p class="checkin-date">2025년 03월 21일 (금요일) 16:19:20</p>

        <div class="checkin-time-total">06h 12m</div>

        <div class="checkin-progress">
            <div class="bar"><div class="fill" style="width: 65%;"></div></div>
        </div>

        <div class="checkin-times">
            <div><span class="label">입실시간</span><span class="time">09 : 05 : 30</span></div>
            <div><span class="label">퇴실시간</span><span class="time">17 : 57 : 50</span></div>
        </div>

        <div class="checkin-buttons">
            <button class="btn enter active">입실</button>
            <button class="btn out">외출 및 조퇴</button>
        </div>
        <button class="btn full leave">퇴실</button>
    </section>
    <%-- 결재 대기 목록(휴가, 병가 등등) --%>
    <section class="list-section">

    </section>
    <%-- 최근 알림(입퇴실 내역 등등) --%>
    <section class="alarm-section">

    </section>
    <%-- 스케쥴(일정) --%>
    <section class="schedule-section">
        <h2>스케쥴</h2>
        <div class="calendar">
            <div class="calendar-header">March</div>
            <div class="calendar-grid">
                <!-- 요일 -->
                <div class="day-label">Mo</div>
                <div class="day-label">Tu</div>
                <div class="day-label">We</div>
                <div class="day-label">Th</div>
                <div class="day-label">Fr</div>
                <div class="day-label sa">Sa</div>
                <div class="day-label su">Su</div>

                <!-- 빈 칸 (2월 24~29) -->
                <div class="day empty">24</div>
                <div class="day empty">25</div>
                <div class="day empty">26</div>
                <div class="day empty">27</div>
                <div class="day empty">28</div>

                <!-- 3월 날짜 -->
                <%-- 1 ~ 31 --%>
                <%
                    int[] days = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,
                            21,22,23,24,25,26,27,28,29,30,31};
                    for (int i = 0; i < days.length; i++) {
                        int day = days[i];
                        String className = "day";
                        if ((i + 5) % 7 == 5) className += " sa"; // 토요일
                        else if ((i + 5) % 7 == 6) className += " su"; // 일요일
                %>
                <div class="<%= className %>"><%= day %></div>
                <% } %>

                <!-- 다음달 일부 (4월 1~6) -->
                <div class="day empty">1</div>
                <div class="day empty">2</div>
                <div class="day empty">3</div>
                <div class="day empty">4</div>
                <div class="day empty">5</div>
                <div class="day empty">6</div>
            </div>
        </div>
        <h2>일자 및 일정</h2>
        <div class="schedule-items">
            <div class="schedule-item">
                <p class="schedule-item-title">과정 이름 > 일정 명</p>
                <p class="schedule-date">2025.03.24</p>
            </div>
            <div class="schedule-item">
                <p class="schedule-item-title">과정 이름 > 일정 명</p>
                <p class="schedule-date">2025.03.24</p>
            </div>
        </div>
    </section>
</div>
</body>
</html>
