<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>회원가입</title>
  <style>
    * {
      box-sizing: border-box;
    }

    body {
      margin: 0;
      padding: 0;
      font-family: 'Inter', sans-serif;
    }

    .container {
      width: 1920px;
      height: 1368px;
      position: relative;
      background: #E0F7FF;
      overflow: hidden;
    }

    .card {
      width: 1108px;
      height: 1265px;
      position: absolute;
      left: 406px;
      top: 63px;
      background: white;
      box-shadow: 2px 2px 3px rgba(0, 0, 0, 0.25);
      border-radius: 18px;
    }

    .input-box {
      height: 52px;
      background: white;
      box-shadow: 3px 3px 3px rgba(0,0,0,0.25);
      border-radius: 10px;
      outline: 1px solid #848484;
      filter: blur(1.5px);
      position: absolute;
    }

    .label {
      position: absolute;
      color: black;
      font-size: 20px;
      font-weight: 300;
    }

    .placeholder {
      color: #868686;
      font-size: 20px;
      font-weight: 300;
      position: absolute;
    }

    .error {
      color: rgba(255, 0, 0, 0.7);
      font-size: 14px;
      font-weight: 300;
      position: absolute;
    }

    .button {
      width: 122px;
      height: 40px;
      border-radius: 10px;
      position: absolute;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 20px;
      font-weight: 300;
      color: white;
    }

    .btn-blue {
      background: #02C4E8;
    }

    .btn-yellow {
      background: #EFCA00;
    }

    .title {
      position: absolute;
      top: 118px;
      left: 886px;
      font-size: 40px;
      font-weight: 300;
    }

    .logo {
      width: 220px;
      height: 88px;
      position: absolute;
      top: 78px;
      left: 434px;
    }

    .dropdown-arrow {
      width: 20px;
      height: 10.78px;
      outline: 2px black solid;
      outline-offset: -1px;
      position: absolute;
    }
  </style>
</head>
<body>
<div class="container">
  <div class="card"></div>

  <div class="input-box" style="left: 582px; top: 242px; width: 758px;"></div>
  <div class="label" style="left: 581px; top: 207px;">아이디</div>
  <div class="error" style="left: 661px; top: 212px;">사용할 수 없는 아이디입니다.</div>
  <div class="placeholder" style="left: 609px; top: 256px;">아이디 입력( 6~20자 )</div>

  <div class="button btn-blue" style="left: 1209px; top: 248px;">중복 확인</div>

  <div class="input-box" style="left: 582px; top: 347px; width: 758px;"></div>
  <div class="label" style="left: 581px; top: 312px;">비밀번호</div>
  <div class="error" style="left: 679px; top: 314px;">20자 이내의 비밀번호를 입력해주세요.</div>
  <div class="placeholder" style="left: 609px; top: 362px;">비밀번호 입력 ( 문자, 숫자, 특수문자 포함 8~20자 )</div>

  <div class="input-box" style="left: 582px; top: 452px; width: 758px;"></div>
  <div class="label" style="left: 581px; top: 417px;">비밀번호 확인</div>
  <div class="placeholder" style="left: 609px; top: 466px;">비밀번호 재입력</div>
  <div class="error" style="left: 722px; top: 419px;">비밀번호가 일치하지 않습니다.</div>

  <div class="input-box" style="left: 581px; top: 557px; width: 758px;"></div>
  <div class="label" style="left: 581px; top: 522px;">이름</div>
  <div class="placeholder" style="left: 609px; top: 571px;">이름을 입력해주세요</div>

  <div class="input-box" style="left: 581px; top: 662px; width: 758px;"></div>
  <div class="label" style="left: 581px; top: 627px;">전화번호</div>
  <div class="placeholder" style="left: 608px; top: 676px;">휴대폰 번호 입력( ‘-’ 제외 11자리 입력 )</div>

  <div class="input-box" style="left: 582px; top: 767px; width: 758px;"></div>
  <div class="label" style="left: 581px; top: 732px;">비상 연락망</div>
  <div class="placeholder" style="left: 609px; top: 781px;">휴대폰 번호 입력( ‘-’ 제외 11자리 입력 )</div>

  <div class="label" style="left: 580px; top: 837px;">생년월일</div>
  <div class="input-box" style="left: 580px; top: 872px; width: 197px;"></div>
  <div class="dropdown-arrow" style="left: 730px; top: 893px;"></div>
  <div class="placeholder" style="left: 609px; top: 886px;">연도</div>

  <div class="input-box" style="left: 903px; top: 872px; width: 155px;"></div>
  <div class="dropdown-arrow" style="left: 1020px; top: 893px;"></div>
  <div class="placeholder" style="left: 957px; top: 886px;">월</div>

  <div class="input-box" style="left: 1183px; top: 872px; width: 155px;"></div>
  <div class="dropdown-arrow" style="left: 1304px; top: 893px;"></div>
  <div class="placeholder" style="left: 1241px; top: 886px;">일</div>

  <div class="label" style="left: 581px; top: 942px;">이메일 주소</div>
  <div class="input-box" style="left: 581px; top: 977px; width: 340px;"></div>
  <div class="input-box" style="left: 1018px; top: 977px; width: 321px;"></div>
  <div class="placeholder" style="left: 607.93px; top: 991px;">이메일 주소</div>
  <div class="label" style="left: 954px; top: 992px;">@</div>
  <div class="placeholder" style="left: 1044px; top: 991px;">naver.com</div>

  <div class="label" style="left: 581px; top: 1046px;">주소</div>
  <div class="input-box" style="left: 581px; top: 1081px; width: 758px;"></div>
  <div class="input-box" style="left: 581px; top: 1144px; width: 758px;"></div>
  <div class="placeholder" style="left: 607px; top: 1158px;">상세 주소</div>

  <div class="button btn-blue" style="left: 826px; top: 1252px;">가입신청</div>
  <div class="button btn-yellow" style="left: 971px; top: 1252px;">돌아가기</div>

  <div class="title">회원가입</div>
  <img class="logo" src="https://placehold.co/220x88" />
</div>
</body>
</html>
