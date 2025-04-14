<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/TeacherStudentDeatil.css">
    <title>Title</title>
</head>
<body>
<jsp:include page="../common/header.jsp" />

<div class="container">
  <div class="form-title">이용자 조회</div>
  <div class="top-container">

    <div class="profile-box">
      <div class="edit-icon">✎</div>
    </div>

    <div class="top-right">
      <!-- 첫 줄 -->
      <div class="form-row-3">
        <div class="form-group">
          <label for="userRole">회원 구분</label>
          <input type="text" class="input-small" id="userRole" name="userRole" value="${user.userRole}" readonly>
        </div>
        <div class="form-group">
          <label for="status">상태</label>
          <input type="text" class="text-status input-small" id="status" name="status" value="${user.userStatus}" readonly>
        </div>
        <div class="form-group">
          <label for="userJoinDate">가입일</label>
          <input type="text" class="text-fill" id="userJoinDate" name="userJoinDate" value="${user.userJoinDate}" readonly>
        </div>
      </div>

      <!-- 두 번째 줄 -->
        <div class="form-group">
          <label for="userName">이름</label>
          <input type="text" id="userName" name="userName" value="${user.userName}" readonly>
        </div>
      <div class="form-row-2">
        <div class="form-group">
          <label for="userNo">회원 번호</label>
          <input type="text" id="userNo" name="userNo" value="${user.userNo}" readonly>
        </div>
        <div class="form-group">
          <label for="userBirth">생년월일</label>
          <input type="date" id="userBirth" name="userBirth" value="${user.userBirth}">
        </div>
      </div>
    </div>
  </div>
  <!-- 하단 컨테이너 -->
  <div class="bottom-container">
    <div class="form-group">
      <label for="userPhone">휴대폰</label>
      <input type="text" id="userPhone" name="userPhone" value="${user.userPhone}">
    </div>
    <div class="form-group">
      <label for="userEmail">이메일 주소</label>
      <input type="email" id="userEmail" name="userEmail" value="${user.userEmail}">
    </div>
    <div class="form-group">
      <label for="userAddress">주소</label>
      <input type="text" id="userAddress" name="userAddress" value="${user.userAddress}">
    </div>
    <div class="form-group">
      <label for="userAddressDetail">상세 주소</label>
      <input type="text" id="userAddressDetail" name="userAddressDetail" value="${user.userAddressDetail}">
    </div>
    <div class="form-group full">
      <label for="className">강의명</label>
      <input type="text" id="className" name="userClassName" value="${user.className}" readonly>
    </div>
  </div>

</div>

</body>
</html>
