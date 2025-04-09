  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <html>
  <head>
      <title>강의개설</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/AdminCreateClass.css" />
  </head>
  <body>
  <jsp:include page="../common/header.jsp" />
  <div class="main-container">
    <form class="form-box" method="post" action="insert.fo">

      <!-- 왼쪽 폼 영역 -->
      <div class="left-form">
        <!-- 강의명 -->
        <div class="form-group">
          <label for="className">강의 명</label>
          <input type="text" id="className" name="className" class="input-full">
          <input type="hidden" id="courseName" name="courseName">
        </div>

        <!-- 기간 -->
        <div class="form-row">
          <div class="form-group">
            <label>기간</label>
            <div class="date-row">
              <input type="date" name="startDate" class="date-input" placeholder="시작일" id="startDate">
              <span class="date-dash">-</span>
              <input type="date" name="endDate" class="date-input" placeholder="종료일" id="endDate">
            </div>
          </div>
          <div class="form-group">
            <label for="teacherName">강사</label>
            <input type="hidden" id="userNo" name="userNo">
            <input type="text" id="teacherName" name="teacher" class="input-half" onclick="openTeacherModal()" placeholder="미배정" readonly>
          </div>
        </div>
        <script>
          const startInput = document.getElementById('startDate');
          const endInput = document.getElementById('endDate');

          // 시작일이 변경될 때
          startInput.addEventListener('change', () => {
            const startDate = startInput.value;
            endInput.min = startDate; // 종료일 최소값 설정

            // 만약 종료일이 시작일보다 빠르면 초기화
            if (endInput.value && endInput.value < startDate) {
              endInput.value = ''; // or 경고창 띄우기
            }
          });

          document.addEventListener("DOMContentLoaded", function () {
            const inputA = document.getElementById("className");
            const inputB = document.getElementById("courseName");

            inputA.addEventListener("input", function () {
              inputB.value = inputA.value;
            });
          });
        </script>

        <!-- 강의실, 강사 -->
        <div class="form-row">
          <div class="form-group">
            <label for="description">강의 설명</label>
            <input type="text" id="description" name="description" class="input-half">
          </div>
          <div class="form-group">
            <label for="roomName">강의장</label>
            <input type="text" id="roomName" name="roomName" class="input-half">
          </div>
        </div>

        <!-- 강의 요일 -->
        <div class="week-box">
          <div class="form-group">
            <label>강의 요일</label>
            <button type="button" class="btn-outline-small" id="addClassTime">추가</button>
          </div>
          <div class="week-input-box" id="weekInputBox">
            <div class="input-box">
              <div class="info-box">요일 일정을 추가하세요.</div>
            </div>
          </div>
        </div>
      </div>

      <div class="right-section">
        <div class="calendar-container">
          <div class="calendar-header">
            <button type="button" class="calendar-nav" onclick="changeMonth(-1)">&#9664;</button>
            <h2 id="calendarTitle"></h2>
            <button type="button" class="calendar-nav" onclick="changeMonth(1)">&#9654;</button>
          </div>
          <div class="calendar-grid">
            <div class="calendar-day">월</div>
            <div class="calendar-day">화</div>
            <div class="calendar-day">수</div>
            <div class="calendar-day">목</div>
            <div class="calendar-day">금</div>
            <div class="calendar-day">토</div>
            <div class="calendar-day">일</div>
          </div>
          <div class="calendar-grid" id="calendarBody">
            <%-- 날짜 셀 렌더링 영역 --%>
          </div>
        </div>

        <script>
          <%-- 달력 생성 코드 --%>
          let currentDate = new Date();

          function renderCalendar(date) {
            const year = date.getFullYear();
            const month = date.getMonth();
            const firstDay = new Date(year, month, 1);
            const lastDay = new Date(year, month + 1, 0);
            const startDay = (firstDay.getDay() + 6) % 7; // 월요일 시작 (0~6)
            const prevMonthLastDate = new Date(year, month, 0).getDate();
            const totalDays = 42; // 6줄 × 7일
            const calendarBody = document.getElementById("calendarBody");
            calendarBody.innerHTML = "";

            document.getElementById("calendarTitle").textContent = year + "년 " + (month + 1) + "월";

            for (let i = 0; i < totalDays; i++) {
              const cell = document.createElement("div");
              cell.classList.add("calendar-cell");

              if (i < startDay) {
                const day = prevMonthLastDate - startDay + 1 + i;
                cell.textContent = day;
                cell.classList.add("prev-month");
              } else if (i < startDay + lastDay.getDate()) {
                const day = i - startDay + 1;
                cell.textContent = day;
                cell.classList.add("current-month");
              } else {
                const day = i - (startDay + lastDay.getDate()) + 1;
                cell.textContent = day;
                cell.classList.add("next-month");
              }

              calendarBody.appendChild(cell);
            }
          }

          function changeMonth(offset) {
            currentDate.setMonth(currentDate.getMonth() + offset);
            renderCalendar(currentDate);
          }

          // 초기 렌더링
          renderCalendar(currentDate);
        </script>

        <div class="schedule-box">
          <div class="form-group">
            <label>강의 일정</label>
            <button type="button" class="btn-outline-small" onclick="openScheduleModal()">추가</button>
          </div>
          <div class="schedule-input-box" id="schedule-input-box">
            <div class="input-box">
              <div class="info-box">일정을 추가하세요.</div>
            </div>
          </div>
        </div>
      </div>

      <div class="button-row">
        <button type="submit" class="btn-primary">개설</button>
        <button type="button" class="btn-outline">취소</button>
      </div>
    </form>
  </div>

  <%--  강의 요일 모달 --%>
  <div id="daysModal" class="modal-overlay" style="display: none">
    <div class="modal-wrap">
      <div class="modal-title">
        강의 요일 일정
      </div>
      <div class="week">
        요일
      </div>
      <div class="selectDay">
        <button class="btn-blank-small day-btn" style="width: 64px; height: 64px;">월</button>
        <button class="btn-blank-small day-btn" style="width: 64px; height: 64px;">화</button>
        <button class="btn-blank-small day-btn" style="width: 64px; height: 64px;">수</button>
        <button class="btn-blank-small day-btn" style="width: 64px; height: 64px;">목</button>
        <button class="btn-blank-small day-btn" style="width: 64px; height: 64px;">금</button>
        <button class="btn-blank-small day-btn" style="width: 64px; height: 64px;">토</button>
        <button class="btn-blank-small" style="width: 64px; height: 64px;">일</button>
      </div>
      <div style="margin-left: 40px; margin-top: 50px;">
        수업시간
      </div>
      <div class="selectClassTime">
        <div>
          <select class="hourSelect" id="startHour" style="margin-top: 25px; margin-left: 40px; border: solid 2px #E7E7E7;"></select>
          <span style="margin: 0px 12px;">:</span>
          <select class="minuteSelect" id="startMinute" style="border: solid 2px #E7E7E7;"></select>
          <span style="margin-left: 20px; ">시작</span>
        </div>
        <div>
          <select class="hourSelect" id="endHour" style="margin-top: 10px; margin-left: 40px; border: solid 2px #E7E7E7;"></select>
          <span style="margin: 0px 12px;">:</span>
          <select class="minuteSelect" id="endMinute" style="border: solid 2px #E7E7E7;"></select>
          <span style="margin-left: 20px; ">종료</span>
        </div>
      </div>
