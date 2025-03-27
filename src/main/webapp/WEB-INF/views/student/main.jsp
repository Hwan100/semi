<%--
  Created by IntelliJ IDEA.
  User: user1
  Date: 25. 3. 27.
  Time: 오전 11:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/student.css">
    <link rel="stylesheet" href="/css/varibles.css">
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
                <div>
                    <button>내 정보 수정</button>
                    <button>수강정보</button>
                </div>
            </div>
        </section>
        <%-- 출석 요약 --%>
        <section class="attendance-section"></section>
        <%-- 일정 --%>
        <section class="schedule-section"></section>
        <%-- 공지사항 --%>
        <section class="announcement-section"></section>
        <%-- 우리반 게시판 --%>
        <section class="board-section"></section>
        <%-- 입실 퇴실 --%>
        <section class="checkin-section"></section>
        <%-- 자소서 및 이력서 --%>
        <section class="resume-section"></section>
    </div>
</body>
</html>
