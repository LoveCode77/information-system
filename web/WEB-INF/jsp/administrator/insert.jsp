<%--
  Created by IntelliJ IDEA.
  User: R720
  Date: 2021/4/30
  Time: 16:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%--    引入通用的css--%>
    <jsp:include page="common/commonCss.jsp"></jsp:include>
    <!--    -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/administrator/insert.css" >
</head>
<body>
<%--引入头部导航页和banner--%>
<jsp:include page="common/commonHeader.jsp"></jsp:include>

<div class="content">
    <jsp:include page="common/commonNav.jsp"></jsp:include>

    <div class="show">
        <jsp:include page="common/userMenu.jsp" flush="true"></jsp:include>

        <div class="one">
            <div class="student-number">
                <span>
                    学号
                </span>
            </div>
            <div class="password">
                <span>
                  密码
                </span>
            </div>
            <div class="type">
                <span>
                    类型
                </span>
            </div>
            <div class="username">
                <span>
                    用户名
                </span>
            </div>
        </div>
        <form action="${pageContext.request.contextPath}/user/storeAdministratorInsertIndex" method="post">
            <div class="one">
                <div class="student-number">
                    <input type="text" name="studentNumber">
                </div>
                <div class="password">
                    <input type="text" name="password">
                </div>
                <div class="type">
                    <input type="text" name="type">
                </div>
                <div class="username">
                    <input type="text" name="username">
                </div>
            </div>
            <input type="submit" value="确认添加">
        </form>

    </div>
</div>

<%--    底部--%>
<%@ include file="common/commonBottom.jsp"%>
</body>
</html>
