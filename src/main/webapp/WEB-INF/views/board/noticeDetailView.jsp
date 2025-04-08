<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>공지사항</title>
  <link rel="stylesheet" href="/css/myclassDetail.css">
</head>
<body>
<jsp:include page="../common/header.jsp"/>

<div class="container">

  <div class="title-area">
    <div class="board-title">${b.title }</div>

    <div class="button-area">
<c:if test="${loginUser.userName eq b.userName || loginUser.userRole eq '3'}">
  <button onclick="postFormSubmit('edit')"><a>수정</a></button>
  <button onclick="postFormSubmit('delete')"><a>삭제</a></button>
</c:if>
      <button onclick="history.back()">이전화면</button>
<%--      <button onclick="location.href='myclassList.bo'">목록</button>--%>
    </div>

    <div class="info-bar">
      <div class="left">공지사항</div>
      <div class="right">작성자: >${b.userName } | ${b.createDate }</div>
    </div>
    <div>
      <div class="left">첨부파일</div>
      <div class="right">
        <c:choose>
          <c:when test="${not empty b.originName }">
            <a href="${b.changeName }" download="${b.originName }">${b.originName }</a>
          </c:when>
          <c:otherwise>
            첨부파일이 없습니다.
          </c:otherwise>
        </c:choose>
      </div>
    </div>
  </div>

  <table id="contentArea" class="content-area">

    <tr>
      <th>내용</th>
      <td colspan="3"></td>
    </tr>
    <tr>
      <td colspan="4"><p style="height:150px;">${b.content}</p></td>
    </tr>
  </table>
  <br>
  <form action="" method="GET" id="postForm">
    <input type="hidden" name="bno" value="${b.boardNo}">
  </form>

  <script>
    function postFormSubmit(type){
      const formEl = document.querySelector("#postForm");
      switch(type){
        case "edit" : {
          $(formEl).attr("action", "updateForm.no");
        }break;
        case "delete":{
          //formEl.action = "delete.bo";
          $(formEl).attr("action", "delete.no")
        }break;
      }
      $(formEl).submit();
    }
  </script>
  </div>

</body>
</html>
