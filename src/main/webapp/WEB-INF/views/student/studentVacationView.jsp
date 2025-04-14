<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>휴가 관리</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Vacation.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/component.css" />
    <style>
        .bottom-section {
            display: none;
            margin-top: 30px;
            gap: 30px;
            justify-content: start;
        }
        .file-table td {
            padding: 10px;
            height: 40px;
            font-size: 14px;
            color: #000;
            border-top: 1px solid #ddd;
            vertical-align: middle;
        }
    </style>
</head>
<body>
<jsp:include page="../common/header.jsp" />
<div class="container">

    <!-- ✅ 휴가 목록 상단 영역 -->
    <section class="table-section">
        <div class="title-row">
            <h2>휴가신청 목록 <span>총 ${list.size()}건</span></h2>
            <div class="action-buttons">
                <button id="new-btn" class="btn-blank-small light">신규</button>
                <button id="delete-btn" class="btn-blank-small light" onclick="postFormSubmit('delete')">삭제</button>
            </div>
        </div>

        <!-- ✅ div 기반 휴가 목록 테이블 -->
        <form id="postForm" method="post" action="deleteLeave.bo">
            <div class="leave-table">
                <div class="leave-header">
                    <div style="width: 56px;">-</div>
                    <div style="width: 56px;">번호</div>
                    <div style="width: 150px;">휴가일자</div>
                    <div>사유</div>
                    <div>첨부파일명</div>
                    <div style="width: 150px;">승인여부</div>
                    <div style="width: 200px;">반려사유</div>
                </div>

                <c:forEach var="l" items="${list}">
                    <div class="leave-row">
                        <div><input type="checkbox" class="select_colum" name="selectVacation" value="${l.leaveNo}"></div>
                        <div>${l.leaveNo}</div>
                        <div>${l.startDate} ~ ${l.endDate}</div>
                        <div>${l.reason}</div>
                        <div>
                            <c:choose>
                                <c:when test="${empty l.changeName}">-</c:when>
                                <c:otherwise>
                                    <a href="${pageContext.request.contextPath}/resources/uploadfile/${l.changeName}"
                                       download="${l.originName}"
                                       style="color: #007bff; text-decoration: underline;">
                                        <c:out value="${fn:substringAfter(l.changeName, '/uploadfile/')}" />
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div>${l.status}</div>
                        <div>
                            <c:choose>
                                <c:when test="${empty l.rejectReason}">-</c:when>
                                <c:otherwise>${l.rejectReason}</c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </form>
    </section>

    <!-- ✅ 하단 입력 영역 -->
    <section class="bottom-section" id="form-section">
        <!-- 신청 입력 폼 -->
        <div class="form-box">
            <form class="form-container" id="leaveForm" method="post" action="submitLeave.do" enctype="multipart/form-data">
                <label>강의 / 반</label>
                <div class="input-group">
                    <input type="text" id="className" name="className" class="input-class" placeholder="과정명" required> /
                    <input type="text" id="roomName" name="roomName" class="input-small" placeholder="반명" required>
                </div>
                <label>유형</label>
                <select name="type" required style="border: 1px solid #ccc; border-radius: 6px">
                    <option value="1">휴가</option>
                    <option value="2">병가</option>
                </select>
                <label>사유</label>
                <input type="text" id="reason" name="reason" placeholder="사유를 입력하세요" required>
                <label>일자</label>
                <div class="date-container">
                    <input type="text" id="startDate" name="startDate" class="input-date" placeholder="YYYY-MM-DD" required> ~
                    <input type="text" id="endDate" name="endDate" class="input-date" placeholder="YYYY-MM-DD" required>
                </div>

                <!-- 파일 업로드 -->
                <input type="file" name="upfile" id="upfile" style="display: none;" />
            </form>

            <!-- 유의사항 -->
            <div class="note-box">
                <p>※ 백신 접종 시<br>변경 전 : 3일(접종당일+1일) + 의사진단 시 2일 추가<br>변경 후 : 접종당일 1일 출석 인정</p>
                <p>※ 감염병 의심 시<br>변경 전 : 의심증상 + 검사결과 발표일까지<br>변경 후 : 선별진료소 방문확인서, 출석인정서 제출 시 출석 인정 가능</p>
            </div>
        </div>

        <!-- 파일 첨부 테이블 -->
        <div class="file-box">
            <div class="file-header">
                <input type="file" id="fileInput" style="display: none" />
                <button type="button" onclick="chooseFile('#fileInput')">파일찾기</button>
                <button type="button" onclick="removeFile()">삭제</button>
            </div>

            <table class="file-table" id="fileTable">
                <thead>
                <tr><th>파일 명</th></tr>
                </thead>
                <tbody id="fileTableBody"></tbody>
            </table>
        </div>
    </section>
</div>

<script>
    let selectedFile = null;

    function chooseFile(selector) {
        const fileInput = document.querySelector(selector);
        fileInput.value = '';
        fileInput.click();
    }

    document.getElementById("fileInput").addEventListener("change", function (event) {
        selectedFile = event.target.files[0];

        const fileTableBody = document.getElementById("fileTableBody");
        const upfile = document.getElementById("upfile");

        if (selectedFile) {
            // 📌 선택된 파일을 실제 form input으로 복사
            upfile.files = event.target.files;

            // 📌 파일명 표시
            fileTableBody.innerHTML = "<tr><td>" + selectedFile.name + "</td></tr>";
        } else {
            fileTableBody.innerHTML = '';
            upfile.value = '';
        }
    });

    function removeFile() {
        selectedFile = null;
        document.getElementById("fileInput").value = '';
        document.getElementById("upfile").value = '';
        document.getElementById("fileTableBody").innerHTML = '';
    }


    const newBtn = document.getElementById("new-btn");
    const formSection = document.getElementById("form-section");
    const leaveForm = document.getElementById("leaveForm");
    let formVisible = false;

    newBtn.addEventListener("click", function () {
        if (!formVisible) {
            formSection.style.display = "flex";
            newBtn.textContent = "신청";
            formVisible = true;
        } else {
            const formData = new FormData(leaveForm);
            if (selectedFile) {
                formData.append("file", selectedFile);
            }

            fetch("submitLeave.do", {
                method: "POST",
                body: formData
            })
                .then(res => res.text())
                .then(result => {
                    alert("신청이 완료되었습니다.");
                    location.reload();
                })
                .catch(err => {
                    console.error(err);
                    alert("신청 실패");
                });
        }
    });

    document.addEventListener("DOMContentLoaded", function () {
        const checkboxes = document.querySelectorAll("input[name='selectVacation']");
        checkboxes.forEach(chk => {
            chk.addEventListener("change", function () {
                const checked = document.querySelectorAll("input[name='selectVacation']:checked");
                document.getElementById("delete-btn").disabled = checked.length === 0;
            });
        });
    });
</script>
</body>
</html>
