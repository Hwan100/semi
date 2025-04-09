<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>과정 목록</title>
    <link rel="stylesheet" type="text/css" href="/css/courseList.css">
</head>
<body>
<jsp:include page="../common/header.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">
    <!-- 실제 DB에서 가져온 강의 목록을 반복 출력 -->
    <c:forEach var="c" items="${classList}">
        <div class="course-card ${c.progress == 100 ? 'completed' : ''}">
            <div class="left-info">
                <div class="label">강의명</div>
                <div class="title-row">
                    <div class="title">${c.className}</div>
                    <div class="progress-percent">진행률: ${c.progress}%</div>
                </div>
                <progress class="custom-progress" value="${c.progress}" max="100"></progress>
                <div class="date">${c.startDate} ~ ${c.endDate}</div>
            </div>
            <div class="right-info">
                <button class="manage-btn">관리</button>
            </div>
        </div>
    </c:forEach>

</div>

</body>

</html>