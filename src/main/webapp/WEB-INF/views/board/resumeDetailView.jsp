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
          font-size: 24px;
      }

      .division-title{
          font-size: 24px;
      }
    </style>
</head>
<body>
  <jsp:include page="../common/header.jsp"/>
  <div class="wrap">
    <div class="header-line">
        <div class="division-title"></div>
    </div>
  </div>

    <script>
        window.onload = function () {
            // URL에서 쿼리 파라미터 파싱
            const urlParams = new URLSearchParams(window.location.search);
            const division = urlParams.get('division');

            console.log(division);
            if (division) {
                document.getElementsByClassName('division-title')[0].innerHTML = division+'';
            }
            // URL에서 쿼리 파라미터 파싱
            const urlParams2 = new URLSearchParams(window.location.search);
            const title1 = urlParams.get('title1');
            const title2 = urlParams.get('title2');

            console.log(title1 || title2);
            if (title2) {
                document.getElementsByClassName('breadcrumb-text')[0].innerHTML = title1;
                document.getElementsByClassName('page-title')[0].innerHTML = title2;
            }
        };
    </script>
</body>
</html>
