<%--
   和我进行交流的用户列表
  Created by IntelliJ IDEA.
  User: R720
  Date: 2021/4/27
  Time: 1:26
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <title></title>
    <%--    共同部分的css--%>
    <jsp:include page="common/css.jsp"/>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/person/allChat.css">
</head>
<body>
<%--   头部--%>
<jsp:include page="common/header.jsp"/>

<div class="content">
    <%--    导航菜单--%>
    <jsp:include page="common/menu.jsp"></jsp:include>

        <div class="show">
            <c:forEach items="${lists}" var="list">
                <div class="one">
                    <div class="one-left">
                        <img src="${list.address}">
                    </div>
                    <div class="one-right">
                        <a href="${pageContext.request.contextPath}/privateLetter/query?sendId=${list.sendId}&id=${sessionScope.id}">${list.sendName}私信了我</a>
                    </div>
                </div>
            </c:forEach>


            <%--        底部--%>
            <jsp:include page="common/bottom.jsp"/>
        </div>
</div>
</body>
</html>
