<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Title</title>
    <style>
        .wrap {
            
            color: #74788D;
            margin-left: 310px;
            margin-top: 160px;
            margin-right: 40px;
            background-color: #FFFFFF;
            padding-top: 36px;
            border-radius: 20px;
            padding-bottom: 50px;
        }

        .header-line {
            color: black;
            height: 30px;
            margin-left: 50px;
            margin-right: 70px;
            margin-top: 30px;
            font-size: 24px;
            font-weight: bold;
        }

        .logo-line {
            display: flex;
            margin-top: 30px;
            height: 200px;
            margin-left: 70px;
            margin-right: 70px;
            font-size: 20px;
        }

        .siteName-line {
            display: flex;
            margin-top: 30px;
            height: 30px;
            margin-left: 70px;
            margin-right: 70px;
            font-size: 20px;
        }

        input{
            width: 300px;
            height: 30px;
            border: solid 1px;
            border-radius: 5px;
            font-size: 16px;
        }

        .fileLimit-line{
            display: flex;
            margin-top: 140px;
            font-size: 20px;
            margin-left: 70px;
            margin-right: 70px;
        }

        .guide-line{
            margin-left: 285px;
            margin-top: 10px;
            color: #74788D;
            font-size: 16px;
        }

        .button-line{
            display: flex;
            justify-content: center;
            margin-top: 85px;

        }
    </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
    <div class="wrap">
        <div class="header-line">
            학원 설정
        </div>
        <div class="logo-line">
            로고이미지
            <img src="/icons/logo2.png" style="margin-left: 130px; margin-right: 10px">
            <div style="display: flex; flex-direction: column; font-size: 16px;">
                png파일로 300x150 사이즈로 등록해주세요.
                <div style="margin-top: 140px;">
                    <button class="btn-blank-small" style="margin-right: 10px;">로고 등록</button>
                    <button class="btn-blank-small">삭제</button>
                </div>
            </div>
        </div>
        <div class="siteName-line">
            <span style="margin-right: 63px">학원 웹사이트 명</span>
            <input type="text" style="border: solid 1px #74788D">
        </div>
        <div class="fileLimit-line">
            <span style="margin-right: 63px">업로드 불가 파일</span>
            <input type="text" style="border: solid 1px #74788D">
        </div>
        <div class="guide-line">
            ※ 업로드를 제한할 파일 확장자를 ,(쉼표)로 구분해서 등록해주세요.
        </div>
        <div class="button-line">
            <button class="btn-blank" style="margin-right: 40px">저장</button>
            <button class="btn-blank">취소</button>
        </div>
    </div>
</body>
</html>