<%--      휴식 시간 안씀. --%>
<%--      <div style="margin-left: 40px; margin-top: 50px;">--%>
<%--        휴식시간--%>
<%--      </div>--%>
<%--      <div class="selectClassTime">--%>
<%--        <div>--%>
<%--          <select class="hourSelect" style="margin-top: 25px; margin-left: 40px; border: solid 2px #E7E7E7;"></select>--%>
<%--          <span style="margin: 0px 12px;">:</span>--%>
<%--          <select class="minuteSelect" style="border: solid 2px #E7E7E7;"></select>--%>
<%--          <span style="margin-left: 20px; ">시작</span>--%>
<%--        </div>--%>
<%--        <div>--%>
<%--          <select class="hourSelect" style="margin-top: 10px; margin-left: 40px; border: solid 2px #E7E7E7;"></select>--%>
<%--          <span style="margin: 0px 12px;">:</span>--%>
<%--          <select class="minuteSelect" style="border: solid 2px #E7E7E7;"></select>--%>
<%--          <span style="margin-left: 20px; ">종료</span>--%>
<%--        </div>--%>
<%--      </div>--%>
      <div class="save-btn-line">
        <div>
          <button onclick="saveModal()" class="btn-blank-small" style="margin-right: 15px;">저장</button>
          <button onclick="closeModal()" class="btn-blank-small">취소</button>
        </div>
      </div>
    </div>
  </div>

  <%--  강의 일정 모달 --%>
  <div id="scheduleModal" class="modal-overlay" style="display: none">
    <div class="modal-wrap">
      <div class="modal-title">
        강의 일정
      </div>
      <div style="margin-left: 40px; margin-top: 50px; margin-right: 40px;">
        <label for="schedule-title">강의 일정 명</label>
        <input type="text" name="schedule-title" id="schedule-title" class="input-half">
      </div>
      <div style="margin: 0 40px;">
        <label>강의 일정기간</label>
        <div class="date-row">
          <input type="date" name="scheduleStartDate" class="date-input" placeholder="시작일" id="scheduleStartDate">
          <span class="date-dash">-</span>
          <input type="date" name="scheduleEndDate" class="date-input" placeholder="종료일" id="scheduleEndDate">
        </div>
      </div>
      <div style="margin: 0 40px;">
        <label>일정 종류</label>
        <div style="margin-top: 10px">
          <select id="schedule-type">
            <option value="1">휴강</option>
            <option value="2">강의 일정</option>
            <option value="3">보강</option>
          </select>
        </div>
      </div>
      <div style="margin-left: 40px; margin-top: 50px; margin-right: 40px;">
        <label for="schedule-description">강의 일정 설명</label>
        <input type="text" name="schedule-title" id="schedule-description" class="input-half">
      </div>
      <div class="save-btn-line">
        <div>
          <button onclick="saveSchedule()" class="btn-blank-small" style="margin-right: 15px;">저장</button>
          <button onclick="closeScheduleModal()" class="btn-blank-small">취소</button>
        </div>
      </div>
    </div>
  </div>

  <script>
    const scheduleStartDate = document.getElementById('scheduleStartDate');
    const scheduleEndDate = document.getElementById('scheduleEndDate');

    // 시작일이 변경될 때
    scheduleStartDate.addEventListener('change', () => {
      const startDate = scheduleStartDate.value;
      scheduleEndDate.min = startDate; // 종료일 최소값 설정

      // 만약 종료일이 시작일보다 빠르면 초기화
      if (scheduleEndDate.value && scheduleEndDate.value < startDate) {
        scheduleEndDate.value = ''; // or 경고창 띄우기
      }
    });

    function openScheduleModal() {
      document.getElementById("scheduleModal").style.display = "flex";
      getTeacherList(drawTeacherList);
    }

    function closeScheduleModal() {
      document.getElementById("scheduleModal").style.display = "none";
    }

    function saveSchedule() {
      const start = document.getElementById("scheduleStartDate").value;
      const end = document.getElementById("scheduleEndDate").value;
      const title = document.getElementById("schedule-title").value;
      const description = document.getElementById("schedule-description").value;
      const type = document.getElementById("schedule-type").value;
      const scheduleBox = document.getElementById("schedule-input-box");

      const item = document.createElement("div");
      item.className = "class-time-item";

      const topDiv = document.createElement("div");
      topDiv.className = "topBox";

      const labelDiv = document.createElement("div");
      labelDiv.className = "label";
      labelDiv.innerHTML = start + " ~ " + end + " | " + '<strong>' + title + '</strong>';

      const inputTitle = document.createElement("input");
      inputTitle.type = "hidden";
      inputTitle.name = "scheduleTitle[]";
      inputTitle.value = title;

      const inputType = document.createElement("input");
      inputTitle.type = "hidden";
      inputTitle.name = "scheduleType[]";
      inputTitle.value = type;

      const timeDiv = document.createElement("div");
      timeDiv.className = "time";
      timeDiv.innerHTML = description;

      const inputDescription = document.createElement("input");
      inputDescription.type = "hidden";
      inputDescription.name = "scheduleDescription[]";
      inputDescription.value = description;

      const inputStartTime = document.createElement("input");
      inputStartTime.type = "hidden";
      inputStartTime.name = "scheduleStartTime[]";
      inputStartTime.value = start;

      const inputEndTime = document.createElement("input");
      inputEndTime.type = "hidden";
      inputEndTime.name = "scheduleEndTime[]";
      inputEndTime.value = start;

      const actionDiv = document.createElement("div");
      actionDiv.className = "actions";

      const editBtn = document.createElement("button");
      editBtn.textContent = "수정";
      // editBtn.onclick = function () { editSchedule(editBtn); };

      const deleteBtn = document.createElement("button");
      deleteBtn.textContent = "삭제";
      deleteBtn.onclick = function () { deleteSchedule(deleteBtn); };

      timeDiv.appendChild(inputTitle);
      timeDiv.appendChild(inputDescription);
      timeDiv.appendChild(inputStartTime);
      timeDiv.appendChild(inputEndTime);

      actionDiv.appendChild(editBtn);
      actionDiv.appendChild(deleteBtn);

      topDiv.appendChild(labelDiv);
      topDiv.appendChild(actionDiv);

      item.appendChild(topDiv);
      item.appendChild(timeDiv);

      scheduleBox.appendChild(item);
      console.log("hideInfoBox 작동 전!");
      hideInfoBox1();
      console.log("hideInfoBox 작동 후 !");
      closeScheduleModal();
    }

    function deleteSchedule(btn) {
      const item = btn.closest(".class-time-item");
      item.remove();
      hideInfoBox1();
    }

    function hideInfoBox1() {
      const scheduleBox = document.getElementById("schedule-input-box");
      const infoBox1 = document.querySelector("#schedule-input-box .input-box");

      console.log(infoBox1);

      if(scheduleBox.childElementCount === 1) {
        return infoBox1.style.display = "flex";
      } else {
        return infoBox1.style.display = "none";
      }
    }

  </script>

  <%--  강의 강사 리스트 모달 --%>
  <div id="teacherModal" class="modal-overlay" style="display: none">
    <div class="modal-wrap">
      <div class="modal-title">
        강의 강사 선택
      </div>
      <div id="selectTeacher">
        <table>
          <thead>
            <tr>
              <th>강사 번호</th>
              <th>강사 이름</th>
            </tr>
          </thead>
          <tbody>

          </tbody>
        </table>
      </div>
      <div class="save-btn-line">
        <div>
          <button onclick="closeTeacherModal()" class="btn-blank-small">취소</button>
        </div>
      </div>
    </div>
  </div>

  <script>
    function openTeacherModal() {
      document.getElementById("teacherModal").style.display = "flex";
      getTeacherList(drawTeacherList);
    }

    function closeTeacherModal() {
      document.getElementById("teacherModal").style.display = "none";
    }

    function getTeacherList(callback){
      $.ajax({
        url: "/api/user/allTeacherList",
        success: function (data) {
          // console.log(data);
          callback(data)
        }, error: function () {

        }
      })
    }

    function drawTeacherList(teacherList) {
      let str = "";
      for(let t of teacherList) {
        str += "<tr onclick='selectTeacher(this)'>" +
                "<td>" + t.userNo + "</td>" +
                "<td>" + t.userName + "</td>" +
                "</tr>";
      }
      const teacherListBody = document.querySelector("#selectTeacher tbody");
      teacherListBody.innerHTML = str;
    }

    function selectTeacher(select) {
      // const text = document.getElementById("userNo");
      // text.childNodes.item(0)
      // console.log(select.childNodes.item(0).innerText);
      // let no = select.
      const teacherNo = document.getElementById("userNo");
      teacherNo.value = select.childNodes.item(0).innerText;

      const teacherName = document.getElementById("teacherName");
      teacherName.value = select.childNodes.item(1).innerText;

      closeTeacherModal();
    }
  </script>

  <script>
    let selectedDays = new Map(); // Map으로 요일: 시간쌍 형태로 저장
    let editingElement = null;

    document.addEventListener("DOMContentLoaded", function () {
      const hourSelects = document.querySelectorAll(".hourSelect");
      const minuteSelects = document.querySelectorAll(".minuteSelect");

      for (let i = 0; i <= 23; i++) {
        const opt = document.createElement("option");
        opt.value = opt.text = i.toString().padStart(2, '0');
        hourSelects.forEach(select => select.appendChild(opt.cloneNode(true)));
      }
      for (let i = 0; i < 60; i += 5) {
        const opt = document.createElement("option");
        opt.value = opt.text = i.toString().padStart(2, '0');
        minuteSelects.forEach(select => select.appendChild(opt.cloneNode(true)));
      }

      document.getElementById("addClassTime").addEventListener("click", openModal);

      document.querySelectorAll(".day-btn").forEach(btn => {
        btn.addEventListener("click", () => {
          if (!btn.disabled) btn.classList.toggle("selected");
        });
      });
    });

    function openModal() {
      editingElement = null;
      document.getElementById("daysModal").style.display = "flex";
      resetDayButtons();
    }

    function closeModal() {
      document.getElementById("daysModal").style.display = "none";
      editingElement = null;
      resetDayButtons();
    }

    function resetDayButtons() {
      document.querySelectorAll(".day-btn").forEach(btn => {
        btn.classList.remove("selected");
        if (selectedDays.has(btn.textContent)) {
          btn.disabled = true;
          btn.style.opacity = 0.5;
        } else {
          btn.disabled = false;
          btn.style.opacity = 1;
        }
      });
    }

    function saveModal() {
      const startHour = document.getElementById("startHour").value;
      const startMin = document.getElementById("startMinute").value;
      const endHour = document.getElementById("endHour").value;
      const endMin = document.getElementById("endMinute").value;

      const start = startHour + ":" + startMin;
      const end = endHour + ":" + endMin;
      const selected = Array.from(document.querySelectorAll(".day-btn.selected"));
      const weekBox = document.getElementById("weekInputBox");

      if (editingElement) {
        const day = editingElement.dataset.day;
        editingElement.querySelector(".label").textContent = day + "요일 | 수업";
        editingElement.querySelector(".time").textContent = start + " ~ " + end;
        selectedDays.set(day, { startTime: start, endTime: end });
        editingElement = null;
        closeModal();
        return;
      }

      selected.forEach(function(btn) {
        const day = btn.textContent;
        const item = document.createElement("div");
        item.className = "class-time-item";
        item.dataset.day = day;

        const topDiv = document.createElement("div");
        topDiv.className = "topBox";

        const labelDiv = document.createElement("div");
        labelDiv.className = "label";
        labelDiv.innerHTML = day + "요일 | " + '<strong>수업</strong>';

        const inputDays = document.createElement("input");
        inputDays.type = "hidden";
        inputDays.name = "classDate[]";
        inputDays.value = day;

        const timeDiv = document.createElement("div");
        timeDiv.className = "time";
        timeDiv.textContent = "" + start + " ~ " + end;

        const inputStartTime = document.createElement("input");
        inputStartTime.type = "hidden";
        inputStartTime.name = "classStartTime[]";
        inputStartTime.value = start;

        const inputEndTime = document.createElement("input");
        inputEndTime.type = "hidden";
        inputEndTime.name = "classEndTime[]";
        inputEndTime.value = end;

        const actionDiv = document.createElement("div");
        actionDiv.className = "actions";

        const editBtn = document.createElement("button");
        editBtn.textContent = "수정";
        editBtn.onclick = function () { editDays(editBtn); };

        const deleteBtn = document.createElement("button");
        deleteBtn.textContent = "삭제";
        deleteBtn.onclick = function () { deleteDays(deleteBtn, day); };

        timeDiv.appendChild(inputStartTime);
        timeDiv.appendChild(inputEndTime);

        labelDiv.appendChild(inputDays);

        actionDiv.appendChild(editBtn);
        actionDiv.appendChild(deleteBtn);

        topDiv.appendChild(labelDiv);
        topDiv.appendChild(actionDiv);

        item.appendChild(topDiv);
        item.appendChild(timeDiv);

        weekBox.appendChild(item);
        selectedDays.set(day, { startTime: start, endTime: end });
      });
      console.log(selectedDays);
      hideInfoBox();
      closeModal();
    }

    function editDays(btn) {
      const item = btn.closest(".class-time-item");
      editingElement = item;
      const day = item.dataset.day;
      const timeText = item.querySelector(".time").textContent.match(/(\d{2}):(\d{2}) ~ (\d{2}):(\d{2})/);

      document.getElementById("startHour").value = timeText[1];
      document.getElementById("startMin").value = timeText[2];
      document.getElementById("endHour").value = timeText[3];
      document.getElementById("endMin").value = timeText[4];

      document.querySelectorAll(".day-btn").forEach(btn => {
        btn.classList.remove("selected");
        if (btn.textContent === day) {
          btn.classList.add("selected");
          btn.disabled = false;
          btn.style.opacity = 1;
        } else {
          btn.disabled = true;
          btn.style.opacity = 0.5;
        }
      });

      document.getElementById("daysModal").style.display = "flex";
    }

    function deleteDays(btn, day) {
      const item = btn.closest(".class-time-item");
      item.remove();
      selectedDays.delete(day);
      hideInfoBox();
    }

    function hideInfoBox() {
      const infoBox = document.querySelector(".input-box:first-child");
      if(selectedDays.size === 0) {
        return infoBox.style.display = "flex";
      } else {
        return infoBox.style.display = "none";
      }
    }

  </script>
  </body>
  </html>