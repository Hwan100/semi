<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/TeacherVacationList.css">
</head>
<body>
<jsp:include page="../common/header.jsp" />

<div class="menu-tabs">
    <div class="tab inactive">출결 조회</div>
    <div class="tab inactive">학생 정보</div>
    <div class="tab active">휴가 신청 내역</div>
    <div class="tab inactive">일정 관리</div>
    <div class="tab inactive">우리반 게시판</div>
    <div class="tab inactive">자소서 및 이력서</div>
</div>

<div class="container">

    <table class="Vacation-table">
        <thead>
            <tr>
                <td style="width: 3%">번호</td>
                <td style="width: 8%">이름</td>
                <td style="width: 12%">날짜</td>
                <td style="width: 35%">사유</td>
                <td style="width: 30%">첨부파일</td>
                <td style="width: 20%">-</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>1</td>
                <td>정의철</td>
                <td>2025.03.24</td>
                <td>베르사유</td>
                <td>[첨부 파일] 제가 오늘 좀 쉬겠습니다.pdf</td>
                <td class="btn-td">
                    <button class="btn-success">승인</button>
                    <button class="btn-fail">거부</button>
                </td>
            </tr>
            <tr>
                <td>1</td>
                <td>정의철</td>
                <td>2025.03.24</td>
                <td>베르사유</td>
                <td>[첨부 파일] 제가 오늘 좀 쉬겠습니다.pdf</td>
                <td class="btn-td">
                    <button class="btn-success-date">2025.03.24</button>
                </td>
            </tr>
            <tr>
                <td>1</td>
                <td>정의철</td>
                <td>2025.03.24</td>
                <td>베르사유</td>
                <td>[첨부 파일] 제가 오늘 좀 쉬겠습니다.pdf</td>
                <td class="btn-td">
                    <button class="btn-fail-date">2025.03.24</button>
                </td>
            </tr>
        </tbody>
    </table>
</div>

</body>
</html>
