<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 작성</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4fbff; }
        .container { width: 80%; margin: 160px 40px 0 310px; background-color: #fff; padding: 20px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); }
        .title { font-size: 22px; font-weight: bold; text-align: center; margin-bottom: 20px; }
        table { width: 100%; border-collapse: collapse; }
        table th, table td { padding: 10px; }
        table th { width: 15%; text-align: left; }
        input[type=text], textarea { width: 20%; padding: 8px; border: 1px solid #ccc; border-radius: 4px; }
        textarea { font-size: 16px; height: 200px; resize: none; border:1px solid #ccc;}
        .btn-submit { padding: 8px 20px; background-color: #1d4ed8; color: white; border: none; border-radius: 4px; cursor: pointer; }
        .btn-submit:hover { background-color: #1e40af; }
        .btn-secondary { padding: 8px 20px; background-color: #ccc; color: black; border: none; border-radius: 4px; cursor: pointer; }
    </style>
</head>
<body>

<jsp:include page="../common/header.jsp" />

<div class="container">
    <div class="title">공지사항 작성</div>

    <form id="enrollForm" method="post" action="insert.no" enctype="multipart/form-data">
        <table>
            <tr>
                <th><label for="title">제목</label></th>
                <td><input type="text" id="title" name="title"  required></td>
            </tr>
            <tr>
                <th><label for="writer">작성자</label></th>
                <td><input type="text" id="writer" value="${loginUser.userId}" name="boardWriter" readonly></td>
                <input type="hidden" name="userNo" value="${loginUser.userNo}" />
            </tr>
            <tr>
                <th><label for="branch">지점명</label></th>
                <td><input type="text" id="branch" name="branch" required></td>
            </tr>
            <tr>
                <th><label for="upfile">첨부파일</label></th>
                <td><input type="file" id="upfile" class="form-control-file border" name="upfile"></td>
            </tr>
            <tr>
                <th style="vertical-align: top;"><label for="content">내용</label></th>
                <td><textarea id="content" name="content" required style="border: 1px solid #ccc; width: 80%"></textarea></td>
            </tr>
        </table>

        <div style="text-align: right; margin-top: 20px;">
            <button type="submit" class="btn-submit">등록</button>
            <button onclick="location.href='notice.bo'" class="btn-secondary">취소</button>
        </div>
    </form>
</div>

<script>
    document.getElementById('title').required = true;
    document.getElementById('branch').required = true;
    document.getElementById('content').required = true;
</script>

<script>

</script>

</body>
</html>