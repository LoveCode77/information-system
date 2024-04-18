<%--
  Created by IntelliJ IDEA.
  User: R720
  Date: 2021/4/30
  Time: 16:55
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员主页</title>
<%--    引入通用的css--%>
    <jsp:include page="common/commonCss.jsp"></jsp:include>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/administrator/index.css" >
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
<%--    <%@include file="../common/userMenu.jsp" %>--%>
<%--        表格名称--%>
        <div class="one">
            <div class="operation">
                <span style="line-height: 80px">操作</span>
            </div>

            <div class="id">
                <span>
                  ID
                </span>
            </div>
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
                    用户类型
                </span>
            </div>
            <div class="username">
                <span>
                    用户名
                </span>
            </div>
        </div>
<%--        表格每项--%>
        <c:forEach var="user" items="${lists}">
            <div class="one">
                <div class="operation">
                    <div class="update">
                    <span>
                        <a href="${pageContext.request.contextPath}/user/administratorUpdateIndex?deleteId=${user.id}">修改</a>
                    </span>
                    </div>
                    <div class="delete">
                    <span>
                        <a href="${pageContext.request.contextPath}/user/administratorDelete?id=${user.id}">删除</a>
                    </span>
                    </div>
                </div>
                <div class="id">
                <span>
                  ${user.id}
                </span>
                </div>
                <div class="student-number">
                <span>
                    ${user.studentNumber}
                </span>
                </div>
                <div class="password">
                <span>
                        ${user.password}
                </span>
                </div>
                <div class="type">
                <span>
                        ${user.type}
                </span>
                </div>
                <div class="username">
                <span>
                        ${user.userName}
                </span>
                </div>
            </div>
        </c:forEach>
<%--        分页--%>
        <%@include file="common/commonPage.jsp" %>
    </div>

</div>
<%--    底部--%>
    <%@ include file="common/commonBottom.jsp"%>
</body>
</html>
