<%--
  Created by IntelliJ IDEA.
  User: R720
  Date: 2021/5/8
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="header">
    <div class="logo">
        <img src="${pageContext.request.contextPath}/static/image/logo.png">
    </div>
    <div class="title">
        <span>校园匿名信息交流平台</span>
    </div>
    <div class="little-title">

        <a  style="color:white;text-decoration: none" href="http://localhost:8080/information/topics/homepage?id=${sessionScope.id}&page=1"><span>个人主页</span></a>
    </div>
</div>
<div class="content-top">
    <div class="head-portrait">
        <img src="${url}">
    </div>
    <div class="username">
        <span>用户名：${sessionScope.userName}</span>
    </div>
</div>
