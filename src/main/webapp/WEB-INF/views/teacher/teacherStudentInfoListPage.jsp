<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<html>
<jsp:include page="../common/header.jsp"/>


<head>
    <title>Teacher Attendance</title>
    <link rel="stylesheet" href="/css/TeacherStudentInfoListPage.css">
</head>
<body>
<jsp:include page="../common/subHeader.jsp">
    <jsp:param name="classNo" value="${classNo}" />
</jsp:include>
<div class="attendance-container">

    <div class="attendance-table-box">
        <table class="attendance-table">
            <thead>
            <tr>
                <th>번호</th>
                <th>이름</th>
                <th>전화번호</th>
                <th>이메일</th>
                <th>생년월일</th>
                <th>주소</th>
                <th>가입일</th>
            </tr>
            </thead>
            <tbody class="scrollable-tbody">
            <c:forEach var="student" items="${studentList}" varStatus="status">
                <tr onclick="location.href='studentDetailView.li?userNo=${student.userNo}'" style="cursor:pointer;">
                    <td>${status.index + 1}</td>
                    <td>${student.userName}</td>
                    <td>${student.userPhone}</td>
                    <td>${student.userEmail}</td>
                    <td>${student.userBirth}</td>
                    <td>${student.userAddress}</td>
                    <td>${student.userJoinDate}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
