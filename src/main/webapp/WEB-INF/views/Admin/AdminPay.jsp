<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>급여 관리</title>
    <link rel="stylesheet" type="text/css" href="/css/adminPay.css">
</head>
<body>
<jsp:include page="../common/header.jsp"/>

<div class="admin-pay-wrapper">
    <div class="admin-pay-box">

        <!-- 상단 헤더 (제목 + 버튼) -->
        <div class="admin-pay-header">
            <h2 class="admin-pay-title">급여 관리</h2>
            <div class="admin-pay-buttons">
                <button class="btn-confirm">확인</button>
                <button class="btn-pay">지급</button>
            </div>
        </div>

        <!-- 테이블 -->
        <table class="pay-table">
            <thead>
            <tr>
                <th class="rounded-left" rowspan="2">No</th>
                <th rowspan="2">이름</th>
                <th rowspan="2">지급일자</th>
                <th rowspan="2">은행명</th>
                <th rowspan="2">계좌번호</th>
                <th colspan="3">출석사항</th>
                <th rowspan="2">지급액</th>
                <th class="rounded-right" rowspan="2">비고</th>
            </tr>
            <tr>
                <th>출석일</th>
                <th>실제 출석일</th>
                <th>출석률</th>
            </tr>
            </thead>
            <tbody>
            <% for (int i = 1; i <= 6; i++) { %>
            <tr>
                <td><%= i %></td>
                <td>학생<%= i %></td>
                <td>2025.01.17</td>
                <td>우리</td>
                <td>1002-000-000000</td>
                <td>20</td>
                <td>17</td>
                <td>85%</td>
                <td>280,000원</td>
                <td>-</td>
            </tr>
            <% } %>
            </tbody>
        </table>

    </div>
</div>
</body>
</html>
