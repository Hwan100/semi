<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>우리반게시판</title>

  <style>
    .body-wrapper {
      margin-left: 270px;
      padding-top: 160px;
      background: #E0F7FF;
      min-height: 100vh;
      overflow-y: auto;
      padding-right: 20px;
    }

    .board-container {
      max-width: 1200px;
      margin: 0px 40px ;
      background: white;
      border-radius: 20px;
      box-shadow: 0 4px 4px rgba(0, 0, 0, 0.2);
      padding: 40px 50px;
    }

    .board-title {
      font-size: 28px;
      font-weight: 700;
      margin-bottom: 20px;
    }

    .board-header {
      display: flex;
      background: rgba(11, 155, 227, 0.4);
      border: 1px solid #E7E7E7;
      font-weight: 600;
      color: #003252;
      text-align: center;
    }

    .board-header div {
      padding: 12px 0;
    }

    .board-row {
      display: flex;
      border-bottom: 1px solid #E7E7E7;
      font-size: 14px;
      color: #003252;
    }

    .board-row div {
      padding: 10px 0;
      text-align: center;
    }

    .board-title-cell {
      flex: 1;
      padding: 10px;
      text-align: left;
    }

    .board-title-cell a {
      color: #003252;
      text-decoration: none;
    }

    .board-pagination {
      margin-top: 30px;
      display: flex;
      justify-content: center;
      gap: 10px;
    }

    .board-pagination a {
      width: 30px;
      height: 30px;
      display: flex;
      align-items: center;
      justify-content: center;
      border: 1px solid black;
      border-radius: 4px;
      color: black;
      text-decoration: none;
    }

    .board-pagination a.active {
      background: #0B9BE3;
      color: white;
    }
  </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>

<div class="body-wrapper">
  <div class="board-container">

    <!-- 제목 + 설명: 바로 옆 배치 -->
    <div style="display: flex; align-items: center; margin-bottom: 20px;">
      <div class="board-title" style="margin-right: 15px;">우리반 게시판</div>
      <div style="color: #74788D; font-size: 14px; font-family: Inter; font-weight: 400;">
        AWS 클라우드 기반 Devops 개발자 양성 과정 ( S 반 )
      </div>
    </div>

    <!-- 테이블 헤더 -->
    <div class="board-header">
      <div style="flex: 0 0 100px;">글번호</div>
      <div style="flex: 0 0 130px;">지점</div>
      <div style="flex: 1;">제목</div>
      <div style="flex: 0 0 150px;">작성자</div>
      <div style="flex: 0 0 100px;">조회수</div>
      <div style="flex: 0 0 100px;">작성일</div>
    </div>

    <!-- 게시글 리스트 -->
    <c:forEach var="b" items="${list}">
      <div class="board-row">
        <div style="flex: 0 0 100px;">${b.boardNo}</div>
        <div style="flex: 0 0 130px;">${b.branch}</div>
        <div class="board-title-cell">
          <a href="detail.bo?bno=${b.boardNo}">${b.boardTitle}</a>
        </div>
        <div style="flex: 0 0 150px;">${b.boardWriter}</div>
        <div style="flex: 0 0 100px;">${b.count}</div>
        <div style="flex: 0 0 100px;">${b.createDate}</div>
      </div>
    </c:forEach>

    <!-- 페이지네이션 -->
    <!-- 게시글 리스트 -->
    <!-- ✅ 예시 게시글 (임시 데이터) -->
    <div class="board-row">
      <div style="flex: 0 0 100px;">999</div>
      <div style="flex: 0 0 130px;">강남지점</div>
      <div class="board-title-cell">
        <a href="detail.bo?bno=${b.boardNo}">[예시] 시스템 점검 안내</a>
      </div>
      <div style="flex: 0 0 150px;">관리자</div>
      <div style="flex: 0 0 100px;">123</div>
      <div style="flex: 0 0 100px;">2025-03-27</div>
    </div>

    <!-- ✅ 실제 게시글 반복 -->
    <c:forEach var="b" items="${list}">
      <div class="board-row">
        <div style="flex: 0 0 100px;">${b.boardNo}</div>
        <div style="flex: 0 0 130px;">${b.branch}</div>
        <div class="board-title-cell">
          <a href="detail.bo?bno=${b.boardNo}">${b.boardTitle}</a>
        </div>
        <div style="flex: 0 0 150px;">${b.boardWriter}</div>
        <div style="flex: 0 0 100px;">${b.count}</div>
        <div style="flex: 0 0 100px;">${b.createDate}</div>
      </div>
    </c:forEach>


  </div>
</div>
</body>
</html>
