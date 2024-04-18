<%--
  Created by IntelliJ IDEA.
  User: R720
  Date: 2021/4/12
  Time: 22:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录失败</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/login/show.css">

</head>
<body>
<div>
    <div>
        <span>
           你的输入信息有误，请检查用户名或密码！或进行
            <a href="http://localhost:8080/information/user/register">注册</a>

        </span>
    </div>
</div>
</body>
</html>
