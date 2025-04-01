<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>과정 목록</title>
    <link rel="stylesheet" type="text/css" href="/css/courseList.css">
</head>
<body>
<jsp:include page="../common/header.jsp" />
        <div class="container">
            <% for (int i = 0; i < 6; i++) { %>
            <div class="course-card">
                <div class="left-info">
                    <div class="label">과정명</div>
                    <div class="title-row">
                        <div class="title">AWS 클라우드 기반 Devops 개발자 양성 과정 ( S 반 )</div>
                        <div class="progress-percent">75%</div>
                    </div>
                    <progress class="custom-progress" max="100" value="75"></progress>

                    <div class="date">2024.12.17 ~ 2025.07.18  |  09:00 ~ 18:00</div>
                </div>
                <div class="right-info">
                    <button class="manage-btn">반 관리</button>
                </div>
            </div>
            <% } %>
        </div>

</body>

</html>