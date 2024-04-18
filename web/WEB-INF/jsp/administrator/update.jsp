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
    <title>更新用户</title>
    <jsp:include page="common/commonCss.jsp"></jsp:include>
    <!--    -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/administrator/insert.css" >
</head>
<body>
<%--引入头部导航页和banner--%>
<jsp:include page="common/commonHeader.jsp"></jsp:include>
<div class="content">
    <%--    引入左侧导航页 如用户管理 帖子管理等--%>
    <jsp:include page="common/commonNav.jsp"></jsp:include>
    <div class="show">
        <%--        引入帖子管理的菜单--%>
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
        <form action="${pageContext.request.contextPath}/user/storeAdministratorUpdateIndex?id=${user.id}" method="post">
            <div class="one">
                <div class="student-number">
                    <input type="text" name="studentNumber" value="${user.studentNumber}">
                </div>
                <div class="password">
                    <input type="text" name="password" value="${user.password}">
                </div>
                <div class="type">
                    <input type="text" name="type" value="${user.type}">
                </div>
                <div class="username">
                    <input type="text" name="userName" value="${user.userName}">
                </div>
            </div>
            <input type="submit" value="确认修改">
        </form>



    </div>
</div>
<%--    底部--%>
<%@ include file="common/commonBottom.jsp"%>
</body>
</html>
