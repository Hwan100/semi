<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link rel="stylesheet" href="/css/subHeader.css">
<head>
    <title>Title</title>
</head>
<body>
<div class="menu-tabs">
    <div class="tab" data-target="attendance.li" data-path="/attendance.li">출결 조회</div>
    <div class="tab" data-target="infoList.li" data-path="/infoList.li">학생 정보</div>
    <div class="tab" data-target="vacation.li" data-path="/vacation.li">휴가 신청 내역</div>
    <div class="tab" data-target="myClass.bo" data-path="/myClass.bo">우리반 게시판</div>
</div>

<script>
    const classNo = '${classNo}'; // 서버에서 모델로 전달된 classNo를 그대로 사용

    document.querySelectorAll('.tab').forEach(tab => {
        tab.addEventListener('click', function () {
            const targetUrl = this.getAttribute('data-target');

            if (classNo && classNo.trim() !== '') {
                window.location.href = `${targetUrl}?classNo=${classNo}`;
            } else {
                alert("⚠ 반 정보가 없습니다. 과정 목록에서 다시 진입해주세요.");
            }
        });
    });


    // 현재 URL 경로로 active 탭 판단
    window.addEventListener('DOMContentLoaded', function () {
        const currentPath = window.location.pathname;

        document.querySelectorAll('.tab').forEach(tab => {
            const tabPath = tab.getAttribute('data-path');
            if (tabPath === currentPath) {
                tab.classList.add('active');
                tab.classList.remove('inactive');
            } else {
                tab.classList.remove('active');
                tab.classList.add('inactive');
            }
        });
    });
</script>




</body>
</html>