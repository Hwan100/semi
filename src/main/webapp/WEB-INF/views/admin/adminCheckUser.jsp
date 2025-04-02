<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8" />
    <title>이용자 조회</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/CheckUser.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
<jsp:include page="../common/header.jsp" />

<div class="container">
    <div class="top-bar">
        <div class="button-group">
            <button class="btn-check"><i class="fas fa-plus"></i> 멤버생성</button>
            <button class="btn-check"><i class="fas fa-cog"></i>  일괄변경</button>
            <button class="btn-check"><i class="fas fa-times"></i> 멤버삭제</button>
        </div>
        <div class="search-box">
            <input type="text" placeholder="검색..." />
            <i class="fas fa-search"></i>
        </div>
    </div>

    <div class="table-wrapper">
        <table class="member-table">
            <thead>
            <tr>
                <th style="width: 5%">선택</th>
                <th style="width: 8%">이름</th>
                <th>구분</th>
                <th style="width: 40%">과정</th>
                <th style="width: 15%">이메일</th>
                <th>비상연락망</th>
                <th style="width: 8%">상태</th>
            </tr>
            </thead>
            <tbody>
            <!-- 예시 행 -->
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
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
