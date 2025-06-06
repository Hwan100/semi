<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminMyPage.css">
    <title>AdminMyPage</title>
</head>
<body>
<jsp:include page="../common/header.jsp" />

<div class="background-box">
    <div class="form-title">개인정보 수정</div>

    <form action="adminUpdate.me" method="post">

        <!-- 🔵 상단: 프로필 + 기본 정보 -->
        <div class="top-info-wrapper">
            <div class="profile-box">
                <div class="edit-icon">✎</div>
            </div>

            <div class="top-content">

                <!-- 🔸 구분 / 상태 / 가입일 한 줄 -->
                <div class="form-group-row">
                    <div class="form-group">
                        <label for="userType">구분</label>
                        <input type="text" id="userType" name="userType" value="강사" readonly>

                    </div>
                    <div class="form-group">
                        <label for="userStatus">상태</label>
                        <c:choose>
                            <c:when test="${not empty loginUser && loginUser.userStatus eq 'Y'}">
                                <input type="text" id="userStatus" name="userStatus" value="정상" readonly>
                            </c:when>
                            <c:when test="${not empty loginUser && loginUser.userStatus == 'N'}">
                                <input type="text" id="userStatus" name="userStatus" value="탈퇴" readonly>
                            </c:when>
                            <c:otherwise>
                                <input type="text" id="userStatus" name="userStatus" value="휴면" readonly>
                            </c:otherwise>
                        </c:choose>

                    </div>
                    <div class="form-group">
                        <label for="enrollDate">가입일</label>
                        <input type="text" id="enrollDate" name="enrollDate" value="${loginUser.userJoinDate}" readonly>
                    </div>
                </div>

                <!-- 🔸 이름 / 학생 번호 -->
                <div class="top-grid">
                    <div class="form-group">
                        <label for="userName">이름</label>
                        <input type="text" id="userName" name="userName" value="${loginUser.userName}" readonly>
                    </div>
                    <div class="form-group">
                        <label for="studentNo">학생 번호</label>
                        <input type="text" id="studentNo" name="studentNo" value="${loginUser.userNo}" readonly>
                        <input type="hidden" name="userId" value="${loginUser.userId}">
                    </div>
                </div>

            </div>
        </div>

        <!-- 🔵 하단: 연락처 및 기타 정보 -->
        <div class="bottom-info-wrapper">
            <div class="form-group">
                <label for="userPhone">휴대폰 <span class="required">*</span></label>
                <input type="text" id="userPhone" name="userPhone" value="${loginUser.userPhone}">
            </div>
            <div class="form-group">
                <label for="userEmail">이메일 주소 <span class="required">*</span></label>
                <input type="email" id="userEmail" name="userEmail" value="${loginUser.userEmail}">
            </div>
            <div class="form-group">
                <label for="userAddress">주소 <span class="required">*</span></label>
                <input type="text" id="userAddress" name="userAddress" value="${loginUser.userAddress}">
            </div>
            <div class="form-group">
                <label for="userAddressDetail">상세 주소 <span class="required">*</span></label>
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



<script>
    document.addEventListener('DOMContentLoaded', function () {
        const statusSelect = document.getElementById('userStatus');

        function updateStatusTextColor() {
            const value = statusSelect.value;

            // 초기화
            statusSelect.style.color =
                value === '정상' ? '#4CAF50' :
                    value === '탈퇴' ? '#F44336' :
                        value === '휴면' ? '#9E9E9E' : 'black';
        }

        // 최초 로드 + 변경 시 모두 적용
        statusSelect.addEventListener('change', updateStatusTextColor);
        updateStatusTextColor();
    });
</script>


</body>
</html>
