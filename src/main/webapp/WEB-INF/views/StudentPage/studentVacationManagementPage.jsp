<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>평가결과 조회</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/evaluationResults.css">
</head>
<body>
<div class="table-container">
  <div class="table-header">
    <div class="cell num">번호</div>
    <div class="cell ability">능력단위명</div>
    <div class="cell date">평가일</div>
    <div class="cell score">본평가점수</div>
    <div class="cell final-score">최종점수</div>
    <div class="cell level">성취수준</div>
    <div class="cell result">이수결과</div>
    <div class="cell certificate">이수증발급</div>
    <div class="cell icon"></div>
  </div>

  <c:forEach var="result" items="${evaluationResults}">
    <div class="table-row">
      <div class="cell num">${result.number}</div>
      <div class="cell ability">${result.abilityName}</div>
      <div class="cell date">${result.evaluationDate}</div>
      <div class="cell score">${result.mainScore}</div>
      <div class="cell final-score">${result.finalScore}</div>
      <div class="cell level">${result.level}</div>
      <div class="cell result">${result.completionResult}</div>
      <div class="cell certificate">${result.certificateAvailable}</div>
      <div class="cell icon">
        <div class="inner-icon"></div>
        <div class="outer-icon"></div>
      </div>
    </div>
  </c:forEach>

</div>
</body>
</html>
