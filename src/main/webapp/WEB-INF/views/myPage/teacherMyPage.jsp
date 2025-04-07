<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/MyPage.css">
    <title>TeacherMyPage</title>
</head>
<body>
<jsp:include page="../common/header.jsp" />

<div class="background-box">
    <div class="form-title">개인정보 수정</div>

    <form action="teacherUpdate.me" method="post">

        <!-- 🔵 상단: 프로필 + 기본 정보 -->
        <div class="top-info-wrapper">
            <div class="profile-box">
                <div class="edit-icon">✎</div>
            </div>

            <div class="top-grid">
                <div class="form-group">
                    <label for="userRole">회원 구분</label>
                    <input type="text" id="userRole" name="userRoleDisplay" class="userRoleDisplay" value="강사" readonly>
                    <input type="hidden" name="userRole" value="2">
                </div>
                <div class="form-group">
                    <label for="userName">이름</label>
                    <input type="text" id="userName" name="userName" value="${loginUser.userName}">
                </div>
                <div class="form-group">
                    <label for="userNo">회원 번호</label>
                    <input type="text" id="userNo" name="userNo" value="${loginUser.userNo}" readonly>
                    <input type="hidden" name="userId" value="${loginUser.userId}">
                </div>
                <div class="form-group">
                    <label for="userBirth">생년월일</label>
                    <input type="date" id="userBirth" name="userBirth" value="${loginUser.userBirth}">
                </div>
            </div>
        </div>

        <!-- 🔵 하단: 연락처 및 기타 정보 -->
        <div class="bottom-info-wrapper">
            <div class="form-group">
                <label for="userPhone">휴대폰</label>
                <input type="text" id="userPhone" name="userPhone" value="${loginUser.userPhone}">
            </div>
            <div class="form-group">
                <label for="userEmail">이메일 주소</label>
                <input type="email" id="userEmail" name="userEmail" value="${loginUser.userEmail}">
            </div>
            <div class="form-group">
                <label for="userAddress">주소</label>
                <input type="text" id="userAddress" name="userAddress" value="${loginUser.userAddress}">
            </div>
            <div class="form-group">
                <label for="userAddressDetail">상세 주소</label>
                <input type="text" id="userAddressDetail" name="userAddressDetail" value="${loginUser.userAddressDetail}">
            </div>
            <div class="form-group full">
                <label for="className">강의명</label>
                <input type="text" id="className" name="userClassName" value="${loginUser.className}" readonly>
            </div>
        </div>

        <button type="submit" class="submit-btn">수정 완료</button>
    </form>
</div>
</body>
</html>
