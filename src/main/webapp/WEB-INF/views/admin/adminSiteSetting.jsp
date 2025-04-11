<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>사용자 환경설정</title>
    <style>
        .wrap {
            color: #74788D;
            margin-left: 310px;
            margin-top: 160px;
            margin-right: 40px;
            background-color: #FFFFFF;
            padding: 30px;
            border-radius: 20px;
        }

        .contents {
            padding: 50px;
            font-size: 20px;
        }

        .header-line {
            color: black;
            height: 30px;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 30px;
        }

        .logo-line {
            display: flex;
            height: 200px;
            gap: 30px;
            margin-top: 10px;
            margin-bottom: 50px;
        }

        .siteName-line {
            display: flex;
            height: 30px;
            font-size: 20px;
            margin-top: 10px;
            margin-bottom: 50px;
        }

        .textInput {
            height: 30px;
            border: solid 1px #74788D;
            border-radius: 5px;
            font-size: 16px;
            margin: 0 10px 0 10px;
            text-align: right;

        }

        .fileLimit-line {
            display: flex;
            font-size: 20px;
            margin-top: 10px;
            margin-bottom: 50px;
        }

        .guide-line {
            margin-left: 285px;
            margin-top: 10px;
            color: #74788D;
            font-size: 16px;
        }

        .button-line {
            display: flex;
            justify-content: center;

        }

        #fileName {
            font-size: 16px;
            color: blue;
        }

        #logoText {
            display: flex;
            flex-direction: column;
            font-size: 16px;
            justify-content: space-between;
        }

    </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<form method="post" action="updateSetting.bo" enctype="multipart/form-data">
    <div class="wrap">
        <div class="contents">
            <div class="header-line">
                학원 설정
            </div>
            <span>로고이미지</span>
            <div class="logo-line">

                <img src="${siteSetting.changeName}" style="min-width: 200px;min-height: 100px;border: 1px solid black"
                     id="logoInput">
                <div id="logoText">
                    png파일로 300x150 사이즈로 등록해주세요.
                    <div>
                        <button type="button" class="btn-blank-small" onclick="selectLogo()"
                                style="margin-right: 10px;">로고 등록
                        </button>

                        <span id="fileName">선택된 파일 없음</span>
                    </div>
                </div>
            </div>
            <div class="siteName-line">
                <span>학원 웹사이트 명</span>
                <input class="textInput" name="siteName" type="text" value="${s.siteName}">
            </div>
            <div class="fileLimit-line">
                <span>지각, 조퇴</span>
                <input class="textInput" value="${s.late}" name="late" type="number" min="0" max="5">
                일&nbsp;&nbsp;&nbsp;&nbsp;-> &nbsp;&nbsp;&nbsp;&nbsp;결석
                <input class="textInput" value="${s.absent}" name="absent" type="number" min="0" max="3">
                일
            </div>
            <div class="button-line">
                <button class="btn-blank" style="margin-right: 40px">저장</button>
                <button type="button" class="btn-blank">취소</button>
            </div>
            <div style="display: none">
                <input type="file" id="file" name="upfile" onchange="loadFileName(this)">
            </div>
        </div>
    </div>
</form>


<script>

    function selectLogo() {
        const fileInput = document.getElementById("file");
        fileInput.click();
    }

    function loadFileName(inputFile) {
        const fileNameSpan = document.getElementById("fileName");
        const logoInput = document.getElementById("logoInput");

        if (inputFile.files.length > 0) {
            const file = inputFile.files[0];
            fileNameSpan.textContent = file.name;

            const reader = new FileReader();
            reader.onload = function (e) {
                logoInput.src = e.target.result; // 이미지 태그에 src 설정
            };
            reader.readAsDataURL(file); // 파일을 base64로 읽기
        } else {
            fileNameSpan.textContent = "선택된 파일 없음";
            logoInput.src = ""; // 선택이 없으면 이미지 초기화
        }
    }

</script>
</body>
</html>
