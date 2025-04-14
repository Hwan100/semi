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
<jsp:include page="../common/subHeader.jsp"/>

<div class="ListContainer">

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
                <td>${Leave.eason}</td>
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

    // 거부 버튼 클릭 시
    $(".btn-fail").on("click", function(){
        selectedLeaveId = $(this).data("id");
        $(".fail-reason").val("");
    });

    // 거절 사유 저장 처리
    $(".submit-btn").on("click", function () {
        const reason = $(".fail-reason").val().trim();

        if (reason === "") {
            alert("거절 사유를 입력해주세요.");
            return;
        }

        $.ajax({
            url: "${pageContext.request.contextPath}/vacation/reject",
            method: "POST",
            data: {
                leaveId: selectedLeaveId,
                rejectReason: reason
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

    // ✅ 승인 버튼 클릭 시 현재 날짜로 변경 + 거부 버튼 숨기기
    $(".btn-success").on("click", function () {
        const today = new Date();
        const year = today.getFullYear();
        const month = String(today.getMonth() + 1).padStart(2, '0'); // 1월은 0부터 시작!
        const day = String(today.getDate()).padStart(2, '0');
        const formattedDate = `${year}.${month}.${day}`; // 예: 2025.04.14

        // 디버깅용 콘솔
        console.log("formattedDate:", formattedDate);

        // 현재 클릭된 버튼 변경
        const $btn = $(this);
        $btn
            .removeClass("btn-success")
            .addClass("btn-success-date")
            .text(formattedDate);  // ✅ 이 부분이 핵심!

        // 같은 td 내 거부 버튼 숨기기
        $btn.siblings(".btn-fail").hide();
    });
</script>



</body>
</html>
