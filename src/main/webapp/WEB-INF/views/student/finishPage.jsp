<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>이수 현황</title>
    <link rel="stylesheet" href="/css/finish.css">
</head>
<body>
<jsp:include page="../common/header.jsp"/>

    <div class="inner-box">
        <div class="title">이수 현황</div>
        <table class="completion-table">
            <thead>
            <tr>
                <th>번호</th>
                <th class="wide-unit-name">능력단위명</th>
                <th>평가일</th>
                <th>본평가점수</th>
                <th>최종점수</th>
                <th>성취수준(등급)</th>
                <th>이수결과</th>
                <th>이수증발급</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="ce" items="${list}" varStatus="i">
                <tr>
                    <td>${i.index + 1}</td>
                    <td class="wide-unit-name">${ce.unitName}</td>
                    <td>${ce.evalDate}</td>
                    <td>${ce.mainScore}</td>
                    <td>${ce.finalScore}</td>
                    <td>${ce.certLevel}</td>
                    <td>${ce.result}</td>
                    <td> <a href="${pageContext.request.contextPath}/resources/uploadfile/${ce.changeName}"
                            download="${ce.originName}">발급</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
