<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>우리반 게시판 상세</title>
  <link rel="stylesheet" href="/css/myclassDetail.css">
</head>
<body>
<jsp:include page="../common/header.jsp"/>

<div class="container">

  <div class="title-area">
    <div class="board-title">우리반 게시판 제목</div>

    <div class="button-area">
      <button onclick="history.back()">이전화면</button>
      <button onclick="location.href='myclassList.bo'">목록</button>
    </div>

    <div class="info-bar">
      <div class="left">우리반 게시판</div>
      <div class="right">작성자: 작성자명 | 2025.03.20</div>
    </div>
  </div>



  <!-- 본문 + 댓글 영역 -->
    <div class="content-area">
      <div class="board-content">
        무슨내용을 공지했을까요.
      </div>
      <div class="comment-section">
        <div class="comment-count">댓글 (2)</div>
        <div class="comment-header-line"></div> <!-- ← 여기 선 들어감 -->

        <!-- 댓글1 -->
        <div class="comment">
          <div class="comment-header">
            <div class="author">작성자명</div>
            <div class="date">2025.03.21</div>
          </div>
          <div class="text">
            댓글 내용인데 여기에 내용이 얼마나 들어갈지 위치는 어느정도로 해야하는지...
          </div>
        </div>

        <!-- 댓글2 -->
        <div class="comment">
          <div class="comment-header">
            <div class="author">작성자명</div>
            <div class="date">2025.03.21</div>
          </div>
          <div class="text">
            댓글 내용입니다.
          </div>
        </div>

        <!-- 댓글 입력창 -->
        <div class="comment-input-wrapper">
          <input type="text" class="comment-input" placeholder="댓글을 입력하세요.">
          <button class="comment-submit">등록</button>
        </div>

      </div>
    </div>

  </div>

</body>
</html>
