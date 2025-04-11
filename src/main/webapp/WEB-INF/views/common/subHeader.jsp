<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link rel="stylesheet" href="/css/subHeader.css">
<head><title>Title</title></head>
<body>

<div class="menu-tabs">
    <div class="tab" data-target="attendance.li" data-path="/attendance.li">출결 조회</div>
    <div class="tab" data-target="studentListByClass.li" data-path="/studentListByClass.li">학생 정보</div>
    <div class="tab" data-target="vacation.li" data-path="/vacation.li">휴가 신청 내역</div>
    <div class="tab" data-target="myClass.bo" data-path="/myClass.bo">우리반 게시판</div>
</div>

document.querySelectorAll('.tab')
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const classNo = '<%= request.getParameter("classNo") %>';
        console.log("✅ subHeader loaded | classNo =", classNo);

        document.querySelectorAll('.tab').forEach(tab => {
            tab.addEventListener('click', function () {

                // ✅ 여기가 너가 넣을 위치!
                const targetUrl = this.getAttribute('data-target');
                console.log("💥 tab element HTML:", this.outerHTML);
                console.log("💥 targetUrl =", targetUrl);

                if (classNo && classNo.trim() !== '') {
                    window.location.href = `${targetUrl}?classNo=${classNo}`;
                } else {
                    alert("⚠ 반 정보가 없습니다. 과정 목록에서 다시 진입해주세요.");
                }
            });
        });

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
