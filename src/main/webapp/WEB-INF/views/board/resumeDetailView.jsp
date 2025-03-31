<%--
  Created by IntelliJ IDEA.
  User: user1
  Date: 25. 3. 31.
  Time: 오후 12:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        .wrap {
            width: 1560px;
            overflow: hidden;
            height: 820px;
            margin-left: 315px;
            margin-top: 130px;
            background-color: white;
        }

      .header-line{
          margin-left: 68px;
          margin-top: 30px;
          width: 1420px;
          height: 120px;
          border: solid 1px;
          text-align: center;
      }

    </style>
</head>
<body>
  <jsp:include page="../common/header.jsp"/>
  <div class="wrap">
    <div class="header-line">
        자소서 or 이력서
    </div>
  </div>
</body>
</html>
