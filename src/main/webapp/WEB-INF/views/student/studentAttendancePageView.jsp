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
            <div class="box"><div class="box-title">출석</div><div class="box-value" id="present">0일</div></div>
            <div class="box"><div class="box-title">결석</div><div class="box-value" id="absent">0일</div></div>
            <div class="box"><div class="box-title">지각</div><div class="box-value" id="late">0회</div></div>
            <div class="box"><div class="box-title">조퇴</div><div class="box-value" id="earlyLeave">0회</div></div>
        </div>
        <div class="graph-box">
            <div><strong>이번 단위기간 내 출석률</strong></div>
            <div style="text-align: right; font-weight: bold;" id="rateText">0/0 (0.0%)</div>
            <div class="bar-container">
                <div class="bar-fill" style="width: 0%;"></div>
                <div class="bar-marker"></div>
                <div class="marker-label">훈련장려금 지급 최소 조건</div>
            </div>
        </div>
        <div class="graph-box">
            <div><strong>단위기간 내 출석 기록</strong></div>
            <table>
                <thead>
                <tr><th>날짜</th><th>입실시간</th><th>퇴실시간</th><th>상태</th></tr>
                </thead>
                <tbody id="attendance-body">
                </tbody>
            </table>
        </div>
    </div>
    <div class="right">
        <div class="calendar-nav">
            <button onclick="changeMonth(-1)">◀</button>
            <div id="calendar-header" class="calendar-header">2025년 3월</div>
            <button onclick="changeMonth(1)" id="next-button">▶</button>
        </div>
        <div class="calendar-grid" id="calendar-grid"></div>
    </div>
</div>

<script>
    let current = new Date();

    function fetchData(year, month) {
        fetch(`/getAttendanceData?year=${year}&month=${month}`)
            .then(res => res.json())
            .then(data => {
                updateAttendance(data);
                renderCalendar(year, month, data.calendar);
            });
    }

    function updateAttendance(data) {
        document.getElementById("present").innerText = data.summary.present + "일";
        document.getElementById("absent").innerText = data.summary.absent + "일";
        document.getElementById("late").innerText = data.summary.late + "회";
        document.getElementById("earlyLeave").innerText = data.summary.earlyLeave + "회";
        document.getElementById("rateText").innerText = `${data.summary.count} (${data.summary.rate}%)`;
        document.querySelector(".bar-fill").style.width = `${data.summary.rate}%`;

        const tbody = document.getElementById("attendance-body");
        tbody.innerHTML = "";
        data.records.forEach(r => {
            const row = `<tr><td>${r.date}</td><td>${r.checkIn}</td><td>${r.checkOut}</td><td>${r.status}</td></tr>`;
            tbody.innerHTML += row;
        });
    }

    function renderCalendar(year, month, calendarData = {}) {
        const grid = document.getElementById("calendar-grid");
        const header = document.getElementById("calendar-header");
        const date = new Date(year, month - 1);
        header.innerText = `${year}년 ${month}월`;

        const firstDay = new Date(year, month - 1, 1).getDay();
        const lastDate = new Date(year, month, 0).getDate();

        const dayNames = ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"];
        grid.innerHTML = dayNames.map(day => `<div class="day-header">${day}</div>`).join("");

        for (let i = 0; i < firstDay; i++) grid.innerHTML += `<div class='calendar-cell 빈칸'></div>`;
        for (let d = 1; d <= lastDate; d++) {
            let status = calendarData[d] || '';
            grid.innerHTML += `<div class='calendar-cell ${status}'>${d}</div>`;
        }
    }

    function changeMonth(offset) {
        current.setMonth(current.getMonth() + offset);
        fetchData(current.getFullYear(), current.getMonth() + 1);
    }

    fetchData(current.getFullYear(), current.getMonth() + 1);
</script>
</body>
</html>
