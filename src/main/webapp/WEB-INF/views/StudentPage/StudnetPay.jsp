<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta charset="UTF-8" />
    <title>급여조회</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/StudentPay.css" />
</head>
<body>
<jsp:include page="../common/header.jsp" />
<div class="container">
  <div class="table-wrapper">
    <h2 class="page-title">급여 내역</h2>
    <table class="pay-table">
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
      <tr>
        <td>1</td>
        <td>2025.01.17</td>
        <td>우리</td>
        <td>1002-000-000000</td>
        <td>20</td>
        <td>17</td>
        <td>85%</td>
        <td>280,000원</td>
        <td>-</td>
      </tr>
      <tr>
        <td>1</td>
        <td>2025.01.17</td>
        <td>우리</td>
        <td>1002-000-000000</td>
        <td>20</td>
        <td>17</td>
        <td>85%</td>
        <td>280,000원</td>
        <td>-</td>
      </tr>
      </tbody>
    </table>
  </div>
</div>
</html>
