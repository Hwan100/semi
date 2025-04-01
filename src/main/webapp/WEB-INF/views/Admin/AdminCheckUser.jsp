
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>이용자 조회</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/CheckUser.css">
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../common/header.jsp" />

<div class="container">
    <div class="top-bar">
        <div class="button-group">
<button class="btn-check">+ 멤버생성 </button>
<button class="btn-check">
    <i class="icon ion-ios-gear"></i>
    일괄변경
</button>
<button class="btn-check">X 멤버삭제 </button>

    <div class="search-box">
        <input type="text" placeholder="검색..." />
        <i class="fas fa-search"></i>
    </div>
</div>

<table class="member-table">
    <thead>
    <tr>
        <th><input type="checkbox" /></th>
        <th>이름</th>
        <th>구분</th>
        <th>과정</th>
        <th>이메일</th>
        <th>비상연락망</th>
        <th>상태</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td><input type="checkbox" /></td>
        <td>김민수</td>
        <td>학생</td>
        <td>AWS 클라우드 기반 Devops 개발자 양성 과정 ( S 반 )</td>
        <td>kimminsu@example.com</td>
        <td>010-1234-4567</td>
        <td><span class="status normal">정상</span></td>
    </tr>
    <tr>
        <td><input type="checkbox" /></td>
        <td>정정일</td>
        <td>학생</td>
        <td>(디지털컨버전스) React & Spring 활용 자바(Java) 개발자 양성과정 30 ( B 반 )</td>
        <td>junghungil@example.com</td>
        <td>010-5858-6979</td>
        <td><span class="status expelled">탈퇴</span></td>
    </tr>
    <!-- 추가 데이터 반복 -->
    </tbody>
</table>
</div>
</div>

</body>
</html>
