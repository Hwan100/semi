<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <style>
        *{
            box-sizing: border-box;
        }
        .wrap{
            margin-left: 310px;
            margin-top: 165px ;
            width: 1560px;
            height: 915px;
            background-color: #FFFFFF;
            padding-top: 36px;
        }

        .header-bar{
            display: flex;
            margin-left: 68px;
            width: 1420px;
            height: 60px;
            border-bottom: solid 1px;
        }

        .header-bar-title{
            display: flex;
            margin-left: 40px;
            font-size: 24px;
            align-items: center;
            font-weight: 550;
        }

        #btn1{
            margin-left: 910px;
        }

        #btn2{
            margin-left: 30px;
        }

        .contents{
            margin-top: 20px;
            width: 1210px;
            height: 770px;
            border: solid 1px;
            margin-left: 175px;
        }

        .contents-top-line{
            width: 1100px;
            height: 110px;
            margin-left: 44px;
            margin-top: 28px;
        }

        .contents-title-line{
            display: flex;
            width:464px;
            height: 40px;
            font-size: 20px;
        }

        #titleInput{
            margin-left: 30px;
            width: 390px;
            height: 40px;
            border: solid 1px;
        }

        .file-line{
            font-size: 20px;
            width: 1000px;
            height: 40px;
            margin-top: 30px;
            display: flex;
            align-items: center;
        }

        .contents-body{
            width: 1120px;
            height: 530px;
            margin-left: 44px;
            margin-top: 30px;
        }

        .contentsInput{
            margin-top: 15px;
            resize: none;
            border: solid 1px;
            width: 1120px;
            height: 480px;
            font-size: 16px;
        }

        button{
            cursor: pointer;
        }

        input::placeholder{
            padding-top: 5px;
            line-height: 40px;
        }

        textarea::placeholder{
            padding-left: 10px;
            padding-top: 5px;
            line-height: 40px;
        }

        #filebtn{
            margin-left: 15px;
            margin-right: 30px;
        }

        #fileName {
            font-size: 16px;
            color: blue;
        }

        #savebtn{
            margin-left: 565px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="wrap">
    <div class="header-bar">
        <div class="header-bar-title">자기소개서 및 이력서 작성</div>
        <button class="btn-blank-small" id="btn1">이전화면</button>
    </div>
    <div class="contents">
        <div class="contents-top-line">
            <div class="contents-title-line">
                제목
                <input id="titleInput" placeholder="제목을 입력해주세요." style="padding-left: 10px">
            </div>
            <div class="file-line">
                파일 첨부
                <button onclick="choosefile('#file')" class="btn-blank-small" id="filebtn">파일선택</button>

                <!-- ✅ 파일명 출력 위치 -->
                <span id="fileName">선택된 파일 없음</span>

                <label style="margin-left: 30px;">
                    <input type="radio" name="division" value="자소서"> 자소서
                </label>
                <label style="margin-left: 15px;">
                    <input type="radio" name="division" value="이력서"> 이력서
                </label>
            </div>
        </div>
        <div class="contents-body">
            <div style="font-size: 20px;">내용</div>
            <textarea class="contentsInput" placeholder="내용을 입력하세요." style="padding: 7px;"></textarea>
        </div>
        <button class="btn-blank-small" id="savebtn">저장하기</button>
    </div>

    <!-- 숨겨진 파일 input -->
    <div style="display: none">
        <input type="file" id="file" name="file" onchange="loadfile(this)">
    </div>
</div>

<script>
    function loadfile(loadfile){
        const file = document.querySelector('#file');
        const fileNameSpan = document.getElementById("fileName");

        if(loadfile.files.length > 0){
            const reader = new FileReader();
            reader.readAsDataURL(loadfile.files[0]);

            // ✅ 파일 이름 표시
            fileNameSpan.textContent = loadfile.files[0].name;

            reader.onload = function(ev){
                file.src = ev.target.result;
            };
        } else {
            file.src = null;
            fileNameSpan.textContent = "선택된 파일 없음";
        }
    }

    function choosefile(file){
        const fileInput = document.querySelector(file);
        fileInput.click();
    }
</script>
</body>
</html>
