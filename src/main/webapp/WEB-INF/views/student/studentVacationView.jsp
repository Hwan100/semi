<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>휴가 관리</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Vacation.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/component.css" />
</head>
<body>
<jsp:include page="../common/header.jsp" />
<div class="container">
    <section class="search-section">
        <label>수강강의의 <input type="text"></label>
        <label>반 <input type="text"></label>
        <label>성명 <input type="text"></label>
        <button class="btn">조회</button>
    </section>

    <div class="notice-and-buttons">
        <p class="notice">신규,삭제 후 저장버튼을 꼭 눌러주세요</p>
        <div class="action-buttons">
            <button class="btn light">신규</button>
            <button class="btn light">삭제</button>
            <button class="btn">저장</button>
        </div>
    </div>

    <section class="table-section">
        <h2>
            휴가신청 목록
            <span>총 1건</span>
        </h2>
        <table class="leave-table">
            <thead>
            <tr>
                <th>번호</th>
                <th>상태</th>
                <th>휴가일자</th>
                <th>사유</th>
                <th>승인구분</th>
                <th>반려사유</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>1</td>
                <td>신청완료</td>
                <td>2025-03-24 ~ 2025-03-25</td>
                <td>아~학원가기싫다~</td>
                <td>거부</td>
                <td>되겠냐</td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            </tbody>
        </table>
    </section>

    <section class="bottom-section">
        <div class="form-box">
            <label>강의/반
                <input type="text" class="input-class" >
                <input type="text" class="input-small">
            </label>
            <label>유형
                <input type="text">
            </label>
            <label>사유
                <input type="text">
            </label>
            <label class="date-label">일자
                <input type="text" class="input-date"> ~
                <input type="text" class="input-date">
                <button class="btn light">종일</button>
            </label>
            <div class="note-box">
                <p>
                    ※ 백신 접종 시<br>
                    변경 전 : 3일(접종당일+1일) + 의사진단 시 2일추가<br>
                    변경 후 : 접종당일 1일 출석 인정
                </p>
                <p>
                    ※ 감염병 의심 시<br>
                    변경 전 : 의심증상 + 검사결과 발표일까지<br>
                    변경 후 : 선별진료소 방문확인서, 출석인정서(질병관리청 예방접종증명서) 제출 시 질병/경가로 출석 인정 가능
                </p>
            </div>
        </div>

        <div class="file-box">
            <div class="file-header">
                <button class="btn">파일찾기</button>
                <button class="btn light">삭제</button>
            </div>
            <table class="file-table">
                <thead>
                <tr>
                    <th>번호</th>
                    <th>파일 명</th>
                    <th>파일크기(KB)</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
                    <td>어쩔TV.txt</td>
                    <td>40</td>
                </tr>
                </tbody>
            </table>
        </div>
    </section>
</div>
</body>
</html>
