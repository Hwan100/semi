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
            font-size: 20px;
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
            background-color: white;
            border: 3px solid #e0e0e0;
        }

        .bar{
            cursor: pointer;
            height: 50px;
            font-weight: 500;
            font-size: 16px;
            border: 2px solid #e0e0e0;
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

        ul.pagination {
            display: flex;
            justify-content: center;
            margin-top: 40px;
            gap: 10px;
            list-style: none;
            padding: 0;
        }

        ul.pagination li.page-item a.page-link {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 25px;
            height: 25px;
            border: 1px solid #000000;
            font-family: 'Inter', sans-serif;
            font-style: normal;
            font-weight: 600;
            font-size: 14px;
            color: #000000;
            background-color: #fff;
            text-decoration: none;
        }

        ul.pagination li.page-item.active a.page-link {
            background-color: #33363F;
            color: #ffffff;
        : 1px solid #33363F;
        }

        ul.pagination li.page-item.disabled a.page-link {
            opacity: 0.5;
            pointer-events: none;
        }

        ul.pagination li.page-item a.page-link::before {
            font-weight: bold;
        }

        ul.pagination li.page-item a.page-link:hover {
            background-color: #f0f0f0;
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
                <button class="btn-blank-small" onclick="history.back()">이전화면</button>
                <button class="btn-blank-small" onclick="location.href='../resumeDelete.bo?resumeNo=${r.resumeNo}'">삭제</button>
            </div>

            <!-- 하단 info-group -->
            <div class="info-group">
                <div>
                    <c:choose>
                        <c:when test="${r.type == 1}">자소서</c:when>
                        <c:when test="${r.type == 2}">이력서</c:when>
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
                        <c:otherwise>
                            <a href="/resources/uploadfile/${r.originName}" download="${r.originName}">
                                첨부 파일 1개
                            </a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div class="file-line" style="margin-top: 0px; background-color: white">
                <span><img src="/icons/download.png"></span>
                <div class="file">
                    <a href="/resources/uploadfile/${r.originName}" download="${r.originName}">
                        ${r.originName}
                    </a>
                </div>
            </div>
            <div class="btn-line">
                <div class="btn2">
                    <button class="btn-blank-small" onclick="location.href='../resumeModify.bo?bno=${r.resumeNo}'">수정</button>
                    <button class="btn-blank-small" >취소</button>
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
                            <th class="top-bar" style="width: 13.5%; ">글번호</th>
                            <th class="top-bar" style="width: 46%">제목</th>
                            <th class="top-bar" style="width: 13.5%">작성일</th>
                            <th class="top-bar" style="width: 13.5%">구분</th>
                            <th class="top-bar" style="width: 13.5%;">작성자</th>
                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach var="b" items="${list}">
                            <c:set var="typeText">
                                <c:choose>
                                    <c:when test="${r.type == 1}">자소서</c:when>
                                    <c:when test="${r.type == 2}">이력서</c:when>
                                    <c:otherwise>기타</c:otherwise>
                                </c:choose>
                            </c:set>
                            <tr onclick="location.href='../feedback.bo?feedbackNo=${b.feedbackNo}&type=${typeText}'">
                                <td class="bar">${b.feedbackNo}</td>
                                <td class="bar">${b.title}</td>
                                <td class="bar">${b.writeDate}</td>
                                <td class="bar">${typeText}</td>
                                <td class="bar">최지투</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="pagingArea">
                <ul class="pagination">
                    <c:choose>
                        <c:when test="${ pi.currentPage eq 1 }">
                            <li class="page-item disabled"><a class="page-link" href="#"><img src="/icons/leftPageMove.png"></a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link" href="resumeDetail.bo?cpage=${pi.currentPage - 1}&bno=${r.resumeNo}"><img src="/icons/leftPageMove.png"></a></li>
                        </c:otherwise>
                    </c:choose>

                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                        <li class="page-item"><a class="page-link" href="resumeDetail.bo?cpage=${p}&bno=${r.resumeNo}">${p}</a></li>
                    </c:forEach>

                    <c:choose>
                        <c:when test="${ pi.currentPage eq pi.maxPage }">
                            <li class="page-item disabled"><a class="page-link" href="#"><img src="/icons/rightPageMove.png"></a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link" href="resumeDetail.bo?cpage=${pi.currentPage + 1}&bno=${r.resumeNo}"><img src="/icons/rightPageMove.png"></a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </div>

</div>
<input type="hidden" name="type" value="${typeText}">
</body>
</html>
