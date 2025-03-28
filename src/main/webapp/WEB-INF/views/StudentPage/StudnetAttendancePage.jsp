<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>출석률 조회</title>
    <link rel="stylesheet" href="./css/Attendance.css" />
    <script>
        let currentMonth = 1; // 0 = January, 1 = February
        const monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];

        function updateCalendarHeader() {
            const header = document.getElementById("calendarMonth");
            header.innerText = monthNames[currentMonth];
        }

        function prevMonth() {
            currentMonth = (currentMonth - 1 + 12) % 12;
            updateCalendarHeader();
        }

        function nextMonth() {
            currentMonth = (currentMonth + 1) % 12;
            updateCalendarHeader();
        }

        window.onload = function () {
            updateCalendarHeader();
        }
    </script>
</head>
<body>
<div class="container">
    <div class="left">
        <div class="summary-boxes">
            <div class="box">
                <div class="box-title">출석</div>
                <div class="box-value">17일</div>
            </div>
            <div class="box">
                <div class="box-title">결석</div>
                <div class="box-value">1일</div>
            </div>
            <div class="box">
                <div class="box-title">지각</div>
                <div class="box-value">1회</div>
            </div>
            <div class="box">
                <div class="box-title">조퇴</div>
                <div class="box-value">1회</div>
            </div>
        </div>

        <div class="graph-box">
            <div class="graph-label">이번 단위기간 내 출석률</div>
            <div style="text-align: right;">17/20 (85.0%)</div>
            <div class="bar-container">
                <div class="bar-fill"></div>
                <div class="bar-marker"></div>
                <div class="marker-label">훈련장려금 지급 최소 조건</div>
            </div>
        </div>

        <div class="table-box">
            <div class="graph-label">단위기간 내 출석 기록</div>
            <table>
                <thead>
                <tr>
                    <th>날짜</th>
                    <th>입실시간</th>
                    <th>퇴실시간</th>
                    <th>상태</th>
                </tr>
                </thead>
                <tbody>
                <tr><td>2025.02.03</td><td>08:58:43</td><td>17:56:45</td><td>출석</td></tr>
                <tr><td>2025.02.04</td><td>08:58:43</td><td>17:56:45</td><td>지각</td></tr>
                <tr><td>2025.02.05</td><td>08:58:43</td><td>12:56:45</td><td>조퇴</td></tr>
                <tr><td>2025.02.06</td><td>08:58:43</td><td>17:56:45</td><td>결석</td></tr>
                <tr><td>2025.02.07~17</td><td>08:58:43 ~</td><td>17:56:45</td><td>출석</td></tr>
                </tbody>
            </table>
        </div>
    </div>

    <div class="right">
        <div class="calendar-header">
            <button onclick="prevMonth()">◀</button>
            <span id="calendarMonth">February</span>
            <button onclick="nextMonth()">▶</button>
        </div>
        <div class="calendar-grid">
            <div class="day-header">Mo</div>
            <div class="day-header">Tu</div>
            <div class="day-header">We</div>
            <div class="day-header">Th</div>
            <div class="day-header">Fr</div>
            <div class="day-header">Sa</div>
            <div class="day-header">Su</div>

            <div class="calendar-cell 빈칸">29</div>
            <div class="calendar-cell 출석">3</div>
            <div class="calendar-cell 지각">4</div>
            <div class="calendar-cell 조퇴">5</div>
            <div class="calendar-cell 결석">6</div>
            <div class="calendar-cell 휴가">7</div>
            <div class="calendar-cell 빈칸">1</div>
            <div class="calendar-cell 빈칸">2</div>

            <div class="calendar-cell 출석">10</div>
            <div class="calendar-cell 출석">11</div>
            <div class="calendar-cell 출석">12</div>
            <div class="calendar-cell 출석">13</div>
            <div class="calendar-cell 출석">14</div>
            <div class="calendar-cell 빈칸">15</div>
            <div class="calendar-cell 빈칸">16</div>

            <div class="calendar-cell 출석">17</div>
            <div class="calendar-cell 출석">18</div>
            <div class="calendar-cell 출석">19</div>
            <div class="calendar-cell 출석">20</div>
            <div class="calendar-cell 공강">21</div>
            <div class="calendar-cell 빈칸">22</div>
            <div class="calendar-cell 빈칸">23</div>

            <div class="calendar-cell 출석">24</div>
            <div class="calendar-cell 출석">25</div>
            <div class="calendar-cell 출석">26</div>
            <div class="calendar-cell 출석">27</div>
            <div class="calendar-cell 출석">28</div>
            <div class="calendar-cell 빈칸">1</div>
            <div class="calendar-cell 빈칸">2</div>
        </div>
    </div>
</div>
</body>
</html>
