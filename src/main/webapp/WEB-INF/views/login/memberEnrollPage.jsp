<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        #layout {
            position: relative;
            width: 1920px;
            height: 1368px;
            background: #E0F7FF;
        }

        #enrollCard {
            position: absolute;
            width: 1108px;
            height: 1265px;
            left: 406px;
            top: 63px;
            background: #FFFFFF;
            box-shadow: 2.2px 2.2px 2.95px rgba(0, 0, 0, 0.25);
            border-radius: 18.4px;
        }

        #logo img {
            margin-top: 15px;
            margin-left: 12px;
        }

        #enroll {
            position: absolute;
            top: 55px;
            font-size: 40px;
            margin-left: 464px;
        }

        #contents {
            width: 760px;
            height: 989px;
            margin-top: 41px;
            margin-left: 158px;
            margin-right: 190px;
        }

        .line {
            width: 759px;
            height: 87px;
            margin-bottom: 18px;
        }

        .top-line {
            display: flex;
            margin-bottom: 8px;
            align-items: center;
        }

        .first-info {
            font-size: 20px;
            margin-right: 24px;
        }

        .second-info {
            display: none;
            font-size: 14px;
            color: red;
        }

        .input-wrap input {
            width: 758px;
            height: 47px;
            border-radius: 10px;
        }

        .input-wrap input::placeholder {
            font-size: 20px;
            padding-left: 17px;
        }

        #idCheck {
            position: absolute;
            width: 122px;
            height: 40px;
            margin-top: 41px;
            margin-left: 629px;
            background-color: #02C4E8;
            border-radius: 10px;
            color: white;
            border: none;
            font-size: 20px;
            cursor: pointer;
        }

        .birth-group {
            display: flex;
            gap: 20px;
        }

        .birth-group select {
            width: 150px;
            height: 47px;
            border-radius: 10px;
            border: 1px solid #ccc;
            font-size: 16px;
            padding-left: 10px;
            appearance: none;
            background: url('data:image/svg+xml;utf8,<svg fill="gray" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="M7 10l5 5 5-5z"/></svg>') no-repeat right 10px center;
            background-color: white;
            background-size: 20px;
        }

        #emailInputline {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        #emailInputline input {
            width: 330px;
            height: 47px;
            border-radius: 10px;
            font-size: 20px;
            padding-left: 17px;
            border: 1px solid #ccc;
        }

        #emailInputline select {
            width: 330px;
            height: 47px;
            border-radius: 10px;
            font-size: 20px;
            padding-left: 10px;
            border: 1px solid #ccc;
        }

        #emailInputline .at {
            font-size: 20px;
        }

        .btn-box {
            display: flex;
            justify-content: center;
            gap: 16px;
            margin-top: 30px;
        }

        .submit-btn, .cancel-btn {
            width: 120px;
            height: 40px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        .submit-btn {
            background-color: #02C4E8;
            color: white;
        }

        .cancel-btn {
            background-color: #FFD43B;
            color: black;
        }

        input{
            font-size: 20px;
            padding-left: 10px;
        }

    </style>
</head>
<body>
<div id="layout">
    <div id="enrollCard">
        <div id="logo"><img src="icons/logo.png"></div>
        <div id="enroll">회원가입</div>
        <div id="contents">
            <button type="button" id="idCheck" onclick="idCheck()">중복확인</button>
            <div class="line">
                <div class="top-line">
                    <div class="first-info">아이디</div>
                    <div class="second-info" id="idWarning">사용할 수 없는 아이디입니다.</div>
                </div>
                <div class="input-wrap">
                    <input name="userId" placeholder="아이디 입력(5~20자)" id="idInput" >
                </div>
            </div>

            <div class="line">
                <div class="top-line">
                    <div class="first-info">비밀번호</div>
                    <div class="second-info" id="pwdInfo"></div>
                </div>
                <div class="input-wrap">
                    <input name="userPwd" type="password" id="pwdInput" placeholder="비밀번호 입력 ( 문자, 숫자, 특수문자 포함 8~20자 )" >
                </div>
            </div>

            <div class="line">
                <div class="top-line">
                    <div class="first-info">비밀번호 확인</div>
                    <div class="second-info" id="pwdWarning"></div>
                </div>
                <div class="input-wrap">
                    <input type="password" id="pwdCheck" placeholder="비밀번호 재입력" >
                </div>
            </div>

            <div class="line">
                <div class="top-line">
                    <div class="first-info">이름</div>
                    <div class="second-info" id="nameWarning">이름을 확인해주세요.</div>
                </div>
                <div class="input-wrap">
                    <input name="userName" id="nameInput" placeholder="이름을 입력해주세요." >
                </div>
            </div>

            <div class="line">
                <div class="top-line">
                    <div class="first-info">전화번호</div>
                    <div class="second-info" id="phoneWarning"></div>
                </div>
                <div class="input-wrap">
                    <input name="userPhone" maxlength="13" id="phoneInput" placeholder="휴대폰 번호 입력( ‘-’ 포함 13자리 입력 )" >
                </div>
            </div>


            <div class="line">
                <div class="top-line">
                    <div class="first-info">생년월일</div>
                    <div class="second-info" id="birthWarning">생일을 입력해주세요.</div>
                </div>
                <div class="birth-group">
                    <select id="yearSelect" name="year">
                        <option  disabled selected>연도</option>
                    </select>
                    <select  id="monthSelect" name="month">
                        <option  disabled selected>월</option>
                    </select>
                    <select id="daySelect" name="day">
                        <option disabled selected>일</option>
                    </select>
                </div>
                <input type="hidden" name="userBirth" id="hiddenBirth">
            </div>

            <div class="line">
                <div class="top-line">
                    <div class="first-info">이메일 주소</div>
                    <div class="second-info" id="emailWarning">이메일을 확인해주세요.</div>
                </div>
                <div id="emailInputline">
                    <input id="emailInput" type="text" placeholder="이메일 주소">
                    <div class="at">@</div>
                    <select id="emailDomainSelect">
                        <option>naver.com</option>
                        <option>gmail.com</option>
                        <option>daum.net</option>
                        <option value="custom">직접입력</option>
                    </select>
                    <input type="text" id="customDomain" placeholder="도메인 입력" style="display: none;">
                </div>
                <input type="hidden" name="userEmail" id="hiddenEmail">
            </div>
            <div class="line" style="height: 150px">
                <div class="top-line">
                    <div class="first-info">주소</div>
                </div>
                <div class="input-wrap">
                    <input name="userAddress" style="margin-bottom: 11px" placeholder="주소를 입력해주세요.">
                    <input name="userAddressDetail" placeholder="상세 주소">
                </div>
            </div>
            <div class="btn-box">
                <button class="submit-btn" id="submitBtn">가입신청</button>
                <button class="cancel-btn" onclick="location.href='/'">돌아가기</button>
            </div>
        </div>
    </div>
</div>

<script>
    function idCheck() {
        const id = document.getElementById('idInput').value;
        document.getElementById('idWarning').style.display = "none";
        if(id.length < 5 || id.length > 20){
            alert("아이디는 5~20자 사이여야 합니다.")
            return;
        } else {
            getIdCheck({checkId : id}, drawIdCheck)
        }
        console.log("입력된 아이디:", id);
        // 이후 AJAX 요청 or 검증 로직 실행
    }

    function getIdCheck(id, callback) {
        $.ajax ({
            url: "/api/user/id",
            data: id,
            success: function (res){
                callback(res);
            }, error: function (){
                console.log("아이디 중복체크 ajax 실패");
            }
        })
    }

    function drawIdCheck(isCheck){
        const warning = document.getElementById("idWarning");
        const submitBtn = document.getElementById("submitBtn");

        warning.style.display = "block";

        if(isCheck === 'N') {
            warning.style.color = "red";
            warning.innerHTML = "사용할 수 없는 아이디입니다."
            return false;
        } else {
            warning.style.color = "green";
            warning.innerText = "사용 가능한 아이디입니다.";
            return true;
        }
    }

    document.getElementById("pwdInput").addEventListener('input', function () {
        const pwd = document.getElementById("pwdInput").value;
        const Info = document.getElementById("pwdInfo");
        const submitBtn = document.getElementById("submitBtn");

        Info.style.display = "none";
        submitBtn.disabled = false;

        if(pwd.length < 8 || pwd.length >= 20){
            Info.style.display = "block";
            Info.innerHTML = ("8~20자 이내의 비밀번호를 입력해주세요.");
            submitBtn.disabled = true;
        } else if (!/^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*()\-_=+{};:,<.>]).+$/.test(pwd)){
            Info.style.display = "block";
            Info.innerHTML = ("문자, 숫자, 특수문자를 포함해주세요.");
            submitBtn.disabled = true;
        }
    })

    document.getElementById("pwdCheck").addEventListener('input', function (){
        const pwd = document.getElementById("pwdInput").value;
        const pwdCheck = document.getElementById("pwdCheck").value;
        const warning = document.getElementById("pwdWarning");

        warning.style.display = "none";

        if(pwd.length >= 8 && pwd.length <= 20 && /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*()\-_=+{};:,<.>]).+$/.test(pwd) && pwd === pwdCheck){
            warning.style.display = "block";
            warning.style.color = "green";
            warning.innerHTML = "비밀번호와 일치합니다.";
            return true;
        } else if(pwd.length >= 8 && pwd.length <= 20 && /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*()\-_=+{};:,<.>]).+$/.test(pwd) && pwd !== pwdCheck) {
            warning.style.display = "block";
            warning.style.color = "red";
            warning.innerHTML = "비밀번호와 일치하지 않습니다.";
            return false;
        } else {
            warning.style.display = "block"
            warning.style.color = "red";
            warning.innerHTML = "비밀번호를 확인해주세요.";
            return false;
        }
    })

    document.getElementById("nameInput").addEventListener('input' , function (){
        const name = document.getElementById("nameInput").value;
        const warning = document.getElementById("nameWarning");

        warning.style.display = "none";

        if(!/^[가-힣]{2,5}$/.test(name)){
            warning.style.display = "block";
        }
    })


    document.getElementById("phoneInput").addEventListener('input', function () {
        const phone = document.getElementById("phoneInput").value;
        const warning = document.getElementById("phoneWarning");

        warning.style.display = "none";

        // 정규식: 010-1234-5678 형식만 허용
        const phoneRegex = /^010-\d{4}-\d{4}$/;

        if (!phoneRegex.test(phone)) {
            warning.style.display = "block";
            warning.innerHTML = "전화번호를 확인해주세요. (예: 010-1234-5678)";
            warning.style.color = "red";
            return false;
        } else {
            return true;
        }
    });

    window.addEventListener('DOMContentLoaded', function () {
        const yearSelect = document.getElementById("yearSelect");
        const monthSelect = document.getElementById("monthSelect");
        const daySelect = document.getElementById("daySelect");

        const now = new Date();
        const currentYear = now.getFullYear();

        // 연도: 1980 ~ 현재
        for (let y = currentYear; y >= 1980; y--) {
            const option = document.createElement("option");
            option.value = y;
            option.text = y;
            yearSelect.appendChild(option);
        }

        // 월: 1 ~ 12
        for (let m = 1; m <= 12; m++) {
            const option = document.createElement("option");
            option.value = m;
            option.text = m;
            monthSelect.appendChild(option);
        }

        // 일자 채우기 함수
        function populateDays(year, month) {
            daySelect.innerHTML = '<option disabled selected>일</option>'; // 초기화

            if (!year || !month) return;

            const daysInMonth = new Date(year, month, 0).getDate(); // 해당 월의 마지막 날

            for (let d = 1; d <= daysInMonth; d++) {
                const option = document.createElement("option");
                option.value = d;
                option.text = d;
                daySelect.appendChild(option);
            }
        }

        // 연도 또는 월 변경 시 일 자동 조정
        yearSelect.addEventListener('change', () => {
            const year = parseInt(yearSelect.value);
            const month = parseInt(monthSelect.value);
            if (!isNaN(year) && !isNaN(month)) {
                populateDays(year, month);
            }
        });

        monthSelect.addEventListener('change', () => {
            const year = parseInt(yearSelect.value);
            const month = parseInt(monthSelect.value);
            if (!isNaN(year) && !isNaN(month)) {
                populateDays(year, month);
            }
        });

    });

    function validateBirth(){
        const year = document.getElementById("yearSelect").value;
        const month = document.getElementById("monthSelect").value;
        const day = document.getElementById("daySelect").value;
        const warning = document.getElementById("birthWarning");

        if(year === "연도" || month === "월" || day === "일") {
            warning.style.display = "block";
            return false;
        } else {
            warning.style.display = "none";
            return true;
        }
    }

    document.getElementById("emailInput").addEventListener('input',function (){
        const frontemail = document.getElementById("emailInput").value;
        const selectDomain = document.getElementById("emailDomainSelect").value
        const backemail = document.getElementById("customDomain").value;
        const warning = document.getElementById("emailWarning");

        warning.style.display = "none";

        if (!/^[a-zA-Z0-9._%+-]+$/.test(frontemail)){
            warning.style.display = "block";
        }
        if ( selectDomain.value === "custom" && !/^[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/.test(backemail))  {
            warning.style.display = "block";
        }
    })

    document.getElementById("emailDomainSelect").addEventListener("change", function () {
        const selectedValue = this.value;
        const customInput = document.getElementById("customDomain");

        if (selectedValue === "custom") {
            customInput.style.display = "inline-block";
        } else {
            customInput.style.display = "none";
        }
    });

    document.getElementById("customDomain").addEventListener("input", function (){
        const custom = document.getElementById("customDomain").value;
        const warning = document.getElementById("emailWarning");
        const frontemail = document.getElementById("emailInput").value;

        warning.style.display = "none";

        if(!/^[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/.test(custom)){
            warning.style.display = "block";
        } else if (!/^[a-zA-Z0-9._%+-]+$/.test(frontemail)){
            warning.style.display = "block";
        } else {
            warning.style.display = "none";
        }
    })

    <%--여기서부터 유효성 검사--%>
    function runValidation() {
        const id = document.getElementById("idInput").value;
        const idWarning = document.getElementById("idWarning");

        const idCheck = document.getElementById("idCheck");
        idCheck.click();

        if (id.length < 5 || id.length > 20 || idWarning.innerText !== "사용 가능한 아이디입니다.") {
            alert("아이디를 다시 확인해주세요.");
            return false;
        }

        const pwd = document.getElementById("pwdInput").value;
        const pwdCheck = document.getElementById("pwdCheck").value;
        const pwdValid = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*()\-_=+{};:,<.>]).{8,20}$/;
        if (!pwdValid.test(pwd)) {
            alert("비밀번호 형식을 확인해주세요.");
            return false;
        }
        if (pwd !== pwdCheck) {
            alert("비밀번호가 일치하지 않습니다.");
            return false;
        }

        const name = document.getElementById("nameInput").value;
        if (!/^[가-힣]{2,5}$/.test(name)) {
            alert("이름을 확인해주세요.");
            return false;
        }

        const phone = document.getElementById("phoneInput").value;
        if (!/^010-\d{4}-\d{4}$/.test(phone)) {
            alert("전화번호를 확인해주세요. 예: 010-1234-5678");
            return false;
        }

        const year = document.getElementById("yearSelect").value;
        const monthRaw = document.getElementById("monthSelect").value;
        const dayRaw = document.getElementById("daySelect").value;

        if (year === "연도" || monthRaw === "월" || dayRaw === "일") {
            alert("생년월일을 선택해주세요.");
            return false;
        }

        const month = monthRaw.padStart(2, '0');
        const day = dayRaw.padStart(2, '0');
        document.getElementById("hiddenBirth").value = year + '-' + month + '-' + day ;


        const front = document.getElementById("emailInput").value;
        const domainSelect = document.getElementById("emailDomainSelect");
        const domain = domainSelect.value === "custom" ? document.getElementById("customDomain").value : domainSelect.value;
        const emailRegex = /^[a-zA-Z0-9._%+-]+$/;
        const domainRegex = /^[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        if (!emailRegex.test(front) || !domainRegex.test(domain)) {
            alert("이메일 주소를 확인해주세요.");
            return false;
        }

        // Hidden 필드 세팅
        document.getElementById("hiddenBirth").value = year + '-' + month + '-' + day ;
        document.getElementById("hiddenEmail").value = front + '@' + domain;

        return true;
    }


    document.getElementById("submitBtn").addEventListener("click", function (e) {
        e.preventDefault();

        if (!runValidation()) return;

        const data = {
            userId: document.getElementById("idInput").value,
            userPwd: document.getElementById("pwdInput").value,
            userName: document.getElementById("nameInput").value,
            userPhone: document.getElementById("phoneInput").value,
            userBirth: document.getElementById("hiddenBirth").value,
            userEmail: document.getElementById("hiddenEmail").value,
            userAddress: document.querySelector('input[name="userAddress"]').value,
            userAddressDetail: document.querySelector('input[name="userAddressDetail"]').value
        };

        $.ajax({
            url: "/insert.us",
            method: "POST",
            data: data,
            success: function (res) {
                alert("회원가입이 완료되었습니다!");
                // 원하면 페이지 이동
                location.href = "/";
            },
            error: function () {
                alert("회원가입에 실패했습니다. 다시 시도해주세요.");
            }
        });
    });

</script>
</body>
</html>
