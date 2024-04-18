<%--
  Created by IntelliJ IDEA.
  User: R720
  Date: 2021/4/14
  Time: 22:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>请输入你的个人信息</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/login/register.css">
</head>
<body>
<form action="${pageContext.request.contextPath}/user/registerInformation" method="post">
    <div class="content">
        <div class="header">
            <span>请填写你的个人信息</span>
        </div>
        <div class="one">
            <div class="left">
                <span>学号：</span>
            </div>
            <div class="right">
                <input type="text" name="studentNumber" required="required" placeholder="请输入学号">
            </div>
        </div>
        <div class="one">
            <div class="left">
                <span>用户名：</span>
            </div>
            <div class="right">
                <input type="text" name="userName" placeholder="请输入用户名" required="required">
            </div>
        </div>
        <div class="one">
            <div class="left">
                <span>密码：</span>
            </div>
            <div class="right">
                <input type="password" name="password"  placeholder="请输入密码" required="required">
            </div>
        </div>
        <div class="one">
            <div class="left">
                <span>确认密码：</span>
            </div>
            <div class="right">
                <input type="password" name="password1"  placeholder="请再次输入密码" required="required">
            </div>
        </div>
        <div class="one">
            <div class="left">
                <span>个性签名：</span>
            </div>
            <div class="right">
                <input type="text" name="signature" value="${information.signature}" required="required" placeholder="你的签名">
            </div>
        </div>
        <div class="one">
            <div class="left">
                <span>邮箱：</span>
            </div>
            <div class="right">
                <input type="text" name="eMail" value="${information.eMail}" required="required" placeholder="你的邮箱">
            </div>
        </div>
        <div class="one">
            <div class="left">
                <span>QQ：</span>
            </div>
            <div class="right">
                <input type="text" name="qq" value="${information.qq}" required="required" placeholder="你的QQ">
            </div>
        </div>
        <div class="one">
            <div class="left">
                <span>手机号：</span>
            </div>
            <div class="right">
                <input type="text" name="phone" value="${information.phone}" required="required" placeholder="你的手机号">
            </div>
        </div>
        <div class="one">
            <div class="left">
                <span>微信号：</span>
            </div>
            <div class="right">
                <input type="text" name="wechat" value="${information.wechat}" required="required" placeholder="你的微信号">
            </div>
        </div>
        <div class="one">
            <div class="left">
                <span></span>
            </div>
            <div class="right">
                <input type="submit" value="提交">
            </div>
        </div>

    </div>
</form>
</body>
</html>
