<%--
  Created by IntelliJ IDEA.
  User: R720
  Date: 2021/4/12
  Time: 22:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/commonHeader.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/send.css">

    <!--富文本插件-->
    <script  type="text/javascript" src="${pageContext.request.contextPath}/static/ueditor/utf8-php/ueditor.config.js"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/static/ueditor/utf8-php/ueditor.all.min.js"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/static/ueditor/utf8-php/lang/zh-cn/zh-cn.js"></script>

</head>
<body>
<script type="text/javascript">
    UE.getEditor('pcArticleCont')   //pcArticleCont对应调用的id
</script>

<div class="commonHeader">
    <div class="logo">
        <img src="${pageContext.request.contextPath}/static/image/logo.png">
    </div>
    <div class="nav">
        <ul>
            <Li><a href="http://localhost:8080/information/topics/homepage?id=${id}&page=1"> 首页</a></Li>
            <Li><a href="">个人</a></Li>
        </ul>
    </div>
    <div class="exit">
        <a href="">${requestScope.userName}</a>
        <a href="${pageContext.request.contextPath}">退出系统</a>
    </div>
</div>

<div class="banner">
</div>

<form method="post" action="${pageContext.request.contextPath}/topics/storeTopic?id=${requestScope.id}">

    <div class="zhong">
        <input type="text" name="topicTitle" placeholder="标题">
        <select name="topicSectonId"  placeholder="帖子类型">
            <option value="0">无</option>
            <option value="1">失物招领</option>
            <option value="2">学习交流</option>
            <option value="3">校内活动</option>
            <option value="4">精品贴</option>
        </select>
    </div>
    <div class="center">
        <script class="input" type="text/plain" id="pcArticleCont" name="pcArticleCont"  ></script>
    </div>
    <div class="footer">
        <input type="submit" value="发 表">
    </div>

</form>
</body>
</html>
