<%--
  Created by IntelliJ IDEA.
  User: R720
  Date: 2021/4/14
  Time: 21:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/login.css">
    <title>登录页面</title>
</head>
<body>
<div class="box">
    <h2>校园信息交流系统</h2>
    <form method="get" action=" http://localhost:8080/information/user/login">
        <div class="inputBox">
            <input type="text" name="userName" required="">
            <label>用户名</label>
        </div>
        <div class="inputBox">
            <input type="password" name="password" required="">
            <label>密码</label>
        </div>
        <input type="submit" name="" value="登录">
        <a href="${pageContext.request.contextPath}/user/register">注册</a>
    </form>
</div>
</body>
</html>
