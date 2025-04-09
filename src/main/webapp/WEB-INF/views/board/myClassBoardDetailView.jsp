<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>우리반 게시판</title>
  <link rel="stylesheet" href="/css/myclassDetail.css">
</head>
<body>
<jsp:include page="../common/header.jsp" />

<div class="container">

  <div class="title-area">
    <div class="board-title">${b.title}</div>
    <div class="button-area">
      <c:if test="${loginUser.userName eq b.userName}">
        <button onclick="postFormSubmit('edit')">수정</button>
        <button onclick="postFormSubmit('delete')">삭제</button>
      </c:if>
      <button onclick="history.back()">이전화면</button>
    </div>
    <div class="info-bar">
      <div class="left">우리반 게시판</div>
      <div class="right">작성자: ${b.userName} | ${b.createDate}</div>
      <input type="hidden" name="bno" value="${b.boardNo}">
    </div>
  </div>

  <!-- 첨부파일 -->
  <div class="file-area" style="margin-bottom: 20px; font-size: 16px;">
    첨부파일 :
    <c:choose>
      <c:when test="${not empty b.originName}">
        <a href="${b.changeName}" download="${b.originName}" style="margin-left: 10px; color: #0B9BE3; text-decoration: underline;">
            ${b.originName}
        </a>
      </c:when>
      <c:otherwise>
        <span style="margin-left: 10px; color: #999;">첨부파일이 없습니다.</span>
      </c:otherwise>
    </c:choose>
  </div>

  <!-- 본문 내용 -->
  <div class="content-area">
    <div class="board-content">
      ${b.content}
    </div>
  </div>

  <!-- 댓글 영역 -->
  <div class="comment-section">
    <div class="comment-header-line">
      <div class="comment-count">댓글 (<span id="rcount">0</span>)</div>
    </div>

    <!-- 댓글 입력창 -->
    <c:choose>
      <c:when test="${empty loginUser}">
        <textarea class="comment-input" placeholder="로그인 후 댓글 작성이 가능합니다." readonly></textarea>
      </c:when>
      <c:otherwise>
        <div class="comment-input-wrapper">
          <input type="text" id="content" class="comment-input" placeholder="댓글을 입력하세요">
          <button onclick="addReply();">등록</button>
        </div>
      </c:otherwise>
    </c:choose>

    <!-- 댓글 리스트 -->
    <div id="replyList"></div>
  </div>

  <!-- 폼 -->
  <form action="" method="GET" id="postForm">
    <input type="hidden" name="bno" value="${b.boardNo}">
  </form>

</div>

<script>
  window.onload = function () {
    drawReplyList({refBno: ${b.boardNo}});
  };

  function postFormSubmit(type) {
    const formEl = document.querySelector("#postForm");
    if (type === "edit") formEl.action = "updateForm.cl";
    if (type === "delete") formEl.action = "delete.cl";
    formEl.submit();
  }

  function addReply() {
    const content = document.querySelector("#content").value;
    if (!content.trim()) return alert("댓글 내용을 입력하세요.");
    insertReply({
      refBno: ${b.boardNo},
      replyWriter: "${loginUser.userId}",
      replyContent: content
    }, drawReplyList);
  }

  function drawReplyList(data) {
    getReplyList({boardNo: data.refBno}, function (list) {
      console.table(list);
      console.log("받은 댓글 목록 ▶", list);  // 추가
      const rcount = document.querySelector("#rcount");
      const replyList = document.querySelector("#replyList");
      rcount.innerText = list.length;
      replyList.innerHTML = "";

      for (const reply of list) {
        console.log("reply.userName: ", reply.userName);
        console.log("reply.content: ", reply.content);
        console.log("reply.date: ", reply.date);

        const div = document.createElement("div");
        div.className = "comment";

        const header = document.createElement("div");
        header.className = "comment-header";

        const authorSpan = document.createElement("span");
        authorSpan.className = "author";
        authorSpan.textContent = reply.userName;

        const dateSpan = document.createElement("span");
        dateSpan.className = "date";
        dateSpan.textContent = reply.date;

        header.appendChild(authorSpan);
        header.appendChild(dateSpan);

        const contentDiv = document.createElement("div");
        contentDiv.className = "text";
        contentDiv.textContent = reply.content;

        div.appendChild(header);
        div.appendChild(contentDiv);

        replyList.appendChild(div);
      }
    });
  }

  function getReplyList(data, callback) {
    $.ajax({
      url: "/api/board/reply",
      type: "get",
      data: data,
      success: callback,
      error: () => console.log("댓글 목록 로딩 실패")
    });
  }

  function insertReply(data, callback) {
    $.ajax({
      url: "/api/board/reply",
      type: "post",
      contentType: "application/json",
      data: JSON.stringify({
        boardNo: data.refBno,
        userNo: ${loginUser.userNo},
        content: data.replyContent
      }),
      success: function (res) {
        if (res === "success") callback(data);
        else alert("댓글 등록 실패");
      },
      error: () => console.log("댓글 등록 실패")
    });
  }
</script>

</body>
</html>