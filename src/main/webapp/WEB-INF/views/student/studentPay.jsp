<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>급여조회</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/studentPay.css"/>
</head>
<jsp:include page="../common/header.jsp"/>
<body>
<div class="container">
    <h2 class="title">급여 내역</h2>
    <div class="table-wrapper">

        <table class="pay-table" id="pay-table">
            <thead>
            <tr>
                <th rowspan="2">No</th>
                <th rowspan="2">지급일자</th>
                <th rowspan="2">은행명</th>
                <th rowspan="2">계좌번호</th>
                <th colspan="3">출석사항</th>
                <th rowspan="2">지급액</th>
                <th rowspan="2">비고</th>
            </tr>
            <tr>
                <th>출석일</th>
                <th>실제 출석일</th>
                <th>출석률</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach var="pay" items="${payList}" varStatus="status">
                <tr>
                    <td>${status.index + 1}</td>
                    <td>${pay.payDate}</td>
                    <td>${pay.bankName}</td>
                    <td>${pay.accountNumber}</td>
                    <td>${pay.requiredDays}</td>
                    <td>${pay.actualDays}</td>
                    <td><fmt:formatNumber value="${pay.actualDays / pay.requiredDays * 100}" type="number"
                                          maxFractionDigits="1"/>%
                    </td>
                    <td>${pay.amount}</td>
                    <td>${pay.note}</td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>
</div>
</body>
</html>
