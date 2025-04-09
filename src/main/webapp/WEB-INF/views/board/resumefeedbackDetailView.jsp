<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>자소서 피드백 상세</title>
  <link rel="stylesheet" href="/css/resumefeedbackDetailView.css">
</head>
<body>
<jsp:include page="../common/header.jsp"/>

<div class="container">

  <div class="title-area">
    <div class="board-title">${b.title}</div>

    <div class="button-area">
      <c:choose>
        <c:when test="${u.userRole == 1}">
        </c:when>
        <c:otherwise>
          <button onclick="">수정</button>
        </c:otherwise>
      </c:choose>
      <button onclick="history.back()">이전화면</button>
<%--      <button onclick="location.href='myclassList.bo'">목록</button>--%>
    </div>

    <div class="info-bar">
      <div class="left">${type}</div>
      <div class="right">작성자: 최지투 | ${b.writeDate}</div>
    </div>
  </div>



  <!-- 본문 + 댓글 영역 -->
    <div class="content-area">
      <div class="board-content">
        ${b.content}
      </div>
    </div>
  </div>

</body>
</html>
