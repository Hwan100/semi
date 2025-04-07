<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: user1
  Date: 25. 3. 26.
  Time: 오후 3:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>대시보드</title>

</head>
<body>
    <jsp:include page="common/header.jsp" />
<%--    <c:choose>--%>
<%--        <c:when test="${USER_ROLE == 1}">--%>

<%--        </c:when>--%>
<%--        <c:when test="${USER_ROLE == 2}">--%>

<%--        </c:when>--%>
<%--        <c:when test="${USER_ROLE == 3}">--%>

<%--        </c:when>--%>
<%--        <c:otherwise>--%>

<%--        </c:otherwise>--%>
<%--    </c:choose>--%>
    <jsp:include page="admin/main.jsp" />
</body>
</html>
