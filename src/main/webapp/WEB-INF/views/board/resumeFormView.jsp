<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
            margin-left: 316px;
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
            margin-left: 875px;
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
            width: 464px;
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
            width: 450px;
            height: 40px;
            margin-top: 30px;
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

        input::placeholder, textarea::placeholder{
            padding-left: 10px;     /* 왼쪽 여백 */
            padding-top: 5px;       /* (일부 브라우저는 무시됨) */
            line-height: 40px;      /* 세로 정렬에 도움 */
        }

        #filebtn{
            margin-left: 15px;
            margin-right: 30px;
        }


    </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
    <div class="wrap">
        <div class="header-bar">
            <div class="header-bar-title">자기소개서 및 이력서 작성</div>
            <button class="btn-blank-small" id="btn1">이전화면</button>
            <button class="btn-blank-small" id="btn2">등록</button>
        </div>
        <div class="contents">
            <div class="contents-top-line">
                <div class="contents-title-line">
                    제목
                    <input id="titleInput" placeholder="제목을 입력해주세요.">
                </div>
                <div class="file-line">
                    파일 첨부
                    <button  onclick="choosefile('#file')" class="btn-blank-small" id="filebtn">파일선택</button>
                    <label>
                        <input type="radio" name="division" value="자소서"> 자소서
                    </label>
                    <label style="margin-left: 15px;">
                        <input type="radio" name="division" value="female"> 이력서
                    </label>
                </div>
            </div>
            <div class="contents-body">
                <div style="font-size: 20px">내용</div>
                <textarea class="contentsInput" placeholder="내용을 입력하세요."></textarea>
            </div>
            <button class="btn-blank-small" style="margin-left: 565px">수정하기</button>
        </div>
        <div style="display: none">
            <input type="file" id="file" name="file" onchange="loadfile(this)">
        </div>
    </div>
    <script>
        function loadfile(loadfile){
            //파일객체 -> files -> 선택된파일들이 담겨있음
            console.log(loadfile.files[0])
            const file = document.querySelector('#file');
            console.log(file)
            if(loadfile.files.length > 0){ //파일은 선택했을 때
                //파일을 읽어들일 객체
                const reader = new FileReader();

                //해당 파일을 읽얻들여 해당파일만의 고유한 url을 부여
                //url : Base64로 인코딩된 데이터 url(파일을 실제로 표현하는 형식인 바이너리 코드를 텍스트문자열로 인코딩한 방식)
                reader.readAsDataURL(loadfile.files[0]);

                //파일읽어들이기를 완료 했을 때 이벤트핸들러를 실행시켜줘
                reader.onload = function(ev){
                    file.src = ev.target.result //이미지 요소에 불러온 파일의 url을 넣어준다.
                }


            } else { //파일이 있었는데 선택 후 취소했을 때
                file.src = null;
            }
        }

        function choosefile(file){
            const fileInput = document.querySelector(file);
            fileInput.click();
        }
    </script>
</body>
</html>
