<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<html>
<head>
    <title>과정목록</title>
    <style>
        .board-container {
            margin: 160px 40px 40px 310px;
            min-height: 300px;
            background: white;
            border-radius: 20px;
            box-shadow: 0 4px 4px rgba(0, 0, 0, 0.2);
            padding: 30px;
        }

        .board-title {
            font-size: 24px;
            font-weight: 700;
        }

        .title-area {
            width: 100%;
            margin-bottom: 20px;
            position: relative;
        }

        .button-area {
            position: absolute;
            top: 0px;
            right: 0;
            display: flex;
            gap: 10px;
        }

        table.board-table {
            width: 100%;
            border-collapse: collapse;
        }

        table.board-table th,
        table.board-table td {
            border: 1px solid #E7E7E7;
            font-size: 14px;
            color: #003252;
            padding: 10px;
            vertical-align: middle;
        }

        table.board-table th {
            background: rgba(11, 155, 227, 0.4);
            font-weight: 600;
        }

        table.board-table td a {
            color: #003252;
            text-decoration: none;
        }

        .text-center {
            text-align: center;
        }

        .text-left {
            text-align: left;
        }

        .w-80 { width: 80px; }
        .w-120 { width: 120px; }
        .w-130 { width: 130px; }
        .w-200 { width: 200px; }

        .class-time-cell {
            white-space: pre-line;
        }
    </style>
</head>
<body>

<div class="board-container">
    <div class="title-area">
        <div style="display: flex; align-items: center;">
            <div class="board-title" style="margin-right: 15px;">📋 전체 강의 목록 (관리자)</div>
        </div>

        <div class="button-area">
            <button class="btn-blank-small">수정</button>
            <button class="btn-blank-small">개설</button>
            <button class="btn-blank-small" onclick="history.back()">이전화면</button>
        </div>
    </div>

    <table class="board-table">
        <thead>
        <tr>
            <th class="w-80 text-center">글번호</th>
            <th class="w-120 text-center">지점</th>
            <th class="text-center">과정명</th>
            <th class="w-130 text-center">강사</th>
            <th class="w-200 text-center">수업시간</th>
            <th class="w-200 text-center">기간</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="c" items="${classList}">
            <tr>
                <td class="text-center">${c.classNo}</td>
                <td class="text-center">${c.roomName}</td>
                <td class="text-center"><a href="#">${c.courseName}</a></td>
                <td class="text-center">${c.userName}</td>
                <td class="text-center class-time-cell">${c.classTime}</td>
                <td class="text-center">${c.startDate} ~ ${c.endDate}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
