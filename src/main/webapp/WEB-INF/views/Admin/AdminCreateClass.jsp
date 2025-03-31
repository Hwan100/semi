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
          <input type="text" name="startDate" class="date-input" placeholder="시작일">
          <span class="date-dash">-</span>
          <input type="text" name="endDate" class="date-input" placeholder="종료일">
          <button type="button" class="btn-all-day">종일</button>
        </div>
      </div>

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
        <button type="button" class="btn-outline-small">추가</button>
      </div>
        <div class="week-input-box">
        <div class="input-box">
          <div class="info-box">요일 일정을 추가하세요.</div>
        </div>
        </div>
      </div>
    </div>

    <div class="right-section">
      <div class="calendar-box">
        <div class="calendar-header">
          <button class="calendar-arrow">&#9664;</button>
          <span class="calendar-month">February</span>
          <button class="calendar-arrow">&#9654;</button>
        </div>

        <div class="calendar-grid">
          <div>Mo</div><div>Tu</div><div>We</div><div>Th</div><div>Fr</div><div>Sa</div><div>Su</div>
          <div>27</div><div>28</div><div>29</div><div>30</div><div>31</div><div>1</div><div>2</div>
          <div>3</div><div>4</div><div>5</div><div>6</div><div>7</div><div>8</div><div>9</div>
          <div>10</div><div>11</div><div>12</div><div>13</div><div>14</div><div>15</div><div>16</div>
          <div>17</div><div>18</div><div>19</div><div>20</div><div>21</div><div>22</div><div>23</div>
          <div>24</div><div>25</div><div>26</div><div>27</div><div>28</div><div>29</div><div>30</div>
        </div>
      </div>

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

</body>
</html>