<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>자소서 상세보기</title>
    <style>
        .wrap {
            margin-left: 310px;
            margin-top: 165px;
            width: 1560px;
            height: 915px;
            background-color: #FFFFFF;
            padding-top: 36px;
        }

        .header-line {
            width: 1420px;
            height: 130px;
            margin-left: 70px;
            margin-top: 30px;
            border: 1px solid #000;
            position: relative;
            box-sizing: border-box;
        }

        .header-title {
            position: absolute;
            top: 20px;
            left: 50%;
            transform: translateX(-50%);
            font-size: 24px;
            font-weight: bold;
        }

        .button-group {
            position: absolute;
            top: 20px;
            right: 20px;
            display: flex;
            gap: 10px;
        }

        .btn-blank-small {
            width: 80px;
            height: 36px;
            border: 1px solid #003251;
            border-radius: 6px;
            background: white;
            color: #003251;
            font-size: 14px;
            cursor: pointer;
        }

        .info-group {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 50px;
            background-color: #F1F1F1;
            border-top: 1px solid #ccc;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
            box-sizing: border-box;
            font-size: 16px;
            color: #333;
        }
    </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>

<div class="wrap">
    <div class="header-line">
        <!-- 제목 -->
        <div class="header-title">삼성 자소서</div>

        <!-- 버튼 -->
        <div class="button-group">
            <button class="btn-blank-small">이전화면</button>
            <button class="btn-blank-small">수정</button>
            <button class="btn-blank-small">삭제</button>
        </div>

        <!-- 하단 info-group -->
        <div class="info-group">
            <div>자소서 or 이력서</div>
            <div>2025.03.20</div>
        </div>
    </div>
</div>

</body>
</html>
