<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/TeacherVacationList.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="../common/header.jsp" />

<div class="menu-tabs">
    <div class="tab inactive">출결 조회</div>
    <div class="tab inactive">학생 정보</div>
    <div class="tab active">휴가 신청 내역</div>
    <div class="tab inactive">일정 관리</div>
    <div class="tab inactive">우리반 게시판</div>
    <div class="tab inactive">자소서 및 이력서</div>
</div>

<div class="Listcontainer">

    <table class="Vacation-table">
        <thead>
        <tr>
            <td style="width: 3%">번호</td>
            <td style="width: 8%">이름</td>
            <td style="width: 12%">날짜</td>
            <td style="width: 35%">사유</td>
            <td style="width: 30%">첨부파일</td>
            <td style="width: 20%">승인 여부</td>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>1</td>
            <td>정의철</td>
            <td>2025.03.24</td>
            <td>베르사유</td>
            <td>[첨부 파일] 제가 오늘 좀 쉬겠습니다.pdf</td>
            <td class="btn-td">
                <button class="btn-success">승인</button>
                <button class="btn-fail" data-toggle="modal" data-target="#failModal">거부</button>
            </td>
        </tr>
        <tr>
            <td>1</td>
            <td>정의철</td>
            <td>2025.03.24</td>
            <td>베르사유</td>
            <td>[첨부 파일] 제가 오늘 좀 쉬겠습니다.pdf</td>
            <td class="btn-td">
                <button class="btn-success-date">2025.03.24</button>
            </td>
        </tr>
        <tr>
            <td>1</td>
            <td>정의철</td>
            <td>2025.03.24</td>
            <td>베르사유</td>
            <td>[첨부 파일] 제가 오늘 좀 쉬겠습니다.pdf</td>
            <td class="btn-td">
                <button class="btn-fail-date">2025.03.24</button>
            </td>
        </tr>
        <c:forEach var="vacation" items="${vacationList}">
            <tr>
                <td>${Leave.leaveNo}</td>
                <td>${Leave.userName}</td>
                <td>${Leave.startDate} ~ ${Leave.endDate}</td>
                <td>${rLeave.eason}</td>
                <td>${Leave.filePath}</td>
                <td class="btn-td">
                    <button class="btn-success">승인</button>
                    <button class="btn-fail" data-toggle="modal" data-target="#failModal" data-id="${leabeNo}">거부</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<div class="modal fda" id="failModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">거절 사유 작성</h4>
            </div>
            <div class="modal-body">
                <textarea class="fail-reason form-control" placeholder="거절 사유 입력" > </textarea>
            </div>
            <div class="modal-footer">
                <button type="submit" class="submit-btn">저장</button>
                <button type="button" class="btn-default" data-dismiss="modal" id="cancel">취소</button>
            </div>
        </div>
    </div>
</div>
<script>
    let selectedLeaveId = null;

    $(".btn-fail").on("click", function(){
        selectedLeaveId = $(this).data("id");
        $(".fail-reason").val("");
    });

    $(".submit-btn").on("click", function () {
        const reason = $(".fail-reason").val().trim();

        if (reason === "") {
            alert("거절 사유를 입력해주세요.");
            return;
        }

        $.ajax({
            url: "${pageContext.request.contextPath}/vacation/reject",  // 실제 경로로 수정!
            method: "POST",
            data: {
                leaveId: selectedLeaveId,
                rejectReason: reason  // 변수명도 고쳐야 해
            },
            success: function () {
                alert("거절 처리 완료");
                $("#failModal").modal("hide");
            },
            error: function () {
                alert("에러 발생");
            }
        });
    });

</script>
</body>
</html>
