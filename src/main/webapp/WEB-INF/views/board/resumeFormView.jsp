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
            margin-left: 895px;
        }

        #btn2{
            margin-left: 30px;
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
    </div>
</body>
</html>
