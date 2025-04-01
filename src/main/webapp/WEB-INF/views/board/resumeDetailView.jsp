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
            margin-top: 160px;
            margin-right: 40px;
            /*width: 1560px;*/
            height: 915px;
            background-color: #FFFFFF;
            padding-top: 36px;
        }


        .header-line {
            /*width: 1420px;*/
            height: 130px;
            margin-left: 70px;
            margin-right: 70px;
            margin-top: 30px;

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



        .info-group {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 50px;
            background-color: #F1F1F1;
            border-top: 1px solid ;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
            box-sizing: border-box;
            font-size: 16px;
            color: #333;
        }

        .contents-line{
            /*width: 1420px;*/
            height: 685px;
            border: solid 1px;
            margin-top: 30px;
            margin-left: 70px;
            margin-right: 70px;
        }

        .contents{
            /*width: 1320px;*/
            width: calc(100% - 100px);
            display: flex;
            align-items: center;
            /*width: 93%;*/
            height: 450px;
            resize: none;
            border: solid 1px;
            margin-left: 50px;
            margin-right: 50px;
            margin-top: 35px;
            font-size: 16px;
            box-sizing: border-box;
        }

        .file-line{
            display: flex;
            align-items: center;
            /*width: 1320px;*/
            /*width: 93%;*/
            height: 35px;
            background-color: #F4F4F4;
            margin-top: 30px;
            margin-left: 50px;
            margin-right: 50px;
            border: solid 1px #D9D9D9 ;
        }
        .file-line img{
            margin-left: 7px;
            margin-right: 7px;
            margin-top: 5px;
        }

        .file{
            margin-left: 20px;
            font-size: 16px;
        }
        .file:hover,.file-line img:hover{
            cursor: pointer;
        }

        .btn-line{
            width: 100%;
            height: 50px;
            position: relative;

        }

        .btn2{
            display: flex;
            position: absolute;
            align: center;
            top: 30px;
            left: 50%; /* 왼쪽 기준으로 50% 위치로 이동 */
            transform: translateX(-50%);
            gap: 10px;
        }
    </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>

<div class="wrap">
    <div class="semi-wrap">
        <div class="header-line">
            <!-- 제목 -->
            <div class="header-title">삼성 자소서</div>

            <!-- 버튼 -->
            <div class="button-group">
                <button class="btn-blank-small">이전화면</button>
                <button class="btn-blank-small">삭제</button>
            </div>

            <!-- 하단 info-group -->
            <div class="info-group">
                <div>자소서</div>
                <div>2025.03.20</div>
            </div>
        </div>
        <div class="contents-line">
            <textarea class="contents">자소서 내용인데요 양식처럼 분류를 해서 보일지 아니면 그냥 이대로 놔둘지 모르겠네요</textarea>
            <div class="file-line">
                <span><img src="/icons/paperclip.png"></span>
                <div class="file">첨부 파일 0개</div>
            </div>
            <div class="file-line" style="margin-top: 0px; background-color: white">
                <span><img src="/icons/download.png"></span>
                <div class="file">파일명</div>
            </div>
            <div class="btn-line">
                <div class="btn2">
                    <button class="btn-blank-small">수정</button>
                    <button class="btn-blank-small">취소</button>
                </div>
            </div>
        </div>

    </div>

</div>

</body>
</html>
