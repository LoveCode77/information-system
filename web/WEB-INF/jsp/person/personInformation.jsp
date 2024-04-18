<%--
    个人主页
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
<%--    共同部分的css--%>
    <jsp:include page="common/css.jsp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/person/show.css">
</head>
<body>
<%--   头部--%>
<jsp:include page="common/header.jsp"/>

<div class="content">
<%--    导航菜单--%>
    <jsp:include page="common/menu.jsp"></jsp:include>

    <div class="show">
        <div class="one">
            <div class="one-left">
                <span>用户名:</span>
            </div>
            <div class="one-right">
                <span>${sessionScope.userName}</span>
            </div>
        </div>
        <div class="one">
            <div class="one-left">
                <span>个性签名:</span>
            </div>
            <div class="one-right">
                <span>${information.signature}</span>
            </div>
        </div>
        <div class="one">
            <div class="one-left">
                <span>邮箱:</span>
            </div>
            <div class="one-right">
                <span>${information.eMail}</span>
            </div>
        </div>
        <div class="one">
            <div class="one-left">
                <span>QQ号:</span>
            </div>
            <div class="one-right">
                <span>${information.qq}</span>
            </div>
        </div>
        <div class="one">
        <div class="one-left">
            <span>手机号:</span>
        </div>
        <div class="one-right">
            <span>${information.phone}</span>
        </div>
        </div>
        <div class="one">
        <div class="one-left">
            <span>微信号:</span>
        </div>
        <div class="one-right">
            <span>${information.wechat}</span>
        </div>
        </div>
<%--        底部--%>
        <jsp:include page="common/bottom.jsp"/>

    </div>
</div>
</body>

</html>
