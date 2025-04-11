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
        <c:if test="${loginUser.userRole eq '2' || loginUser.userRole eq '3'}">
            <div class="button-area">
                <button class="btn-blank-small" onclick="location.href='enrollForm.cl'">작성</button>
            </div>
        </c:if>
    </div>

    <div class="board-header">
        <div style="flex: 0 0 100px;">글번호</div>
        <div style="flex: 0 0 130px;">강의 번호</div>
        <div style="flex: 1;">제목</div>
        <div style="flex: 0 0 150px;">작성자</div>
        <div style="flex: 0 0 100px;">조회수</div>
        <div style="flex: 0 0 100px;">작성일</div>
    </div>
    <c:forEach var="b" items="${list}">
        <div class="board-row">
            <div style="flex: 0 0 100px;">${b.boardNo}</div>
            <div style="flex: 0 0 130px;">${b.classNo}</div>
            <div class="board-title-cell">
                <a href="detail.cl?bno=${b.boardNo}">${b.title}</a>
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
                    <li class="page-item disabled"><a class="page-link" href="#"><img src="/icons/leftPageMove.png"></a></li>
                </c:when>
                <c:otherwise>
                    <li class="page-item"><a class="page-link" href="myClass.bo?cpage=${pi.currentPage - 1}"><img src="/icons/leftPageMove.png"></a></li>
                </c:otherwise>
            </c:choose>

            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                <li class="page-item"><a class="page-link" href="myClass.bo?cpage=${p}">${p}</a></li>
            </c:forEach>

            <c:choose>
                <c:when test="${ pi.currentPage eq pi.maxPage }">
                    <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                </c:when>
                <c:otherwise>
                    <li class="page-item"><a class="page-link" href="myClass.bo?cpage=${pi.currentPage + 1}"><img src="/icons/rightPageMove.png"></a></li>
                </c:otherwise>
            </c:choose>

        </ul>
    </div>

</div>
</body>
</html>
