<%--
  Created by IntelliJ IDEA.
  User: user1
  Date: 25. 3. 27.
  Time: 오전 11:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="../common/header.jsp"/>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/studentMain.css">
    <link rel="stylesheet" href="/css/variables.css">
    <link rel="stylesheet" href="/css/component.css">
</head>
<body>
<div class="content-container">
    <%-- 인사 --%>
    <section class="intro-section">
        <div class="content-box">
            <h2>안녕하세요. KH학생님</h2>
            <p>AWS 클라우드 기반 Devops 개발자 양성 과정</p>
            <p>[강남 S] 2024. 12. 16 ~ 2025. 07. 18 ｜ 09:00 ~ 18:00 <br>
                최지원 강사님 | 오환석 취업담임</p>
            <div class="intro-btn-box">
                <button class="btn-small" onclick="location.href='myPage.me'">정보 수정</button>
                <button class="btn-blank-small">수강정보</button>
            </div>
        </div>
    </section>
    <%-- 출석 요약 --%>
    <section class="attendance-section">
        <div class="attendance-count">
            <p class="count-title">출석</p>
            <p><span class="primary-bold">12</span>일</p>
        </div>
        <div class="late-count">
            <p class="count-title">지각 및 조퇴</p>
            <p><span class="primary-bold">12</span>회</p>
        </div>
        <div class="absence-count">
            <p class="count-title">결석</p>
            <p><span class="primary-bold">12</span>일</p>
        </div>
        <div class="vacation-count">
            <p class="count-title">휴가</p>
            <p><span class="primary-bold">12</span>일</p>
        </div>
        <div class="calculator">
            <div class="circle-chart">
                <svg viewBox="0 0 36 36" class="circular-chart">
                    <path class="circle-bg"
                          d="M18 2.0845
                     a 15.9155 15.9155 0 0 1 0 31.831
                     a 15.9155 15.9155 0 0 1 0 -31.831"/>
                    <path class="circle"
                          id="circle"
                          stroke-dasharray="0, 100"
                          d="M18 2.0845
                     a 15.9155 15.9155 0 0 1 0 31.831
                     a 15.9155 15.9155 0 0 1 0 -31.831"/>
                    <text x="18" y="20.35" class="percentage" id="percentageText">0%</text>
                </svg>
            </div>
            <div class="label">이번 단위기간 출석률</div>
            <div class="summary"><strong id="attended">0</strong>/20 <span class="percent" id="percentText">(0%)</span>
            </div>
        </div>
    </section>
    <script>
        // 👇 동적으로 출석률 갱신하는 함수
        function updateAttendance(present, total) {
            const percentage = Math.round((present / total) * 100);

            const circle = document.getElementById("circle");
            const percentageText = document.getElementById("percentageText");
            const attended = document.getElementById("attended");
            const percentText = document.getElementById("percentText");

            // SVG 차트 그리기ㅋ
            circle.setAttribute("stroke-dasharray", percentage + " , 100");

            // 텍스트 업데이트
            percentageText.textContent = percentage + "%";
            attended.textContent = present;
            percentText.textContent = percentage + "%";
        }

        // 예시: 18일 출석 / 총 20일
        updateAttendance(18, 20);
    </script>
    <%-- 일정 --%>
    <section class="schedule-section">
        <div class="calendar-box">
            <div class="schedule-box">
                <h3>2025</h3>
                <ul>
                    <li>
                        <div>03</div>
                        휴강
                    </li>
                    <li>
                        <div>17</div>
                        세미프로젝트
                    </li>
                </ul>
            </div>
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
                        int[] days = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
                                21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31};
                        for (int i = 0; i < days.length; i++) {
                            int day = days[i];
                            String className = "day";
                            if ((i + 5) % 7 == 5) className += " sa"; // 토요일
                            else if ((i + 5) % 7 == 6) className += " su"; // 일요일
                    %>
                    <div class="<%= className %>"><%= day %>
                    </div>
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
        </div>
    </section>
    <%-- 공지사항 --%>
    <section class="announcement-section">
        <div class="announcement-box">
            <p>공지사항</p>
            <button class="btn-blank-small">바로가기</button>
        </div>
        <table class="notice-table">
            <thead>
            <tr>
                <th>글번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>19</td>
                <td>[식권공지] 맥주창고 식권 금액 인상 공지입니다.</td>
                <td>행정팀</td>
                <td>2024.03.27</td>
            </tr>
            <tr>
                <td>18</td>
                <td>[HRD공지사항] HRD-Net 단독회원 서비스 중지 및 원...</td>
                <td>행정팀</td>
                <td>2024.03.25</td>
            </tr>
            <tr>
                <td>17</td>
                <td>[식권공지] 맥주창고 식권 금액 인상 공지입니다.</td>
                <td>행정팀</td>
                <td>2024.03.25</td>
            </tr>
            <tr>
                <td>16</td>
                <td>[HRD공지사항] HRD-Net 단독회원 서비스 중지 및 원...</td>
                <td>행정팀</td>
                <td>2024.03.23</td>
            </tr>
            <tr>
                <td>15</td>
                <td>[HRD공지사항] HRD-Net 단독회원 서비스 중지 및 원...</td>
                <td>행정팀</td>
                <td>2024.03.20</td>
            </tr>
            <tr>
                <td>14</td>
                <td>[HRD공지사항] HRD-Net 단독회원 서비스 중지 및 원...</td>
                <td>행정팀</td>
                <td>2024.03.19</td>
            </tr>
            <tr>
                <td>13</td>
                <td>[HRD공지사항] HRD-Net 단독회원 서비스 중지 및 원...</td>
                <td>행정팀</td>
                <td>2024.03.19</td>
            </tr>
            </tbody>
        </table>
    </section>
    <%-- 우리반 게시판 --%>
    <section class="board-section">
        <div class="announcement-box">
            <p>우리반 게시판</p>
            <button class="btn-blank-small">바로가기</button>
        </div>
        <table class="notice-table">
            <thead>
            <tr>
                <th>글번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>19</td>
                <td>[식권공지] 맥주창고 식권 금액 인상 공지입니다.</td>
                <td>행정팀</td>
                <td>2024.03.27</td>
            </tr>
            <tr>
                <td>18</td>
                <td>[HRD공지사항] HRD-Net 단독회원 서비스 중지 및 원...</td>
                <td>행정팀</td>
                <td>2024.03.25</td>
            </tr>
            <tr>
                <td>17</td>
                <td>[식권공지] 맥주창고 식권 금액 인상 공지입니다.</td>
                <td>행정팀</td>
                <td>2024.03.25</td>
            </tr>
            <tr>
                <td>16</td>
                <td>[HRD공지사항] HRD-Net 단독회원 서비스 중지 및 원...</td>
                <td>행정팀</td>
                <td>2024.03.23</td>
            </tr>
            <tr>
                <td>15</td>
                <td>[HRD공지사항] HRD-Net 단독회원 서비스 중지 및 원...</td>
                <td>행정팀</td>
                <td>2024.03.20</td>
            </tr>
            <tr>
                <td>14</td>
                <td>[HRD공지사항] HRD-Net 단독회원 서비스 중지 및 원...</td>
                <td>행정팀</td>
                <td>2024.03.19</td>
            </tr>
            <tr>
                <td>13</td>
                <td>[HRD공지사항] HRD-Net 단독회원 서비스 중지 및 원...</td>
                <td>행정팀</td>
                <td>2024.03.19</td>
            </tr>
            </tbody>
        </table>
    </section>
    <%-- 입실 퇴실 --%>
    <section class="checkin-section">
        <input type="hidden" id="checkInTime" value="${attendance.checkInTime}" />
        <input type="hidden" id="checkOutTime" value="${attendance.checkOutTime}" />
        <h2 class="checkin-title">출결 체크</h2>
        <p class="checkin-date" id="currentDate"></p>
        <%--            2025년 03월 21일 (금요일) 16:19:20--%>
        <div class="checkin-time-total" id="total-time">06h 12m</div>

        <div class="checkin-progress">
            <div class="bar">
                <div id="progressBar" class="fill" style="width: 65%;"></div>
            </div>
        </div>

            <div class="checkin-times">
                <div><span class="label">입실시간</span><span class="time">${attendance.checkInTime != null ? attendance.checkInTime : "-- : -- : --"}</span></div>
                <div><span class="label">퇴실시간</span><span class="time">${attendance.checkOutTime != null ? attendance.checkOutTime : "-- : -- : --"}</span></div>
            </div>

            <div class="checkin-buttons">
                <button class="btn enter active" onclick="checkIn()">입실</button>
                <button class="btn out">외출 및 조퇴</button>
            </div>
            <button class="btn full leave" onclick="checkOut()">퇴실</button>
            <script>
                // 현재 시간 계산
                function updateCurrentTime() {
                    const now = new Date();

                    const year = now.getFullYear();
                    const month = String(now.getMonth() + 1).padStart(2, '0');
                    const date = String(now.getDate()).padStart(2, '0');

                    const dayNames = ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'];
                    const day = dayNames[now.getDay()];

                    const hours = String(now.getHours()).padStart(2, '0');
                    const minutes = String(now.getMinutes()).padStart(2, '0');
                    const seconds = String(now.getSeconds()).padStart(2, '0');

                    const formatted = year + '년 ' + month + '월 ' + date + '일 (' + day + ') ' + hours + ':' + minutes + ':' + seconds;

                    document.getElementById('currentDate').textContent = "현재 시간: " + formatted;

                    updateTimeDifference(); // 매번 계산
                }
                // 시간 차이 계산
                function updateTimeDifference() {
                    const checkInStr = document.getElementById('checkInTime').value?.trim();
                    const checkOutStr = document.getElementById('checkOutTime').value?.trim();

                    if (!checkInStr) {
                        document.getElementById('total-time').textContent = '0h 0m';
                        document.getElementById("progressBar").setAttribute("style", "width: 0%");
                        return;
                    }

                    const today = new Date();
                    const [inHour, inMin, inSec] = checkInStr.split(":").map(Number);
                    const checkIn = new Date(today.getFullYear(), today.getMonth(), today.getDate(), inHour, inMin, inSec || 0);

                    let endTime;

                    if (checkOutStr && checkOutStr !== 'null') {
                        const [outHour, outMin, outSec] = checkOutStr.split(":").map(Number);
                        endTime = new Date(today.getFullYear(), today.getMonth(), today.getDate(), outHour, outMin, outSec || 0);
                    } else {
                        endTime = new Date(); // 현재 시간 사용
                    }

                    const diffMs = endTime - checkIn;

                    if (diffMs > 0) {
                        const diffMin = Math.floor(diffMs / 60000);
                        const hours = Math.floor(diffMin / 60);
                        const minutes = diffMin % 60;

                        document.getElementById('total-time').textContent = hours + 'h ' + minutes + 'm';
                    }
                }

                // 1초마다 현재시간 갱신
                setInterval(updateCurrentTime, 1000);
                updateCurrentTime(); // 첫 실행

                function checkIn () {
                    if(!${loginUser.classNo}) {
                        alert("수강중인 강의가 없습니다.");
                        return;
                    }
                    window.location.href='checkIn.st';
                }

                function checkOut() {
                    const checkInStr = document.getElementById('checkInTime').value?.trim();
                    if(!checkInStr) {
                        alert("입실해주세요.");
                        return;
                    }
                    window.location.href='checkOut.st';
                }

            </script>
        </section>
        <%-- 자소서 및 이력서 --%>
        <section class="resume-section">
            <div class="announcement-box">
                <p>자료실</p>
                <button class="btn-blank-small">바로가기</button>
            </div>
            <table class="data-table">
                <tbody>
                <tr>
                    <td>수업 자료 파일</td>
                    <td>2024.03.27</td>
                </tr>
                <tr>
                    <td>수업 자료 파일</td>
                    <td>2024.03.27</td>
                </tr>
                <tr>
                    <td>수업 자료 파일</td>
                    <td>2024.03.27</td>
                </tr>
                <tr>
                    <td>수업 자료 파일</td>
                    <td>2024.03.27</td>
                </tr>
                </tbody>
            </table>
        </section>
    </div>
</body>
</html>
