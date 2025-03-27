<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>공지사항</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">

</head>
<body>

<div class="layout">
  <jsp:include page="../common/header.jsp" />
  <header class="header">
    <div class="breadcrumb">
      <span class="breadcrumb-icon"></span>
      <span class="breadcrumb-text">커뮤니티</span>
    </div>
    <h1 class="page-title">공지사항</h1>
    <div class="user-info">
      <img class="profile-img" src="https://placehold.co/70x70" alt="프로필">
      <div class="welcome-msg">
        <span>환영합니다.</span>
        <strong>KH학생</strong>님
      </div>
      <div class="dropdown-arrow"></div>
    </div>
  </header>


  <main class="main-content">
    <h2>공지사항</h2>
    <table class="notice-table">
      <thead>
      <tr>
        <th>글번호</th>
        <th>지점</th>
        <th>제목</th>
        <th>작성자</th>
        <th>조회수</th>
        <th>작성일</th>
      </tr>
      </thead>
      <tbody>
      <tr>
        <td>10</td>
        <td>서울 강남</td>
        <td>[안내] 2025년 봄 학기 개강 일정</td>
        <td>관리자</td>
        <td>152</td>
        <td>2025-03-01</td>
      </tr>
      <tr>
        <td>9</td>
        <td>부산 서면</td>
        <td>[필독] 교육비 납부 마감 안내</td>
        <td>관리자</td>
        <td>98</td>
        <td>2025-02-27</td>
      </tr>
      <tr>
        <td>8</td>
        <td>대전 유성</td>
        <td>2월 우수 수강생 발표</td>
        <td>운영팀</td>
        <td>74</td>
        <td>2025-02-20</td>
      </tr>
      <tr>
        <td>7</td>
        <td>광주 첨단</td>
        <td>기초반 시간표 변경 안내</td>
        <td>담당자</td>
        <td>63</td>
        <td>2025-02-15</td>
      </tr>
      <tr>
        <td>6</td>
        <td>서울 강남</td>
        <td>[공지] 설 연휴 휴강 일정</td>
        <td>운영팀</td>
        <td>112</td>
        <td>2025-02-01</td>
      </tr>
      </tbody>

    </table>

    <div class="pagination">
      <a href="#" class="arrow prev">&lt;</a>
      <a href="#" class="page active">1</a>
      <a href="#" class="page">2</a>
      <a href="#" class="page">3</a>
      <a href="#" class="arrow next">&gt;</a>
    </div>
  </main>
</div>
</body>
</html>
