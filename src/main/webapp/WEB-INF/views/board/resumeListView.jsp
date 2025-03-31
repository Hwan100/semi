<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter&display=swap" rel="stylesheet">
    <style>
        body{
            font-family: 'Inter', sans-serif;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            border-spacing: 0;
            font-size: 16px;
        }

        .body-wrapper {
            margin-left: 270px;
            padding-top: 160px;
            background: #E0F7FF;
            min-height: 100vh;
            overflow-y: auto;
            padding-right: 20px;
        }

        .board-container {
            width: 1400px;
            height: 300px;
            margin: auto;
            background: white;
            border-radius: 20px;
            box-shadow: 0 4px 4px rgba(0, 0, 0, 0.2);
            padding: 40px 50px;
            margin-bottom: 20px;
        }

        .board-title {
            font-size: 20px;
            font-weight: 700;
            margin-bottom: 20px;
        }

        #currentResumeList{
            display: flex;
            width: 1300px;
            height: 150px;
        }

        .select {
            width: 200px;
            height: 150px;
            background-image: url("/icons/fileIcon.png");
            margin-right: 75px;
        }

        .select:hover {
            background-image: url("/icons/fileIconHover.png");
            background-blend-mode: multiply;
            color: white;
        }

        .select:hover .resume-title {
            color: white;
        }

        .resume-title{
            padding-top: 40px;
            padding-left: 10px;
            font-size: 16px;
            font-weight: 900;
            color: #003252;
        }

        .lastModify{
            font-size: 12px;
            padding-top: 34px;
            padding-bottom: 5px;
            padding-left: 10px;
        }

        .lastModifyDate{
            font-size: 12px;
            padding-left: 10px;
            padding-bottom: 10px;
        }

        .list-container{
            width: 1400px;
            margin: auto;
            background: white;
            box-shadow: 0 4px 4px rgba(0, 0, 0, 0.2);
            padding: 30px 50px;
            margin-bottom: 20px;
        }

        .list-title{
            font-size: 20px;
            font-weight: 900;
            margin-bottom: 26px;

        }

        .title-bar{
            width: 600px;
            height: 50px;
            border: 1px solid #E7E7E7;
            border-top-right-radius: 12px;
            border-top-left-radius: 12px;
            text-align: center;
            font-weight: 500;
            cursor: pointer;
        }

        .other-bar{
            width: 175px;
            height: 50px;
            border: 1px solid #E7E7E7;
            text-align: center;
            font-weight: 500;
        }

        thead{
            background-color: #9DD7F4;
        }
        th{
            font-size: 20px ;
        }

        .page-bar{
            margin-top: 35px;
            padding-left: 600px;
        }

        #last-child{
            border-top-right-radius: 12px;
        }

        td {
            padding: 14px 0;
            text-align: center;
            font-weight: 500;
            border-bottom: 1px solid #e0e0e0; /* 연한 회색 구분선 */
        }

        .top-title-bar{
            width: 600px;
            height: 50px;
            border: 1px solid #E7E7E7;
            border-top-left-radius: 12px;
            text-align: center;
            font-weight: 500;
        }

        .top-other-bar{
            width: 175px;
            height: 50px;
            border: 1px solid #E7E7E7;
            text-align: center;
            font-weight: 500;
        }

        .preview{
            width: 175px;
            height: 50px;
            border: 1px solid #E7E7E7;
            text-align: center;
            font-weight: 500;
            cursor: pointer;
        }

        .download{
            width: 175px;
            height: 50px;
            border: 1px solid #E7E7E7;
            text-align: center;
            font-weight: 500;
            cursor: pointer;
        }

    </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>

