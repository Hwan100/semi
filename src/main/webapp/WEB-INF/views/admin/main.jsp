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
</head>
<body>
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
    <%-- 반 자소서 및 이력서 현황 --%>
    <section class="resume-section">
        <div class="resume-title">
            <h2>자소서 및 이력서 현황</h2>
            <button class="btn-blank-small">바로가기</button>
        </div>
        <div class="resume-items">
            <div>
                <img src="/icons/managedResume.png" alt="관리중인 자소서 및 이력서">
                <p class="resume-item-title">관리중인 자소서 및 이력서</p>
                <p class="right bottom"><span class="primary-bold">20</span>개</p>
            </div>
            <div>
                <img src="/icons/checkedResume.png" alt="확인한 자소서 및 이력서">
                <p class="resume-item-title">확인한 자소서 및 이력서</p>
                <p class="right bottom"><span class="primary-bold">20</span>개</p>
            </div>
            <div>
                <img src="/icons/notCheckResume.png" alt="미확인 자소서 및 이력서">
                <p class="resume-item-title">미확인 자소서 및 이력서</p>
                <p class="right bottom"><span class="primary-bold">20</span>개</p>
            </div>
        </div>
    </section>
    <%-- 일정 --%>
    <section class="progress-section">
        <h2>반별 진행상황</h2>
        <table class="notice-table">
            <thead>
            <tr>
                <th>과정명</th>
                <th>진척도</th>
                <th>진행상황</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>aws 클라우드 기반...</td>
                <td><progress class="custom-progress" max="100" value="75"></progress></td>
                <td>자바 기초</td>
                <td><button class="btn-small">바로가기</button></td>
            </tr>
            </tbody>
        </table>
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
                <td>[HRD공지사항] HRD-Net 단독회원 서비스 중지 및 원... </td>
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
                <td>[HRD공지사항] HRD-Net 단독회원 서비스 중지 및 원... </td>
                <td>행정팀</td>
                <td>2024.03.23</td>
            </tr>
            <tr>
                <td>15</td>
                <td>[HRD공지사항] HRD-Net 단독회원 서비스 중지 및 원... </td>
                <td>행정팀</td>
                <td>2024.03.20</td>
            </tr>
            <tr>
                <td>14</td>
                <td>[HRD공지사항] HRD-Net 단독회원 서비스 중지 및 원... </td>
                <td>행정팀</td>
                <td>2024.03.19</td>
            </tr>
            <tr>
                <td>13</td>
                <td>[HRD공지사항] HRD-Net 단독회원 서비스 중지 및 원... </td>
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
                <td>[HRD공지사항] HRD-Net 단독회원 서비스 중지 및 원... </td>
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
                <td>[HRD공지사항] HRD-Net 단독회원 서비스 중지 및 원... </td>
                <td>행정팀</td>
                <td>2024.03.23</td>
            </tr>
            <tr>
                <td>15</td>
                <td>[HRD공지사항] HRD-Net 단독회원 서비스 중지 및 원... </td>
                <td>행정팀</td>
                <td>2024.03.20</td>
            </tr>
            <tr>
                <td>14</td>
                <td>[HRD공지사항] HRD-Net 단독회원 서비스 중지 및 원... </td>
                <td>행정팀</td>
                <td>2024.03.19</td>
            </tr>
            <tr>
                <td>13</td>
                <td>[HRD공지사항] HRD-Net 단독회원 서비스 중지 및 원... </td>
                <td>행정팀</td>
                <td>2024.03.19</td>
            </tr>
            </tbody>
        </table>
    </section>
    <%-- 스케쥴 --%>
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
