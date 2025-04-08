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
            /*height: 915px;*/
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
            border: solid 1px;
            height: 685px;
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

        .feedback-line{
            text-align: center;
            border: solid 1px;
            height: 550px;
            margin-top: 30px;
            margin-left: 70px;
            margin-right: 70px;
        }

        .feedback-header-line{
            margin-top: 35px;
            margin-right: 50px;
            margin-left: 50px;
            height: 50px;
        }

        .feedback-body-line{
            display: flex;
            margin-top: 30px;
            margin-left: 50px;
            margin-right: 50px;

        }
        .feedback-list{
            width: 100%;
        }

        .top-bar{
            height: 50px;
            font-weight: 500;
            font-size: 20px;
            font-weight: 900;
            background-color: #9DD7F4;
            border: 1px solid #e0e0e0;
        }

        .bar{
            cursor: pointer;
            height: 50px;
            font-weight: 500;
            font-size: 16px;
            border: 1px solid #e0e0e0;
        }

        .paging-bar{
            display: flex;
            align-items: center;
            justify-content: center;
            height: 50px;
            margin-top: 20px;
            margin-left: 50px;
            margin-right: 50px;
        }
        img{
            cursor: pointer;
        }
    </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>

<div class="wrap">
    <div class="semi-wrap">
        <div class="header-line">
            <!-- 제목 -->
            <div class="header-title">${r.title}</div>

            <!-- 버튼 -->
            <div class="button-group">
                <button class="btn-blank-small">이전화면</button>
                <button class="btn-blank-small">삭제</button>
            </div>

            <!-- 하단 info-group -->
            <div class="info-group">
                <div>
                    <c:choose>
                        <c:when test="${b.type == 1}">자소서</c:when>
                        <c:when test="${b.type == 2}">이력서</c:when>
                        <c:otherwise>기타</c:otherwise>
                    </c:choose>
                </div>
                <div>최근 수정 날짜 : ${r.updateDate}</div>
            </div>
        </div>
        <div class="contents-line">
            <textarea class="contents">${r.content}</textarea>
            <div class="file-line">
                <span><img src="/icons/paperclip.png"></span>
                <div class="file">
                    <c:choose>
                        <c:when test="${r.changeName == ''}">첨부 파일 0개</c:when>
                        <c:otherwise>${r.originName}</c:otherwise>
                    </c:choose>

                </div>
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
        <div class="feedback-line">
            <div class="feedback-header-line">
                <div style="font-size: 24px; font-weight: bold;">강사님 피드백</div>
            </div>
            <div class="feedback-body-line">
                <table class="feedback-list">
                    <thead>
                        <tr>
                            <th class="top-bar" style="width: 13.5%; border-top-left-radius: 12px;">글번호</th>
                            <th class="top-bar" style="width: 46%">제목</th>
                            <th class="top-bar" style="width: 13.5%">작성일</th>
                            <th class="top-bar" style="width: 13.5%">구분</th>
                            <th class="top-bar" style="width: 13.5%; border-top-right-radius: 12px;">작성자</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="bar">17</td>
                            <td class="bar">삼성 자소서 피드백</td>
                            <td class="bar">2025.04.01</td>
                            <td class="bar">자소서</td>
                            <td class="bar">최지투</td>
                        </tr>
                        <tr>
                            <td class="bar">17</td>
                            <td class="bar">삼성 자소서 피드백</td>
                            <td class="bar">2025.04.01</td>
                            <td class="bar">자소서</td>
                            <td class="bar">최지투</td>
                        </tr>
                        <tr>
                            <td class="bar">17</td>
                            <td class="bar">삼성 자소서 피드백</td>
                            <td class="bar">2025.04.01</td>
                            <td class="bar">자소서</td>
                            <td class="bar">최지투</td>
                        </tr>
                        <tr>
                            <td class="bar">17</td>
                            <td class="bar">삼성 자소서 피드백</td>
                            <td class="bar">2025.04.01</td>
                            <td class="bar">자소서</td>
                            <td class="bar">최지투</td>
                        </tr>
                        <tr>
                            <td class="bar">17</td>
                            <td class="bar">삼성 자소서 피드백</td>
                            <td class="bar">2025.04.01</td>
                            <td class="bar">자소서</td>
                            <td class="bar">최지투</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="paging-bar">
                <img src="/icons/leftPageMove.png">
                <img src="/icons/page1.png">
                <img src="/icons/page2.png">
                <img src="/icons/page3.png">
                <img src="/icons/rightPageMove.png">
            </div>
        </div>
    </div>

</div>

</body>
</html>
