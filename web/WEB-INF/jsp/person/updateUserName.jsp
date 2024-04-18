<%--
    改名
  Created by IntelliJ IDEA.
  User: R720
  Date: 2021/4/24
  Time: 18:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>改名</title>
    <%--    共同部分的css--%>
    <jsp:include page="common/css.jsp"/>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/person/updatePassword.css">
</head>
<body>
<%--   头部--%>
<jsp:include page="common/header.jsp"/>

<div class="content">
    <%--    导航菜单--%>
    <jsp:include page="common/menu.jsp"></jsp:include>

    <div class="show">
        <form action="${pageContext.request.contextPath}/information/storeUpdateUserName?id=${sessionScope.id}" method="post">
            <div class="one">
                <div class="one-left">
                    <span>请输入用户名:</span>
                </div>
                <div class="one-right">
                    <input type="text" name="userName"  placeholder="请输入用户名" required="required">                </div>
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
