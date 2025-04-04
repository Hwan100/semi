<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>EduTrack 로그인</title>
    <style>
        * {
            box-sizing: border-box;
            /*transform: scale(0.9);*/
        }

        body {
            margin: 0;
            padding: 0;
            width: 100vw;
            height: 100vh;
            background: #E0F7FF;
            font-family: 'Inter', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-box {
            position: relative;
            width: 850px;
            height: 500px;
            background: #FFFFFF;
            box-shadow: 0 4px 4px rgba(0, 0, 0, 0.25);
            border-radius: 18.4px;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding-top: 30px;
            padding-bottom: 30px;
        }

        .logo {
            width: 300px;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        .logo img {
            width: 100%;
            height: 100%;
            object-fit: contain;
        }

        .form-group {
            margin-bottom: 10px;
            width: 65%;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            font-size: 20px;
            background: #F1EFEF;
            border: 1px solid #979797;
        }

        .login-button {
            width: 65%;
            padding: 10px;
            font-size: 22px;
            background: #CEF0FF;
            border: none;
            margin-top: 5px;
            cursor: pointer;
        }

        .options {
            width: 65%;
            display: flex;
            justify-content: space-between;
            margin-top: 15px;
            font-size: 14.7px;
            color: #787878;
        }

        .options label {
            display: flex;
            align-items: center;
        }

        .options input[type="checkbox"] {
            margin-right: 5px;
        }

        .options a {
            text-decoration: none;
            color: #787878;
            cursor: pointer;
        }
    </style>

</head>
<body>
<form action="login.us" class="login-box" method="post">
    <div class="logo">
        <img src="icons/logo.png" alt="EduTrack 로고">
    </div>
    <div class="form-group">
        <input type="text" placeholder="ID" name="userId">
    </div>
    <div class="form-group">
        <input type="password" placeholder="PWD" name="userPwd">
    </div>
    <button type="submit" class="login-button">로그인</button>
    <div class="options">
        <label><input type="checkbox"> 아이디 저장</label>
        <a href="enrollForm.me">회원가입</a>
    </div>
    <div>
        <h5 style="color: red">${errorMsg}</h5>
    </div>
</form>
</body>
</html>
