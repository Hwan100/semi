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
    <div class="board-title">자소서 피드백</div>

    <div class="button-area">
      <button onclick="">수정</button>
      <button onclick="history.back()">이전화면</button>
<%--      <button onclick="location.href='myclassList.bo'">목록</button>--%>
    </div>

    <div class="info-bar">
      <div class="left">자소서</div>
      <div class="right">작성자: 작성자명 | 2025.03.20</div>
    </div>
  </div>



  <!-- 본문 + 댓글 영역 -->
    <div class="content-area">
      <div class="board-content">
        무슨내용을 공지했을까요.
      </div>
    </div>
  </div>

</body>
</html>
