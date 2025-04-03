<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- ✅ 반응형 설정 -->
    <title>자소서/이력서 작성</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: sans-serif;
            min-width: 660px; /* ✅ 최소 너비 설정 */
        }

        .wrap {
            margin-left: 310px;
            margin-top: 160px;
            margin-right: 40px;
            background-color: #FFFFFF;
            padding-top: 36px;
            min-width: 660px; /* ✅ wrap 고정 */
        }

        .header-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 0 68px;
            height: 60px;
            border-bottom: solid 1px; /* 기존 선 유지 */
        }

        .header-bar-title {
            font-size: 24px;
            font-weight: 550;
            margin-left: 40px;
        }

        .contents {
            margin: 20px auto 0;
            padding: 30px;
            border: solid 1px; /* 기존 선 유지 */
            max-width: 1100px;
            width: 100%;
            background-color: #fff;
        }

        .contents-top-line {
            width: 100%;
            margin: 28px 0 0 0;
        }

        .contents-title-line {
            display: flex;
            align-items: center;
            font-size: 20px;
            height: 40px;
            gap: 20px;
            flex-wrap: wrap;
        }

        #titleInput {
            flex: 1;
            height: 40px;
            padding-left: 10px;
            border: solid 1px;
            font-size: 16px;
            min-width: 250px;
        }

        .file-line {
            font-size: 20px;
            margin-top: 30px;
            display: flex;
            align-items: center;
            flex-wrap: wrap;
            gap: 10px;
        }

        #filebtn {
            margin-left: 15px;
        }

        #fileName {
            font-size: 16px;
            color: blue;
        }

        .contents-body {
            margin: 30px 0 0 0;
            width: 100%;
        }

        .contents-body > div {
            font-size: 20px;
            margin-bottom: 10px;
        }

        .contentsInput {
            margin-top: 15px;
            resize: none;
            border: solid 1px;
            width: 100%;
            height: 480px;
            font-size: 16px;
            padding: 10px;
        }

        button {
            padding: 6px 12px;
            border: solid 1px;
            background-color: #f0f0f0;
            cursor: pointer;
        }

        button:hover {
            background-color: #e0e0e0;
        }

        input::placeholder,
        textarea::placeholder {
            line-height: 40px;
            color: #aaa;
        }

        #savebtn {
            margin-left: auto;
            margin-top: 20px;
            display: block;
        }
    </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="wrap">
    <div class="header-bar">
        <div class="header-bar-title">자기소개서 및 이력서 작성</div>
        <button type="button" class="btn-blank-small" id="btn1" onclick="history.back()">이전화면</button>
    </div>

    <form method="post" action="saveResume.jsp" enctype="multipart/form-data">
        <div class="contents">
            <div class="contents-top-line">
                <div class="contents-title-line">
                    제목
                    <input id="titleInput" name="title" placeholder="제목을 입력해주세요.">
                </div>
                <div class="file-line">
                    파일 첨부
                    <button type="button" onclick="chooseFile('#file')" class="btn-blank-small" id="filebtn">파일선택</button>
                    <span id="fileName">선택된 파일 없음</span>

                    <label style="margin-left: 30px;">
                        <input type="radio" name="division" id="division1" value="자소서"> 자소서
                    </label>
                    <label style="margin-left: 15px;">
                        <input type="radio" name="division" id="division2" value="이력서"> 이력서
                    </label>
                </div>
            </div>

            <div class="contents-body">
                <div>내용</div>
                <textarea class="contentsInput" name="content" placeholder="내용을 입력하세요."></textarea>
            </div>
            <button type="submit" class="btn-blank-small" id="savebtn">저장하기</button>
        </div>

        <!-- 숨겨진 파일 input -->
        <div style="display: none">
            <input type="file" id="file" name="file" onchange="loadFileName(this)">
        </div>
    </form>
</div>

<script>
    function loadFileName(inputFile) {
        const fileNameSpan = document.getElementById("fileName");
        if (inputFile.files.length > 0) {
            fileNameSpan.textContent = inputFile.files[0].name;
        } else {
            fileNameSpan.textContent = "선택된 파일 없음";
        }
    }

    function chooseFile(selector) {
        const fileInput = document.querySelector(selector);
        fileInput.click();
    }
</script>
</body>
</html>
