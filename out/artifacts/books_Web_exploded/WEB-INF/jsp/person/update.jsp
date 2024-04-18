<%--
  修改我的信息页面
  Created by IntelliJ IDEA.
  User: R720
  Date: 2021/4/23
  Time: 21:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改我的信息</title>
    <%--    共同部分的css--%>
    <jsp:include page="common/css.jsp"/>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/person/update.css">
</head>
<body>
<%--   头部--%>
<jsp:include page="common/header.jsp"/>

<div class="content">
    <%--    导航菜单--%>
    <jsp:include page="common/menu.jsp"></jsp:include>

    <div class="show">

    <form method="post" action="${pageContext.request.contextPath}/information/storeUpdateInformation?informationId=${information.informationId}&id=${sessionScope.id}">


        <div class="one">
            <div class="one-left">
                <span>个性签名:</span>
            </div>
            <div class="one-right">
                <input type="text" name="signature" value="${information.signature}" >
            </div>
        </div>

        <div class="one">
            <div class="one-left">
                <span>邮箱:</span>
            </div>
            <div class="one-right">
                <input type="text" name="eMail" value="${information.eMail}">
            </div>
        </div>

        <div class="one">
            <div class="one-left">
                <span>QQ号:</span>
            </div>
            <div class="one-right">
                <input type="text" name="qq" value="${information.qq}">
            </div>
        </div>

        <div class="one">
            <div class="one-left">
                <span>手机号:</span>
            </div>
            <div class="one-right">
                <input type="text" name="phone" value="${information.phone}">
            </div>
        </div>
        <div class="one">
            <div class="one-left">
               <span>微信号：</span>
            </div>
            <div class="one-right">
                <input type="text" name="wechat" value="${information.wechat}">
            </div>
        </div>

        <div class="one">
            <div class="one-left" style="background-color: white">
                <span></span>
            </div>
            <div class="one-right">
                <input type="submit" value="提交">
            </div>
        </div>

    </form>


        <%--        底部--%>
        <jsp:include page="common/bottom.jsp"/>

    </div>
</div>
</body>

</html>
