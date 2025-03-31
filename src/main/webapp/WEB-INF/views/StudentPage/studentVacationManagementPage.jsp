<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>휴가 관리</title>
  <link rel="stylesheet" href="/css/studentVacationManagement.css">
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="container">

  <!-- 상단 박스 및 텍스트 -->
  <div class="box box1"></div>
  <div class="box box2"></div>
  <div class="text title1">병가/휴가 관리</div>
  <div class="text title2">병가/휴가 상세내역</div>
  <div class="text desc">병가/휴가 사용 내역을 확인합니다.</div>

  <!-- 통계 박스 -->
  <div class="stat-box box-blue">
    <img src="/icons/vacation-blue.png" class="stat-icon" />
    <div class="text-group">
      <div class="stat-label">총 휴가일 수</div>
      <div class="stat-value">${vacation.totalLeave}일</div>
    </div>
  </div>

  <div class="stat-box box-purple">
    <img src="/icons/vacation-puple.png" class="stat-icon" />
    <div class="text-group">
      <div class="stat-label">휴가 사용일 수</div>
      <div class="stat-value">${vacation.usedLeave}일</div>
    </div>
  </div>

  <div class="stat-box box-lightblue">
    <img src="/icons/vacation-skyblue.png" class="stat-icon" />
    <div class="text-group">
      <div class="stat-label">휴가 잔여일 수</div>
      <div class="stat-value">${vacation.remainingLeave}일</div>
    </div>
  </div>

  <div class="stat-box box-red1">
    <img src="/icons/hospital-semiRed.png" class="stat-icon" />
    <div class="text-group">
      <div class="stat-label">총 병가일 수</div>
      <div class="stat-value">${vacation.totalSick}일</div>
    </div>
  </div>

  <div class="stat-box box-red2">
    <img src="/icons/hospital-red.png" class="stat-icon" />
    <div class="text-group">
      <div class="stat-label">사용 병가일 수</div>
      <div class="stat-value">${vacation.usedSick}일</div>
    </div>
  </div>

  <div class="stat-box box-orange">
    <img src="/icons/hospital-orange.png" class="stat-icon" />
    <div class="text-group">
      <div class="stat-label">잔여 병가일 수</div>
      <div class="stat-value">${vacation.remainingSick}일</div>
    </div>
  </div>


  <!-- 신청 버튼 -->
  <button class="btn-apply">휴가신청</button>

  <!-- 표 -->
  <div class="table-container">
  <table class="vacation-table">
    <thead>
    <tr>
      <th>항목</th>
      <th>구분</th>
      <th>시작 일자</th>
      <th>종료 일자</th>
      <th>차감 일수</th>
      <th>작성일자</th>
      <th>상태</th>
    </tr>
    </thead>
    <tbody>

    <!-- 예시 데이터 -->
    <tr>
      <td>휴가</td>
      <td>종일 휴가</td>
      <td>2025.03.02</td>
      <td>2025.03.02</td>
      <td>1</td>
      <td>2025.03.02</td>
      <td><span class="status-label status-req">요청중</span></td>
    </tr>
    <tr>
      <td>병가</td>
      <td>종일 병가</td>
      <td>2025.03.02</td>
      <td>2025.03.02</td>
      <td>1</td>
      <td>2025.03.02</td>
      <td><span class="status-label status-approve">승인완료</span></td>
    </tr>

    <!-- 동적 데이터 -->
    <c:forEach var="vac" items="${vacationList}">
      <tr>
        <td>${vac.type}</td>
        <td>${vac.category}</td>
        <td>${vac.startDate}</td>
        <td>${vac.endDate}</td>
        <td>${vac.days}</td>
        <td>${vac.writeDate}</td>
        <td>
          <span class="status-label
            <c:choose>
              <c:when test="${vac.type eq '휴가'}"> vacation</c:when>
              <c:when test="${vac.type eq '병가'}"> sick</c:when>
            </c:choose>
            <c:choose>
              <c:when test="${vac.status eq '요청중'}"> status-req</c:when>
              <c:when test="${vac.status eq '승인완료'}"> status-approve</c:when>
              <c:when test="${vac.status eq '반려'}"> status-reject</c:when>
              <c:otherwise> status-reject</c:otherwise>
            </c:choose>
          ">
              ${vac.status}
          </span>
        </td>

      </tr>
    </c:forEach>

    </tbody>
  </table>
  </div>
</div>
</body>
</html>
