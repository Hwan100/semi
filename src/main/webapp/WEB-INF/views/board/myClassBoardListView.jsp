<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>우리반게시판</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/myClassBoardListView.css">
</head>
<body>
<jsp:include page="../common/header.jsp"/>

<div class="board-container">

    <div class="title-area">
        <div style="display: flex; align-items: center;">
            <div class="board-title" style="margin-right: 15px;">우리반 게시판</div>
            <div id="class">
                AWS 클라우드 기반 Devops 개발자 양성 과정 ( S 반 )
            </div>
        </div>

        <div class="button-area">
            <button class="btn-blank-small" onclick="">수정</button>
            <button class="btn-blank-small" onclick="">작성</button>
        </div>
    </div>

    <table class="board-table">
        <thead>
        <tr>
            <th style="width: 100px;">글번호</th>
            <th style="width: 130px;">지점</th>
            <th>제목</th>
            <th style="width: 150px;">작성자</th>
            <th style="width: 100px;">조회수</th>
            <th style="width: 100px;">작성일</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="b" items="${list}">
            <tr>
                <td>${b.boardNo}</td>
                <td>${b.branch}</td>
                <td class="title-cell">
                    <a href="detail.bo?bno=${b.boardNo}">${b.boardTitle}</a>
                </td>
                <td>${b.boardWriter}</td>
                <td>${b.count}</td>
                <td>${b.createDate}</td>
            </tr>
        </c:forEach>

        <tr>
            <td>999</td>
            <td>강남지점</td>
            <td class="title-cell">
                <a href="detail.bo?bno=999">[예시] 시스템 점검 안내</a>
            </td>
            <td>관리자</td>
            <td>123</td>
            <td>2025-03-27</td>
        </tr>
        </tbody>
    </table>

</div>

</body>
</html>
