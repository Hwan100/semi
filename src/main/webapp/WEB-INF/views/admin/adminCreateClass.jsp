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
    <div class="form-box">

      <!-- 왼쪽 폼 영역 -->
      <div class="left-form">
        <!-- 강의명 -->
        <div class="form-group">
          <label for="className">강의 명</label>
          <input type="text" id="className" name="className" class="input-full">
        </div>

        <!-- 기간 -->
        <div class="form-group">
          <label>기간</label>
          <div class="date-row">
            <input type="date" name="startDate" class="date-input" placeholder="시작일" id="startDate">
            <span class="date-dash">-</span>
            <input type="date" name="endDate" class="date-input" placeholder="종료일" id="endDate">
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
        </script>

        <!-- 강의실, 강사 -->
        <div class="form-row">
          <div class="form-group half">
            <label for="classroom">강의실 지정</label>
            <input type="text" id="classroom" name="classroom" class="input-half">
          </div>
          <div class="form-group half">
            <label for="teacher">강사</label>
            <input type="text" id="teacher" name="teacher" class="input-half">
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
<%--        <div class="calendar-box">--%>
<%--          <div class="calendar-header">--%>
<%--            <button class="calendar-arrow">&#9664;</button>--%>
<%--            <span class="calendar-month">February</span>--%>
<%--            <button class="calendar-arrow">&#9654;</button>--%>
<%--          </div>--%>

<%--          <div class="calendar-grid">--%>
<%--            <div>Mo</div><div>Tu</div><div>We</div><div>Th</div><div>Fr</div><div>Sa</div><div>Su</div>--%>
<%--            <div>27</div><div>28</div><div>29</div><div>30</div><div>31</div><div>1</div><div>2</div>--%>
<%--            <div>3</div><div>4</div><div>5</div><div>6</div><div>7</div><div>8</div><div>9</div>--%>
<%--            <div>10</div><div>11</div><div>12</div><div>13</div><div>14</div><div>15</div><div>16</div>--%>
<%--            <div>17</div><div>18</div><div>19</div><div>20</div><div>21</div><div>22</div><div>23</div>--%>
<%--            <div>24</div><div>25</div><div>26</div><div>27</div><div>28</div><div>29</div><div>30</div>--%>
<%--          </div>--%>
<%--        </div>--%>
        <div class="calendar-container">
          <div class="calendar-header">
            <button class="calendar-nav" onclick="changeMonth(-1)">&#9664;</button>
            <h2 id="calendarTitle"></h2>
            <button class="calendar-nav" onclick="changeMonth(1)">&#9654;</button>
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
            <button type="button" class="btn-outline-small">추가</button>
          </div>
          <div class="schedule-input-box" >
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
    </div>
  </div>

  <div id="modal" class="modal-overlay" style="display: none">
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

<%--  <script>--%>
<%--    document.addEventListener("DOMContentLoaded", function () {--%>
<%--      const addClassTime = document.getElementById('addClassTime');--%>
<%--      addClassTime.addEventListener("click", openModal);--%>

<%--      // 요일 버튼 클릭 시 선택 토글--%>
<%--      const dayButtons = document.querySelectorAll(".day-btn");--%>
<%--      dayButtons.forEach(button => {--%>
<%--        button.addEventListener("click", function () {--%>
<%--          button.classList.toggle("selected");--%>
<%--        });--%>
<%--      });--%>
<%--    });--%>

<%--    function openModal(){--%>
<%--      document.getElementById('modal').style.display = "flex";--%>
<%--    }--%>

<%--    function  closeModal(){--%>
<%--      document.getElementById('modal').style.display = "none";--%>
<%--    }--%>

<%--    function savaModal() {--%>
<%--      alert("변경사항이 저장되었습니다.");--%>
<%--      closeModal();--%>
<%--    }--%>

<%--    document.addEventListener("DOMContentLoaded", function () {--%>
<%--      const hourSelects = document.querySelectorAll(".hourSelect");--%>
<%--      const minuteSelects = document.querySelectorAll(".minuteSelect");--%>

<%--      // 시: 0~23--%>
<%--      for (let i = 0; i <= 23; i++) {--%>
<%--        const option = document.createElement("option");--%>
<%--        option.value = i;--%>
<%--        option.textContent = i.toString().padStart(2, '0');--%>
<%--        hourSelects.forEach(select => {--%>
<%--          select.appendChild(option.cloneNode(true)); // 복제해서 각각 넣어줘야 함--%>
<%--        });--%>
<%--      }--%>

<%--      // 분: 0~59--%>
<%--      for (let i = 0; i <= 59; i++) {--%>
<%--        const option = document.createElement("option");--%>
<%--        option.value = i;--%>
<%--        option.textContent = i.toString().padStart(2, '0');--%>
<%--        minuteSelects.forEach(select => {--%>
<%--          select.appendChild(option.cloneNode(true)); // cloneNode 꼭 필요!--%>
<%--        });--%>
<%--      }--%>
<%--    });--%>
<%--  </script>--%>

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
      document.getElementById("modal").style.display = "flex";
      resetDayButtons();
    }

    function closeModal() {
      document.getElementById("modal").style.display = "none";
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

      // selected.forEach(btn => {
      //   const day = btn.textContent;
      //   const item = document.createElement("div");
      //   item.className = "class-time-item";
      //   item.dataset.day = day;
      //   // item.innerHTML = '<div class="label">' + day + '요일 | 수업</div>' +
      //   //                   '<div class="time">' + start + " ~ " + end + '</div>' +
      //   //                   '<div class="actions">' +
      //   //                       '<button onclick="editSchedule(this)">수정</button>' +
      //   //                       '<button onclick="deleteSchedule(this, ' + day + ')">삭제</button>'
      //   //                   '</div>';
      //   item.querySelector(".label").textContent = (day + "요일 | 수업");
      //   item.querySelector(".time").textContent = start + " ~ " + end;
      //   item.querySelector(".actions button:nth-child(2)").setAttribute("onclick", "deleteSchedule(this, '" + day + "')");
      //   weekBox.appendChild(item);
      //   selectedDays.add(day);
      // });

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

        const timeDiv = document.createElement("div");
        timeDiv.className = "time";
        timeDiv.textContent = "" + start + " ~ " + end;

        const actionDiv = document.createElement("div");
        actionDiv.className = "actions";

        const editBtn = document.createElement("button");
        editBtn.textContent = "수정";
        editBtn.onclick = function () { editSchedule(editBtn); };

        const deleteBtn = document.createElement("button");
        deleteBtn.textContent = "삭제";
        deleteBtn.onclick = function () { deleteSchedule(deleteBtn, day); };

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

    function editSchedule(btn) {
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

      document.getElementById("modal").style.display = "flex";
    }

    function deleteSchedule(btn, day) {
      const item = btn.closest(".class-time-item");
      item.remove();
      selectedDays.delete(day);
      hideInfoBox();
    }

    function hideInfoBox(qualifiedName, value) {
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