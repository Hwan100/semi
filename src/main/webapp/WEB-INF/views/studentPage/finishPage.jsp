<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>이수 현황</title>
    <link rel="stylesheet" href="/css/finish.css">
</head>
<body>
<jsp:include page="../common/header.jsp"/>

    <div class="inner-box">
        <div class="title">이수 현황</div>
        <table class="completion-table">
            <thead>
            <tr>
                <th>번호</th>
                <th class="wide-unit-name">능력단위명</th>
                <th>평가일</th>
                <th>본평가점수</th>
                <th>최종점수</th>
                <th>성취수준</th>
                <th>이수결과</th>
                <th>이수증발급</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="i" begin="1" end="10">
                <tr>
                    <td>1</td>
                    <td class="wide-unit-name">능력단위명 예시</td>
                    <td>2025-04-01</td>
                    <td>85</td>
                    <td>90</td>
                    <td>우수</td>
                    <td>이수</td>
                    <td>발급</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
