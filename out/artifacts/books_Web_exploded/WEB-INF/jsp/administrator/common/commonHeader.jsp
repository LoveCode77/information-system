<%--
  Created by IntelliJ IDEA.
  User: R720
  Date: 2021/5/7
  Time: 12:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="commonHeader">
    <div class="logo">
        <img src="${pageContext.request.contextPath}/static/image/logo.png">
    </div>
    <div class="nav">
        <ul>
            <Li><a href="http://localhost:8080/information/topics/homepage?id=${sessionScope.id}&page=1"> 首页</a></Li>
            <Li><a href="http://localhost:8080/information/information/information?id=${sessionScope.id}">个人</a></Li>
            <Li><a href="http://localhost:8080/information/user/administratorIndex">管理页面</a></Li>
        </ul>
    </div>
    <div class="exit">
        <a href="">${requestScope.userName}</a>
        <a href="${pageContext.request.contextPath}">退出系统</a>
    </div>
</div>
<div class="banner">
</div>
