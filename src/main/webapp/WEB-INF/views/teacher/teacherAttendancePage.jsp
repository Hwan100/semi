<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="../common/header.jsp"/>
<head>
    <title>Teacher Attendance</title>
    <link rel="stylesheet" href="/css/TeacherAttendancePage.css">
</head>
<body>

<div class="attendance-container">

    <div class="menu-tabs">
        <div class="tab active">출결 조회</div>
        <div class="tab inactive">학생 정보</div>
        <div class="tab inactive">휴가 신청 내역</div>
        <div class="tab inactive">일정 관리</div>
        <div class="tab inactive">우리반 게시판</div>
        <div class="tab inactive">자소서 및 이력서</div>
    </div>

    <div class="attendance-table-box">
        <table class="attendance-table">
            <thead>
            <tr>
                <th>번호</th>
                <th>이름</th>
                <th>전화번호</th>
                <th>입실 시간</th>
                <th>퇴실 시간</th>
                <th class="wide">비고</th>
                <th>상태</th>
            </tr>
            </thead>
            <tbody class="scrollable-tbody">
            <tr>
                <td>-</td>
                <td>김승기</td>
                <td>010-5555-4444</td>
                <td></td>
                <td></td>
                <td></td>
                <td class="status absent">결석</td>
            </tr>
            <tr>
                <td>1</td>
                <td>백승환</td>
                <td>010-4518-6891</td>
                <td>08:08</td>
                <td>06:00</td>
                <td></td>
                <td class="status leave">퇴실</td>
            </tr>
            <tr>
                <td>2</td>
                <td>이상준</td>
                <td>010-3425-6789</td>
                <td>08:18</td>
                <td>12:50</td>
                <td>롤토체스</td>
                <td class="status early">조퇴</td>
            </tr>
            <tr>
                <td>3</td>
                <td>정민구</td>
                <td>010-7583-2910</td>
                <td>08:40</td>
                <td></td>
                <td></td>
                <td class="status present">출석</td>
            </tr>
            <tr>
                <td>6</td>
                <td>최정욱</td>
                <td>010-1111-3333</td>
                <td>09:11</td>
                <td></td>
                <td></td>
                <td class="status late">지각</td>
            </tr>
            <tr>
                <td>6</td>
                <td>최정욱</td>
                <td>010-1111-3333</td>
                <td>09:11</td>
                <td></td>
                <td></td>
                <td class="status late">지각</td>
            </tr>
            <tr>
                <td>6</td>
                <td>최정욱</td>
                <td>010-1111-3333</td>
                <td>09:11</td>
                <td></td>
                <td></td>
                <td class="status late">지각</td>
            </tr>
            <tr>
                <td>6</td>
                <td>최정욱</td>
                <td>010-1111-3333</td>
                <td>09:11</td>
                <td></td>
                <td></td>
                <td class="status late">지각</td>
            </tr>
            <tr>
                <td>6</td>
                <td>최정욱</td>
                <td>010-1111-3333</td>
                <td>09:11</td>
                <td></td>
                <td></td>
                <td class="status late">지각</td>
            </tr>
            <tr>
                <td>6</td>
                <td>최정욱</td>
                <td>010-1111-3333</td>
                <td>09:11</td>
                <td></td>
                <td></td>
                <td class="status late">지각</td>
            </tr>
            <tr>
                <td>6</td>
                <td>최정욱</td>
                <td>010-1111-3333</td>
                <td>09:11</td>
                <td></td>
                <td></td>
                <td class="status late">지각</td>
            </tr>
            <tr>
                <td>6</td>
                <td>최정욱</td>
                <td>010-1111-3333</td>
                <td>09:11</td>
                <td></td>
                <td></td>
                <td class="status late">지각</td>
            </tr>
            <tr>
                <td>6</td>
                <td>최정욱</td>
                <td>010-1111-3333</td>
                <td>09:11</td>
                <td></td>
                <td></td>
                <td class="status late">지각</td>
            </tr>
            <tr>
                <td>6</td>
                <td>최정욱</td>
                <td>010-1111-3333</td>
                <td>09:11</td>
                <td></td>
                <td></td>
                <td class="status late">지각</td>
            </tr>
            <tr>
                <td>6</td>
                <td>최정욱</td>
                <td>010-1111-3333</td>
                <td>09:11</td>
                <td></td>
                <td></td>
                <td class="status late">지각</td>
            </tr>
            <tr>
                <td>6</td>
                <td>최정욱</td>
                <td>010-1111-3333</td>
                <td>09:11</td>
                <td></td>
                <td></td>
                <td class="status late">지각</td>
            </tr>
            <tr>
                <td>6</td>
                <td>최정욱</td>
                <td>010-1111-3333</td>
                <td>09:11</td>
                <td></td>
                <td></td>
                <td class="status late">지각</td>
            </tr>
            <tr>
                <td>6</td>
                <td>최정욱</td>
                <td>010-1111-3333</td>
                <td>09:11</td>
                <td></td>
                <td></td>
                <td class="status late">지각</td>
            </tr>
            <tr>
                <td>6</td>
                <td>최정욱</td>
                <td>010-1111-3333</td>
                <td>09:11</td>
                <td></td>
                <td></td>
                <td class="status late">지각</td>
            </tr>
            <tr>
                <td>6</td>
                <td>최정욱</td>
                <td>010-1111-3333</td>
                <td>09:11</td>
                <td></td>
                <td></td>
                <td class="status late">지각</td>
            </tr>
            <tr>
                <td>6</td>
                <td>최정욱</td>
                <td>010-1111-3333</td>
                <td>09:11</td>
                <td></td>
                <td></td>
                <td class="status late">지각</td>
            </tr>
            <tr>
                <td>6</td>
                <td>최정욱</td>
                <td>010-1111-3333</td>
                <td>09:11</td>
                <td></td>
                <td></td>
                <td class="status late">지각</td>
            </tr>


            <%-- 추가 row는 여기에 계속 작성 --%>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
