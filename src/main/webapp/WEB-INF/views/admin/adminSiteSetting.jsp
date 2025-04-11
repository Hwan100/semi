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
            padding-top: 36px;
            border-radius: 20px;
            padding-bottom: 50px;
        }

        .header-line {
            color: black;
            height: 30px;
            margin-left: 50px;
            margin-right: 70px;
            margin-top: 30px;
            font-size: 24px;
            font-weight: bold;
        }

        .logo-line {
            display: flex;
            margin-top: 30px;
            height: 200px;
            margin-left: 70px;
            margin-right: 70px;
            font-size: 20px;
        }

        .siteName-line {
            display: flex;
            margin-top: 30px;
            height: 30px;
            margin-left: 70px;
            margin-right: 70px;
            font-size: 20px;
        }

        input{
            width: 300px;
            height: 30px;
            border: solid 1px;
            border-radius: 5px;
            font-size: 16px;
        }

        .fileLimit-line{
            display: flex;
            margin-top: 140px;
            font-size: 20px;
            margin-left: 70px;
            margin-right: 70px;
        }

        .guide-line{
            margin-left: 285px;
            margin-top: 10px;
            color: #74788D;
            font-size: 16px;
        }

        .button-line{
            display: flex;
            justify-content: center;
            margin-top: 85px;

        }

        #fileName {
            font-size: 16px;
            color: blue;
        }
    </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<form method="post" action="updateSetting.bo" enctype="multipart/form-data">
    <div class="wrap">
        <div class="header-line">
            학원 설정
        </div>
        <div class="logo-line">
            로고이미지
            <img src="${siteSetting.changeName}" style="margin-left: 130px; margin-right: 10px" id="logoInput">
            <div style="display: flex; flex-direction: column; font-size: 16px;">
                png파일로 300x150 사이즈로 등록해주세요.
                <div style="margin-top: 140px;">
                    <button type="button" class="btn-blank-small" onclick="selectLogo()" style="margin-right: 10px;">로고 등록</button>

                    <span id="fileName">선택된 파일 없음</span>
                </div>
            </div>
        </div>
        <div class="siteName-line">
            <span style="margin-right: 63px">학원 웹사이트 명</span>
            <input name="siteName" type="text" style="border: solid 1px #74788D" value="${s.siteName}">
        </div>
        <div class="fileLimit-line">
            <span style="margin-right: 20px">지각,조퇴</span> <input value="${s.late}" name="late" type="number" min="0" max="5" style="width: 50px; border: solid 1px #74788D; margin-right: 10px; padding-left: 20px;">일
            &nbsp;&nbsp;&nbsp;&nbsp;-> &nbsp;&nbsp;&nbsp;&nbsp;결석<input value="${s.absent}" name="absent" type="number" min="0" max="3" style="width: 50px; border: solid 1px #74788D; margin-left: 20px; padding-left: 20px;";>일
        </div>
        <div class="button-line">
            <button class="btn-blank" style="margin-right: 40px">저장</button>
            <button type="button" class="btn-blank">취소</button>
        </div>
        <div style="display: none">
            <input type="file" id="file" name="upfile" onchange="loadFileName(this)">
        </div>
    </div>
</form>


<script>

    function selectLogo(){
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
