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
  <h2>급여 내역</h2>
  <table>
    <thead>
    <tr>
      <th>No</th>
      <th>지급일자</th>
      <th>은행명</th>
      <th>계좌번호</th>
      <th>출석일</th>
      <th>실제 출석일</th>
      <th>출석률</th>
      <th>지급액</th>
      <th>비고</th>
    </tr>
    </thead>
    <tbody>
    {% for pay in pays %}
    <tr>
      <td>{{ pay.no }}</td>
      <td>{{ pay.date }}</td>
      <td>{{ pay.bank }}</td>
      <td>{{ pay.account }}</td>
      <td>{{ pay.total_days }}</td>
      <td>{{ pay.present_days }}</td>
      <td>{{ pay.attendance_rate }}</td>
      <td>{{ pay.amount }}</td>
      <td>{{ pay.note }}</td>
    </tr>
    {% endfor %}
    </tbody>
  </table>
</div>

</body>
</html>
