<%--
  Created by IntelliJ IDEA.
  User: R720
  Date: 2021/4/10
  Time: 16:33
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<html>
<head>
    <title>oneTopic</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/commonHeader.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/oneTopic.css">

</head>
<body>
<div class="commonHeader">
    <div class="logo">
        <img src="${pageContext.request.contextPath}/static/image/logo.png">
    </div>
    <div class="nav">
        <ul>
            <Li><a href="http://localhost:8080/information/topics/homepage?id=${sessionScope.id}&page=1"> 首页</a></Li>
            <Li><a href=""> 个人</a></Li>
        </ul>
    </div>
    <div class="exit">
        <a href="">${requestScope.userName}</a>
        <a href="${pageContext.request.contextPath}">退出系统</a>
    </div>
</div>
<div class="title">
  <p>${requestScope.get('header').topicTitle}</p>
    <div class="button">
        <a href="${pageContext.request.contextPath}/topics/addReply">回复</a>
    </div>
</div>
<div class="floor">
    <div class="left">
        <div class="top">
            <img src="${requestScope.get('header').imageAddress}">
        </div>
        <div class="center">
            <p>${requestScope.get('header').userName}</p>
        </div>
    </div>
    <div class="right">
        <p>${requestScope.get('header').topicContexts}</p>
    </div>
</div>

    <c:forEach var="list" items="${requestScope.get('lists')}">
            <div class="floor">
                <div class="left">
                    <div class="top">
                        <img src="${list.imageAddress}">
                    </div>
                    <div class="center">
                        <p>${list.userName}</p>
                    </div>
                </div>
                <div class="right">
                    <p>${list.replyContexts}</p>
                </div>
            </div>

    </c:forEach>

</body>
</html>