<div class="body-wrapper">
    <div class="board-container">
        <div class="board-title">최근 열람한 문서</div>
        <div id="currentResumeList">
            <div class="select">
                <div class="resume-title">KH사직서</div>
                <div class="lastModify">마지막 수정일</div>
                <div class="lastModifyDate">2025.03.28</div>
            </div>
            <div class="select">
                <div class="resume-title">유서</div>
                <div class="lastModify">마지막 수정일</div>
                <div class="lastModifyDate">2025.03.27</div>
            </div>
            <div class="select">
                <div class="resume-title">일기장</div>
                <div class="lastModify">마지막 수정일</div>
                <div class="lastModifyDate">2025.03.24</div>
            </div>
            <div class="select">
                <div class="resume-title">이력서</div>
                <div class="lastModify">마지막 수정일</div>
                <div class="lastModifyDate">2025.03.24</div>
            </div>
            <div class="select">
                <div class="resume-title">자소서1</div>
                <div class="lastModify">마지막 수정일</div>
                <div class="lastModifyDate">2025.03.20</div>
            </div>
        </div>
    </div>
    <div class="list-container">
        <div class="list-title">등록된 자소서 이력서</div>
        <table>
            <thead>
                <tr>
                    <th class="top-title-bar" id="first-child" style="font-weight: 900" >제목</th>
                    <th class="top-other-bar" style="font-weight: 900">수정일</th>
                    <th class="top-other-bar" style="font-weight: 900">구분</th>
                    <th class="top-other-bar" style="font-weight: 900">미리보기</th>
                    <th class="top-other-bar" id="last-child" style="font-weight: 900">다운로드</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="title-bar" onclick="location.href='resumeDetail.bo?title1=자소서 및 이력서&title2=자소서 및 이력서 관리'">
                        삼성 자소서
                    </td>

                    <td class="other-bar">2025.03.28</td>
                    <td class="other-bar">자소서</td>
                    <td class="preview"><img src="/icons/Search.png">미리보기</td>
                    <td class="download"><img src="/icons/Save.png">다운로드</td>
                </tr>
                <tr>
                    <td class="title-bar">삼성 자소서</td>
                    <td class="other-bar">2025.03.28</td>
                    <td class="other-bar">자소서</td>
                    <td class="preview"><img src="/icons/Search.png">미리보기</td>
                    <td class="download"><img src="/icons/Save.png">다운로드</td>
                </tr>
                <tr>
                    <td class="title-bar">삼성 자소서</td>
                    <td class="other-bar">2025.03.28</td>
                    <td class="other-bar">자소서</td>
                    <td class="preview"><img src="/icons/Search.png">미리보기</td>
                    <td class="download"><img src="/icons/Save.png">다운로드</td>
                </tr>
                <tr>
                    <td class="title-bar">삼성 자소서</td>
                    <td class="other-bar">2025.03.28</td>
                    <td class="other-bar">자소서</td>
                    <td class="preview"><img src="/icons/Search.png">미리보기</td>
                    <td class="download"><img src="/icons/Save.png">다운로드</td>
                </tr>
                <tr>
                    <td class="title-bar">삼성 자소서</td>
                    <td class="other-bar">2025.03.28</td>
                    <td class="other-bar">자소서</td>
                    <td class="preview"><img src="/icons/Search.png">미리보기</td>
                    <td class="download"><img src="/icons/Save.png">다운로드</td>
                </tr>
                <tr>
                    <td class="title-bar">삼성 자소서</td>
                    <td class="other-bar">2025.03.28</td>
                    <td class="other-bar">자소서</td>
                    <td class="preview"><img src="/icons/Search.png">미리보기</td>
                    <td class="download"><img src="/icons/Save.png">다운로드</td>
                </tr>
                <tr>
                    <td class="title-bar">삼성 자소서</td>
                    <td class="other-bar">2025.03.28</td>
                    <td class="other-bar">자소서</td>
                    <td class="preview"><img src="/icons/Search.png">미리보기</td>
                    <td class="download"><img src="/icons/Save.png">다운로드</td>
                </tr>
                <tr>
                    <td class="title-bar">삼성 자소서</td>
                    <td class="other-bar">2025.03.28</td>
                    <td class="other-bar">자소서</td>
                    <td class="preview"><img src="/icons/Search.png">미리보기</td>
                    <td class="download"><img src="/icons/Save.png">다운로드</td>
                </tr>
                <tr>
                    <td class="title-bar">삼성 자소서</td>
                    <td class="other-bar">2025.03.28</td>
                    <td class="other-bar">자소서</td>
                    <td class="preview"><img src="/icons/Search.png">미리보기</td>
                    <td class="download"><img src="/icons/Save.png">다운로드</td>
                </tr>
                <tr>
                    <td class="title-bar">삼성 자소서</td>
                    <td class="other-bar">2025.03.28</td>
                    <td class="other-bar">자소서</td>
                    <td class="preview"><img src="/icons/Search.png">미리보기</td>
                    <td class="download"><img src="/icons/Save.png">다운로드</td>
                </tr>
            </tbody>
        </table>
        <div class="page-bar">
            <img src="/icons/leftPageMove.png" style="margin-right: 15px">
            <img src="/icons/Page1.png" style="margin-right: 15px">
            <img src="/icons/rightPageMove.png">
        </div>
    </div>

</div>
</body>
</html>
