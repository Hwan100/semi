<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>우리반 게시판 상세</title>
  <style>
    body {
      margin: 0;
      font-family: 'Inter', sans-serif;
      background: #E0F7FF;
    }

    .content-container {
      position: relative;
      margin-left: 270px;
      padding-top: 160px;
      padding-right: 20px;
    }

    .content-box {
      max-width: 1400px;
      margin: 0 auto;
      background: white;
      border-radius: 20px;
      box-shadow: 0 4px 4px rgba(0, 0, 0, 0.2);
      padding: 40px;
    }

    .board-title {
      font-size: 28px;
      font-weight: 700;
      margin-bottom: 20px;
    }

    .info-bar {
      height: 70px;
      background: #F1F1F1;
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 0 30px;
      margin-bottom: 30px;
      border-radius: 10px;
    }

    .info-bar .left,
    .info-bar .right {
      color: #000;
      font-size: 16px;
      font-weight: 400;
    }

    .board-content {
      padding: 20px;
      border: 1px solid #ccc;
      background: #fff;
      white-space: pre-wrap;
      font-size: 16px;
      color: #444;
      min-height: 200px;
      border-radius: 10px;
    }

    .comment-section {
      margin-top: 50px;
    }

    .comment-section h4 {
      font-size: 18px;
      margin-bottom: 15px;
    }

    .comment {
      display: flex;
      justify-content: space-between;
      padding: 10px 0;
      border-bottom: 1px solid #e0e0e0;
      font-size: 15px;
    }

    .comment .author {
      font-weight: 600;
      margin-bottom: 5px;
    }

    .comment .date {
      font-size: 13px;
      color: #888;
      white-space: nowrap;
    }

    .button-group {
      margin-top: 40px;
      display: flex;
      justify-content: flex-end;
      gap: 10px;
    }

    .button-group button {
      padding: 10px 20px;
      border-radius: 10px;
      border: 2px solid #003251;
      background: transparent;
      color: #003251;
      font-weight: 600;
      cursor: pointer;
      font-size: 14px;
    }

    .button-group button:hover {
      background: #003251;
      color: #fff;
    }
  </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>

<div class="content-container">
  <div class="content-box">

    <div class="board-title">우리반 게시판 제목</div>

    <div class="info-bar">
      <div class="left">우리반 게시판</div>
      <div class="right">작성자: 작성자명 | 2025.03.20</div>
    </div>

    <div class="board-content">
      무슨내용을 공지했을까요.
    </div>

    <div class="comment-section">
      <h4>댓글 (2)</h4>
      <hr>

      <div class="comment">
        <div>
          <div class="author">작성자명</div>
          <div>댓글 내용인데 여기에 내용이 얼마나 들어갈지 위치는 어느정도로 해야하는지...</div>
        </div>
        <div class="date">2025.03.21</div>
      </div>

      <div class="comment">
        <div>
          <div class="author">작성자명</div>
          <div>댓글 내용입니다.</div>
        </div>
        <div class="date">2025.03.21</div>
      </div>
    </div>

    <div class="button-group">
      <button onclick="history.back()">이전화면</button>
      <button onclick="location.href='myclassList.bo'">목록</button>
    </div>
  </div>
</div>
</body>
</html>
