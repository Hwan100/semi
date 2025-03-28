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
<div class="body-wrapper">
<div class="payroll-container">
  <div class="title">급여 내역</div>
  <div class="table-header">
    <div class="col-no">No</div>
    <div class="col-date">지급일자</div>
    <div class="col-bank">은행명</div>
    <div class="col-account">계좌번호</div>
    <div class="col-attend-total">출석일</div>
    <div class="col-attend-actual">실제 출석일</div>
    <div class="col-attend-rate">출석률</div>
    <div class="col-amount">지급액</div>
    <div class="col-remark">비고</div>
  </div>

  <div class="table-row">
    <div class="col-no">1</div>
    <div class="col-date">2025.01.17</div>
    <div class="col-bank">우리</div>
    <div class="col-account">1002-000-000000</div>
    <div class="col-attend-total">20</div>
    <div class="col-attend-actual">17</div>
    <div class="col-attend-rate">85%</div>
    <div class="col-amount">280,000원</div>
    <div class="col-remark">-</div>
  </div>
</div>
</div>
</html>
