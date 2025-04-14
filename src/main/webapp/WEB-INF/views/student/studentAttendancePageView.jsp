<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <title>출석률 조회</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Attendance.css" />

</head>
<body>
<jsp:include page="../common/header.jsp" />
<div class="container">
    <div class="left">
        <div class="summary-boxes">
            <div class="box"><div class="box-title">출석</div><div class="box-value" id="present">15일</div></div>
            <div class="box"><div class="box-title">결석</div><div class="box-value" id="absent">1일</div></div>
            <div class="box"><div class="box-title">지각</div><div class="box-value" id="late">2회</div></div>
            <div class="box"><div class="box-title">조퇴</div><div class="box-value" id="earlyLeave">0회</div></div>
        </div>
        <div class="graph-box">
            <div><strong>이번 단위기간 내 출석률</strong></div>
            <div style="text-align: right; font-weight: bold;" id="rateText">15/20 (65.0%)</div>
            <div class="bar-container">
                <div class="bar-fill" style="width: 65%;"></div>
                <div class="bar-marker"></div>
                <div class="marker-label">훈련장려금 지급 최소 조건</div>
            </div>
        </div>
        <div class="graph-box">
            <div><strong>단위기간 내 출석 기록</strong></div>
            <table style="border-collapse: separate; border-spacing: 0 10px;">
                <thead>
                <tr><th>날짜</th><th>입실시간</th><th>퇴실시간</th><th>상태</th></tr>
                </thead>
                <tbody id="attendance-body">
                <tr><td>2025-04-11</td><td>09:00</td><td>17:50</td><td style="color: green">출석</td></tr>
                <tr><td>2025-04-10</td><td>00:00</td><td>00:00</td><td style="color: red">결석</td></tr>
                <tr><td>2025-04-09</td><td>09:20</td><td>17:50</td><td style="color: orange">지각</td></tr>
                <tr><td>2025-04-08</td><td>09:00</td><td>17:50</td><td style="color: green">출석</td></tr>
                <tr><td>2025-04-07</td><td>09:00</td><td>17:50</td><td style="color: green">출석</td></tr>
                <tr><td>2025-04-04</td><td>09:00</td><td>17:50</td><td style="color: green">출석</td></tr>
                <tr><td>2025-04-03</td><td>09:00</td><td>17:50</td><td style="color: green">출석</td></tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="right">
        <div class="calendar-container">
            <div class="calendar-header">
                <button type="button" class="calendar-nav" onclick="changeMonth(-1)">&#9664;</button>
                <h2 id="calendarTitle"></h2>
                <button type="button" class="calendar-nav" onclick="changeMonth(1)">&#9654;</button>
            </div>
            <div class="calendar-grid">
                <div class="calendar-day">월</div>
                <div class="calendar-day">화</div>
                <div class="calendar-day">수</div>
                <div class="calendar-day">목</div>
                <div class="calendar-day">금</div>
                <div class="calendar-day">토</div>
                <div class="calendar-day">일</div>
            </div>
            <div class="calendar-grid" id="calendarBody">
                <%-- 날짜 셀 렌더링 영역 --%>
            </div>
        </div>
    </div>
</div>
<script>
    <%-- 달력 생성 코드 --%>
    let currentDate = new Date();

    function renderCalendar(date) {
        const year = date.getFullYear();
        const month = date.getMonth();
        const firstDay = new Date(year, month, 1);
        const lastDay = new Date(year, month + 1, 0);
        const startDay = (firstDay.getDay() + 6) % 7; // 월요일 시작 (0~6)
        const prevMonthLastDate = new Date(year, month, 0).getDate();
        const totalDays = 42; // 6줄 × 7일
        const calendarBody = document.getElementById("calendarBody");
        calendarBody.innerHTML = "";

        document.getElementById("calendarTitle").textContent = year + "년 " + (month + 1) + "월";

        for (let i = 0; i < totalDays; i++) {
            const cell = document.createElement("div");
            cell.classList.add("calendar-cell");

            if (i < startDay) {
                const day = prevMonthLastDate - startDay + 1 + i;
                cell.textContent = day;
                cell.classList.add("prev-month");
            } else if (i < startDay + lastDay.getDate()) {
                const day = i - startDay + 1;
                cell.textContent = day;
                cell.classList.add("current-month");
            } else {
                const day = i - (startDay + lastDay.getDate()) + 1;
                cell.textContent = day;
                cell.classList.add("next-month");
            }

            calendarBody.appendChild(cell);
        }
    }

    function changeMonth(offset) {
        currentDate.setMonth(currentDate.getMonth() + offset);
        renderCalendar(currentDate);
    }

    // 초기 렌더링
    renderCalendar(currentDate);
</script>
<script>
    <%--let current = new Date();--%>

    <%--function fetchData(year, month) {--%>
    <%--    fetch(`/getAttendanceData?year=${year}&month=${month}`)--%>
    <%--        .then(res => res.json())--%>
    <%--        .then(data => {--%>
    <%--            updateAttendance(data);--%>
    <%--            renderCalendar(year, month, data.calendar);--%>
    <%--        });--%>
    <%--}--%>

    <%--function updateAttendance(data) {--%>
    <%--    document.getElementById("present").innerText = data.summary.present + "일";--%>
    <%--    document.getElementById("absent").innerText = data.summary.absent + "일";--%>
    <%--    document.getElementById("late").innerText = data.summary.late + "회";--%>
    <%--    document.getElementById("earlyLeave").innerText = data.summary.earlyLeave + "회";--%>
    <%--    document.getElementById("rateText").innerText = `${data.summary.count} (${data.summary.rate}%)`;--%>
    <%--    document.querySelector(".bar-fill").style.width = `${data.summary.rate}%`;--%>

    <%--    const tbody = document.getElementById("attendance-body");--%>
    <%--    tbody.innerHTML = "";--%>
    <%--    data.records.forEach(r => {--%>
    <%--        const row = `<tr><td>${r.date}</td><td>${r.checkIn}</td><td>${r.checkOut}</td><td>${r.status}</td></tr>`;--%>
    <%--        tbody.innerHTML += row;--%>
    <%--    });--%>
    <%--}--%>

    <%--function renderCalendar(year, month, calendarData = {}) {--%>
    <%--    const grid = document.getElementById("calendar-grid");--%>
    <%--    const header = document.getElementById("calendar-header");--%>
    <%--    const date = new Date(year, month - 1);--%>
    <%--    header.innerText = `${year}년 ${month}월`;--%>

    <%--    const firstDay = new Date(year, month - 1, 1).getDay();--%>
    <%--    const lastDate = new Date(year, month, 0).getDate();--%>

    <%--    const dayNames = ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"];--%>
    <%--    grid.innerHTML = dayNames.map(day => `<div class="day-header">${day}</div>`).join("");--%>

    <%--    for (let i = 0; i < firstDay; i++) grid.innerHTML += `<div class='calendar-cell 빈칸'></div>`;--%>
    <%--    for (let d = 1; d <= lastDate; d++) {--%>
    <%--        let status = calendarData[d] || '';--%>
    <%--        grid.innerHTML += `<div class='calendar-cell ${status}'>${d}</div>`;--%>
    <%--    }--%>
    <%--}--%>

    <%--function changeMonth(offset) {--%>
    <%--    current.setMonth(current.getMonth() + offset);--%>
    <%--    fetchData(current.getFullYear(), current.getMonth() + 1);--%>
    <%--}--%>

    <%--fetchData(current.getFullYear(), current.getMonth() + 1);--%>
</script>
</body>
</html>
