<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<jsp:include page="../common/header.jsp"/>
<head>
    <meta charset="UTF-8"/>
    <title>이용자 조회</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/AdminCheckUser.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>


<div class="container">
    <div class="top-bar">
        <div class="button-group">
            <button class="btn-check"><i class="fas fa-plus"></i> 멤버생성</button>
            <button class="btn-check"><i class="fas fa-cog"></i> 일괄변경</button>
            <button class="btn-check"><i class="fas fa-times"></i> 멤버삭제</button>
        </div>
        <div class="search-box">
            <input type="text" placeholder="검색..."/>
            <i class="fas fa-search"></i>
        </div>
    </div>

    <div class="table-wrapper">
        <table id="main-table" class="member-table">
            <thead>
            <tr>
                <th style="width: 5%">선택</th>
                <th>No.</th>
                <th style="width: 8%">이름</th>
                <th>구분</th>
                <th style="width: 40%">과정</th>
                <th style="width: 15%">이메일</th>
                <th>비상연락망</th>
                <th style="width: 8%">상태</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach var="list" items="${userList}">
                <tr class="clickable-row" data-user-no="${list.userNo}">
                    <td><input type="checkbox"/></td>
                    <td>${list.userNo}</td>
                    <td>${list.userName}</td>
                    <td>
                        <c:choose>
                            <c:when test="${list.userRole == 2}">
                                강사
                            </c:when>
                            <c:when test="${list.userRole == 3}">
                                관리자
                            </c:when>
                            <c:otherwise>
                                학생
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>${list.className}</td>
                    <td>${list.userEmail}</td>
                    <td>${list.userPhone}</td>
                    <td>
                        <c:choose>
                            <c:when test="${list.userStatus == 'Y'}">
                                <span class="status normal">정상</span>
                            </c:when>
                            <c:when test="${list.userStatus == 'N'}">
                                <span class="status expelled">탈퇴</span>
                            </c:when>
                            <c:otherwise>
                                <span class="status wait">대기</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>
</div>

<!-- 모달1 배경 -->
<div id="modal1" class="modal-overlay" style="display: none;">
    <div class="modal-content">
        <div class="modal-header">
            <h3>멤버생성</h3>
            <span class="modal-close" onclick="closeModal1()">×</span>
        </div>
        <div class="modal-body">
            <select style="width: 110px; margin-right: 15px">
                <option selected>구분</option>
                <option>과정</option>
                <option>상태</option>
            </select>
            <select style="width: 360px">
                <option>AWS 클라우드 기반 Devops 개발자 양성 과정 ( S 반 )</option>
                <option>(디지털컨버전스) React & Spring 활용 자바(Java) 개발자</option>
            </select>

        </div>
        <div class="modal-footer">
            <button onclick="saveModal1()" class="btn-blank-small">저장</button>
            <button onclick="closeModal1()" class="btn-blank-small">취소</button>
        </div>
    </div>
</div>

<!-- 모달2 배경 -->
<div id="modal2" class="modal-overlay" style="display: none;">
    <div class="modal-content">
        <div class="modal-header">
            <h3>일괄변경</h3>
            <span class="modal-close" onclick="closeModal2()">×</span>
        </div>
        <div class="modal-body">
            <select style="width: 110px; margin-right: 15px">
                <option selected>구분</option>
                <option>과정</option>
                <option>상태</option>
            </select>
            <select style="width: 360px">
                <option>AWS 클라우드 기반 Devops 개발자 양성 과정 ( S 반 )</option>
                <option>(디지털컨버전스) React & Spring 활용 자바(Java) 개발자</option>
            </select>

        </div>
        <div class="modal-footer">
            <button onclick="saveModal2()" class="btn-blank-small">저장</button>
            <button onclick="closeModal2()" class="btn-blank-small">취소</button>
        </div>
    </div>
</div>

<!-- 모달3 배경 -->
<div id="modal3" class="modal-overlay" style="display: none;">
    <div class="modal-content">
        <div class="modal-header">
            <h3>멤버삭제</h3>
            <span class="modal-close" onclick="closeModal3()">×</span>
        </div>
        <div class="modal-body">
            <select style="width: 110px; margin-right: 15px">
                <option selected>구분</option>
                <option>과정</option>
                <option>상태</option>
            </select>
            <select style="width: 360px">
                <option>AWS 클라우드 기반 Devops 개발자 양성 과정 ( S 반 )</option>
                <option>(디지털컨버전스) React & Spring 활용 자바(Java) 개발자</option>
            </select>

        </div>
        <div class="modal-footer">
            <button onclick="saveModal3()" class="btn-blank-small">저장</button>
            <button onclick="closeModal3()" class="btn-blank-small">취소</button>
        </div>
    </div>
</div>
<script>
    // 멤버생성 버튼
    function openModal1() {
        document.getElementById("modal1").style.display = "flex";
    }

    function closeModal1() {
        document.getElementById("modal1").style.display = "none";
    }

    function saveModal1() {
        // 저장 처리 로직 (예: AJAX 요청 등)
        alert("변경사항이 저장되었습니다.");
        closeModal1();
    }

    document.addEventListener("DOMContentLoaded", function () {
        const bulkChangeBtn = document.querySelector(".btn-check:first-child");
        bulkChangeBtn.addEventListener("click", openModal1);
    });

    // 일괄변경 버튼
    function openModal2() {
        document.getElementById("modal2").style.display = "flex";
    }

    function closeModal2() {
        document.getElementById("modal2").style.display = "none";
    }

    function saveModal2() {
        // 저장 처리 로직 (예: AJAX 요청 등)
        alert("변경사항이 저장되었습니다.");
        closeModal2();
    }

    document.addEventListener("DOMContentLoaded", function () {
        const bulkChangeBtn = document.querySelector(".btn-check:nth-child(2)");
        bulkChangeBtn.addEventListener("click", openModal2);
    });

    // 멤버삭제 버튼
    function openModal3() {
        document.getElementById("modal3").style.display = "flex";
    }

    function closeModal3() {
        document.getElementById("modal3").style.display = "none";
    }

    function saveModal3() {
        // 저장 처리 로직 (예: AJAX 요청 등)
        alert("변경사항이 저장되었습니다.");
        closeModal3();
    }

    document.addEventListener("DOMContentLoaded", function () {
        const bulkChangeBtn = document.querySelector(".btn-check:nth-child(3)");
        bulkChangeBtn.addEventListener("click", openModal3);
    });
</script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        // 모든 클릭 가능한 행에 대해 이벤트 설정
        const rows = document.querySelectorAll(".clickable-row");

        rows.forEach(row => {
            row.addEventListener("click", function () {
                // 행의 데이터 속성에서 정보 가져오기
                const userNo = this.dataset.userNo;

                // 서버로 데이터 전송
                fetch('/api/user/myPage', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({
                        userNo: userNo
                    }),
                })
                    .then(response => response.json())
                    .then(data => {
                        if (data.redirectUrl) {
                            // 서버에서 받은 URL로 리디렉션
                            window.location.href = data.redirectUrl;
                        } else {
                            alert("리디렉션 URL이 없습니다.");
                        }
                    })
                    .catch(error => {
                        console.error("오류 발생:", error);
                        alert("데이터 전송에 실패했습니다.");
                    });
            });
        });
    });
</script>
</body>
</html>
