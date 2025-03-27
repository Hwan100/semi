<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>개인정보 수정</title>
    <style>
        body {
            margin: 0;
            padding: 160px 40px 40px;
            background-color: #E0F7FF;
            font-family: 'Inter', sans-serif;
        }

        .background-box {
            max-width: 1100px;
            margin: 130px 0 0 350px;
            transform: translateX(250px);
            background: #ffffff;
            border-radius: 20px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            padding: 60px 80px;
        }

        .form-title {
            font-size: 24px;
            font-weight: bold;
            color: #003252;
            margin-bottom: 40px;
        }

        .top-info-wrapper {
            display: flex;
            gap: 40px;
            margin-bottom: 40px;
        }

        .profile-box {
            width: 130px;
            height: 130px;
            border-radius: 50%;
            background: #d9d9d9;
            position: relative;
            flex-shrink: 0;
        }

        .edit-icon {
            position: absolute;
            right: -5px;
            bottom: -5px;
            width: 36px;
            height: 36px;
            border-radius: 50%;
            background: #0B9BE3;
            color: white;
            font-size: 18px;
            font-weight: bold;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }

        .top-grid {
            flex: 1;
            display: grid;
            grid-template-columns: 1fr 1fr;
            column-gap: 40px;
            row-gap: 25px;
        }

        .bottom-info-wrapper {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 25px 40px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group label {
            font-size: 14px;
            font-weight: 600;
            color: #003252;
            margin-bottom: 6px;
        }

        .form-group input {
            height: 40px;
            padding: 0 10px;
            font-size: 14px;
            border: 3px solid #E7E7E7;
            border-radius: 10px;
        }

        .form-group.full {
            grid-column: span 2;
        }

        .submit-btn {
            margin-top: 40px;
            width: 100%;
            height: 50px;
            background-color: #0B9BE3;
            color: white;
            font-size: 16px;
            font-weight: 500;
            border: none;
            border-radius: 10px;
            cursor: pointer;
        }

        .submit-btn:hover {
            background-color: #007ec0;
        }
    </style>
</head>
<body>

<jsp:include page="../common/header.jsp" />

<div class="background-box">
    <div class="form-title">개인정보 수정</div>

    <form action="update.me" method="post">

        <!-- 🔵 상단: 프로필 + 기본 정보 -->
        <div class="top-info-wrapper">
            <div class="profile-box">
                <div class="edit-icon">✎</div>
            </div>

            <div class="top-grid">
                <div class="form-group">
                    <label for="userRole">회원 구분</label>
                    <input type="text" id="userRole" name="userRole" value="${loginUser.userRole}" readonly>
                </div>
                <div class="form-group">
                    <label for="userName">이름</label>
                    <input type="text" id="userName" name="userName" value="${loginUser.userName}" readonly>
                </div>
                <div class="form-group">
                    <label for="userNo">학생 번호</label>
                    <input type="text" id="userNo" name="userNo" value="${loginUser.userNo}" readonly>
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