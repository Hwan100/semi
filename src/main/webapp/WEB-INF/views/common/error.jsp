<%--
  Created by IntelliJ IDEA.
  User: user1
  Date: 25. 4. 3.
  Time: 오후 5:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8"/>
  <title>Document</title>
</head>
<body>
<jsp:include page="header.jsp" />

<br>
<div align="center">
  <img src="https://cdn2.iconfinder.com/data/icons/oops-404-error/64/208_balloon-bubble-chat-conversation-sorry-speech-256.png">
  <br><br>
  <h1 style="font-weight:bold; color:red;">${errorMsg}</h1>
</div>
<br>

</body>
</html>
