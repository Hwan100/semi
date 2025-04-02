<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>일정 관리</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/AdminClassScheduleSet.css">
</head>
<body>
<jsp:include page="../common/header.jsp" />

<!-- 상단 탭 -->
<div class="menu-tabs">
    <div class="tab inactive">출결 조회</div>
    <div class="tab inactive">학생 정보</div>
    <div class="tab inactive">휴가 신청 내역</div>
    <div class="tab active">일정 관리</div>
    <div class="tab inactive">우리반 게시판</div>
    <div class="tab inactive">자소서 및 이력서</div>
</div>

<!-- 전체 캘린더 페이지 -->
<div class="container1">
    <div class="calendar-page">
        <!-- 캘린더 박스 -->
        <div class="calendar-container">
            <div class="calendar-header">2025.04</div>
            <div class="calendar-grid">
                <div class="calendar-line">
                    <div class="day-box sunday">일</div>
                    <div class="day-box">월</div>
                    <div class="day-box">화</div>
                    <div class="day-box">수</div>
                    <div class="day-box">목</div>
                    <div class="day-box">금</div>
                    <div class="day-box saturday">토</div>
                </div>
                <div class="calendar-line">
                    <div class="day-box dimmed">31</div>
                    <div class="day-box">1</div>
                    <div class="day-box">2</div>
                    <div class="day-box">3</div>
                    <div class="day-box">4</div>
                    <div class="day-box">5</div>
                    <div class="day-box saturday">6</div>
                </div>
                <div class="calendar-line">
                    <div class="day-box sunday">7</div>
                    <div class="day-box">8</div>
                    <div class="day-box">9</div>
                    <div class="day-box">10</div>
                    <div class="day-box">11</div>
                    <div class="day-box">12</div>
                    <div class="day-box saturday">13</div>
                </div>
                <div class="calendar-line">
                    <div class="day-box sunday">14</div>
                    <div class="day-box">15</div>
                    <div class="day-box">16</div>
                    <div class="day-box">17</div>
                    <div class="day-box">18</div>
                    <div class="day-box">19</div>
                    <div class="day-box saturday">20</div>
                </div>
                <div class="calendar-line">
                    <div class="day-box sunday">21</div>
                    <div class="day-box">22</div>
                    <div class="day-box">23</div>
                    <div class="day-box">24</div>
                    <div class="day-box purple">25</div>
                    <div class="day-box">26</div>
                    <div class="day-box saturday">27</div>
                </div>
                <div class="calendar-line">
                    <div class="day-box sunday">28</div>
                    <div class="day-box">29</div>
                    <div class="day-box">30</div>
                    <div class="day-box">31</div>
                    <div class="day-box dimmed">1</div>
                    <div class="day-box dimmed">2</div>
                    <div class="day-box dimmed">3</div>
                </div>
            </div>
        </div>

        <!-- 일정 박스 -->
    </div>
</div>

<div class="container2">
    <div class="schedule-box">
        <h3 class="schedule-title">선택한 날짜 일정</h3>
        <div class="schedule-content">
            <p>아직 등록된 일정이 없습니다.</p>
            <!-- 동적으로 일정이 들어올 수 있도록 구성 -->
        </div>
    </div>
</div>

</body>
</html>
