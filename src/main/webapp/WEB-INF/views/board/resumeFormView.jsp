<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>

    <style>
        .wrap{
            margin-left: 316px;
            margin-top: 165px ;
            width: 1560px;
            height: 815px;
            background-color: #FFFFFF;
            padding-top: 36px;
        }

        .header-bar{
            display: flex;
            margin-left: 68px;
            width: 1420px;
            height: 60px;
        }

        .header-bar-title{
            display: flex;
            margin-left: 40px;
            font-size: 24px;
            align-items: center;
            font-weight: 550;
        }

        #btn1{
            margin-left: 875px;
        }

        #btn2{
            margin-left: 30px;
        }

        .contents{
            width: 1210px;
            height: 700px;
            border: solid 1px;
            margin-left: 175px;
        }

        .contents-top-line{
            width: 464px;
            height: 110px;
            border: solid 1px;
            margin-left: 44px;
            margin-top: 28px;
        }

        .contents-title-line{
            width:464px;
            height: 40px;
            border: solid 1px;
        }
    </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
    <div class="wrap">
        <div class="header-bar">
            <div class="header-bar-title">자기소개서 및 이력서 작성</div>
            <button class="btn-blank-small" id="btn1">이전화면</button>
            <button class="btn-blank-small" id="btn2">등록</button>
        </div>
        <div class="contents">
            <div class="contents-top-line">
                <div class="contents-title-line">하이요</div>
            </div>
        </div>
    </div>
</body>
</html>
