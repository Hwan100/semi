<%--
  Created by IntelliJ IDEA.
  User: user1
  Date: 25. 3. 27.
  Time: 오후 12:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>EduTrack</title>
    <link rel="stylesheet" href="style.css"> <!-- 공통 CSS -->
    <!-- JavaScript -->
    <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <div class="container">
        <%--@ include file="sidebar.jsp" --%>  <!-- 좌측 네비게이션 -->
        <jsp:include page="sidebar.jsp" />

        <div class="main-content">
            <%--@ include file="topbar.jsp" --%>  <!-- 상단 프로필 바 -->
            <jsp:include page="topbar.jsp" />

            <!-- 이 아래에 각 페이지에서 내용이 들어감 -->
<%--            <jsp:include page="${contentPage}" />--%>
        </div>
    </div>
</body>
</html>
