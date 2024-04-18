<%--
  Created by IntelliJ IDEA.
  User: R720
  Date: 2021/4/20
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/commonHeader1.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/addWord.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/footer.css">
</head>
<body>
<div class="commonHeader">
    <div class="logo">
        <img src="${pageContext.request.contextPath}/static/image/logo.png">
    </div>
    <div class="nav">
        <ul>
            <Li><a href="http://localhost:8080/information/topics/homepage?id=${sessionScope.id}&page=1"> 首页</a></Li>
            <Li><a href="">个人</a></Li>
            <Li><a href="">心委模块</a></Li>
            <Li><a href=""></a></Li>
        </ul>
    </div>
    <div class="exit">
        <a href="">${sessionScope.userName}</a>
        <a href="${pageContext.request.contextPath}">退出系统</a>
        <a>${sessionScope.id}</a>
    </div>
</div>
<div class="banner">
</div>
<div class="centent">
    <div class="left">
        <ul>
            <li><a href="http://localhost:8080/information/word/automatic?id=${sessionScope.id}" >不良倾向帖子</a> </li>
            <li><a href="http://localhost:8080/information/word/automatic?id=${sessionScope.id}&sort=1">不良倾向回复</a> </li>
            <li><a href="http://localhost:8080/information/word/allWord">全部关键词</a> </li>
            <li><a href="http://localhost:8080/information/word/addWord">添加关键词</a> </li>
        </ul>
    </div>
    <div class="right">
        <div class="box">
            <form action="http://localhost:8080/information/word/storeWord" method="post">
                <div class="one">
                    <span>关键词:</span>
                </div>
                <div class="two">
                    <input type="text" name="wordContent" placeholder="">
                </div>
                <div class="three">
                    <span>词汇等级:</span>
                </div>
                <div class="four">
                    <select name="rank"  placeholder="" class="four">
                        <option value="1">一级词汇</option>
                        <option value="2">二级词汇</option>
                        <option value="3">三级词汇</option>
                        <option value="4">危险词汇</option>
                    </select>
                </div>
                <div class="five">
                    <input type="submit" value="提交">
                </div>
            </form>
        </div>
    </div>
</div>

<div class="footer">
    <div class="index">
        <a href="">关于我们|</a>
        <a href="">建议与反馈|</a>
        <a href="">开发者联系方式|</a>
        <a href="">投诉</a>
    </div>
</div>

</body>
</html>
