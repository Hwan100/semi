<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>과정목록</title>

    <style>
        .board-container {
            margin: 160px 40px 0 310px;
            height: 700px;
            background: white;
            border-radius: 20px;
            box-shadow: 0 4px 4px rgba(0, 0, 0, 0.2);
            padding: 30px;
        }

        .board-title {
            font-size: 24px;
            font-weight: 700;
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
            border-right: 1px solid #ccc;
        }

        .board-header div:last-child {
            border-right: none;
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
            border-right: 1px solid #ccc;
        }

        .board-row div:last-child {
            border-right: none;
        }

        .board-title-cell {
            flex: 2;
            padding: 10px;
            text-align: left;
        }

        .board-title-cell a {
            color: #003252;
            text-decoration: none;
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

        #class {
            color: #74788D;
            font-size: 14px;
            font-weight: 400;
            height: 0px;
        }
    </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>

<div class="board-container">

    <div class="title-area">
        <div style="display: flex; align-items: center;">
            <div class="board-title" style="margin-right: 15px;">과정목록</div>
        </div>

        <div class="button-area">
            <button class="btn-blank-small">수정</button>
            <button class="btn-blank-small">개설</button>
            <button class="btn-blank-small" onclick="history.back()">이전화면</button>
        </div>
    </div>

    <!-- 테이블 헤더 -->
    <div class="board-header">
        <div style="flex: 0 0 80px;">글번호</div>
        <div style="flex: 0 0 120px;">지점</div>
        <div style="flex: 2;">과정명</div>
        <div style="flex: 0 0 130px;">강사</div>
        <div style="flex: 0 0 120px;">수업시간</div>
        <div style="flex: 0 0 180px;">기간</div>
    </div>

    <!-- 게시글 리스트 -->
    <c:forEach var="b" items="${list}">
        <div class="board-row">
            <div style="flex: 0 0 80px;">${b.boardNo}</div>
            <div style="flex: 0 0 120px;">${b.branch}</div>
            <div class="board-title-cell">
                <a href="detail.bo?bno=${b.boardNo}">${b.boardTitle}</a>
            </div>
            <div style="flex: 0 0 130px;">${b.boardWriter}</div>
            <div style="flex: 0 0 120px;">${b.count}</div>
            <div style="flex: 0 0 180px;">${b.createDate}</div>
        </div>
    </c:forEach>

    <!-- 예시 게시글 -->
    <div class="board-row">
        <div style="flex: 0 0 80px;">999</div>
        <div style="flex: 0 0 120px;">강남지점</div>
        <div class="board-title-cell">
            <a href="#">AWS 클라우드 기반 Devops 개발자 양성 과정 ( S 반 )</a>
        </div>
        <div style="flex: 0 0 130px;">트럼프</div>
        <div style="flex: 0 0 120px;">09:00~18:00</div>
        <div style="flex: 0 0 180px;">2025-03-27 ~ 2025-12-14</div>
    </div>

</div>

</body>
</html>
