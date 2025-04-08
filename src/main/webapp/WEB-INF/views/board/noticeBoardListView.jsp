<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항</title>
    <link rel="stylesheet" href="/css/component.css">
    <style>

        .board-container {

            margin: 160px 40px 0 310px;
            background: white;
            border-radius: 20px;
            box-shadow: 0 4px 4px rgba(0, 0, 0, 0.2);
            padding: 30px;
        }

        .board-title {
            font-size: 24px;
            font-weight: 700;
            margin-bottom: 20px;
            position: relative;
        }

        .board-header {
            display: flex;
            background: rgba(11, 155, 227, 0.4);
            border: 1px solid #E7E7E7;
            font-weight: 600;
            color: #003252;
            text-align: center;
        }

        .board-header div {
            padding: 12px 0;
        }

        .board-row {
            display: flex;
            border-bottom: 1px solid #E7E7E7;
            font-size: 14px;
            color: #003252;
        }

        .board-row div {
            padding: 10px 0;
            text-align: center;
        }

        .board-title-cell {
            flex: 1;
            padding: 10px;
            text-align: left;
        }

        .board-title-cell a {
            color: #003252;
            text-decoration: none;
        }

        .board-pagination {
            margin-top: 30px;
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        .board-pagination a {
            width: 30px;
            height: 30px;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 1px solid black;
            border-radius: 4px;
            color: black;
            text-decoration: none;
        }

        .board-pagination a.active {
            background: #0B9BE3;
            color: white;
        }

        .title-area {
            width: 100%;
            margin-bottom: 20px;
            position: relative;
        }

        .button-area {
            position: absolute;
            top: 0px;
            right: 0;
            display: flex;
            gap: 10px;
        }

        #pagingArea {
            position: relative;
            display: flex;
            justify-content: center;
            margin-top: 40px;
        }

        ul.pagination {
            display: flex;
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

        .page-item, .disabled, .page-link{
            border: 0;
        }
    </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>


<div class="board-container">
    <div class="title-area">
        <div class="board-title">공지사항</div>

        <c:if test="${loginUser.userRole eq '3'}">
        <div class="button-area">
            <button class="btn-blank-small" onclick="location.href='enrollForm.no'">작성</button>
<%--            <button class="btn-blank-small" onclick="history.back()">이전화면</button>--%>
        </div>
        </c:if>
    </div>
    <!-- 테이블 헤더 -->
    <div class="board-header">
        <div style="flex: 0 0 100px;">글번호</div>
        <div style="flex: 0 0 130px;">지점</div>
        <div style="flex: 1;">제목</div>
        <div style="flex: 0 0 150px;">작성자</div>
        <div style="flex: 0 0 100px;">조회수</div>
        <div style="flex: 0 0 100px;">작성일</div>
    </div>

    <c:forEach var="b" items="${list}">
        <div class="board-row">
            <div style="flex: 0 0 100px;">${b.boardNo}</div>
            <div style="flex: 0 0 130px;">${b.branch}</div>
            <div class="board-title-cell">
                <a href="detail.no?bno=${b.boardNo}">${b.title}</a>
            </div>
            <div style="flex: 0 0 150px;">${b.userName}</div>
            <div style="flex: 0 0 100px;">${b.count}</div>
            <div style="flex: 0 0 100px;">${b.createDate}</div>
        </div>
    </c:forEach>


    <div id="pagingArea">
        <ul class="pagination">

            <c:choose>
                <c:when test="${ pi.currentPage eq 1 }">
                    <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                </c:when>
                <c:otherwise>
                    <li class="page-item"><a class="page-link" href="notice.bo?cpage=${pi.currentPage - 1}">Previous</a></li>
                </c:otherwise>
            </c:choose>

            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                <li class="page-item"><a class="page-link" href="notice.bo?cpage=${p}">${p}</a></li>
            </c:forEach>

            <c:choose>
                <c:when test="${ pi.currentPage eq pi.maxPage }">
                    <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                </c:when>
                <c:otherwise>
                    <li class="page-item"><a class="page-link" href="notice.bo?cpage=${pi.currentPage + 1}">Next</a></li>
                </c:otherwise>
            </c:choose>

        </ul>
    </div>

</div>
</body>
</html>
