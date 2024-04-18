<%--
  Created by IntelliJ IDEA.
  User: R720
  Date: 2021/4/10
  Time: 15:21
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>所有的帖子</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/commonHeader.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/homepage.css">
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
            <Li><a href="http://localhost:8080/information/information/information?id=${sessionScope.id}">个人</a></Li>
        </ul>
    </div>
    <div class="exit">
        <a href="">${requestScope.userName}</a>
        <a href="${pageContext.request.contextPath}">退出系统</a>
    </div>
</div>

<div class="banner">

</div>
<!--nav content left-->
<div class="centent">
    <div class="left">
        <ul>
            <li><a href="http://localhost:8080/information/topics/homepage?id=${sessionScope.id}" >看帖</a> </li>
            <li><a href="http://localhost:8080/information/topics/homepage?id=${sessionScope.id}&topicSectonId=2">学习交流</a> </li>
            <li><a href="http://localhost:8080/information/topics/homepage?id=${sessionScope.id}&topicSectonId=1">失物招领</a> </li>
            <li><a href="http://localhost:8080/information/topics/homepage?id=${sessionScope.id}&topicSectonId=3">校内活动</a> </li>
            <li><a href="http://localhost:8080/information/topics/homepage?id=${sessionScope.id}&topicSectonId=4">精品贴</a> </li>
        </ul>
    </div>
    <div class="right">
        <div class="top">
            <div class="sendTopic">
                <a href="http://localhost:8080//information/topics/addTopic?id=${requestScope.id}">发 帖</a>
            </div>
            <form method="post" action="http://localhost:8080/information/topics/homepage?id=${sessionScope.id}">
                <input type="submit" value="搜索">
                <input type="search" name="search" placeholder="请输入搜素">
            </form>
        </div>
        <div class="topics">
            <c:forEach var="topic" items="${requestScope.get('lists')}">
                <div class="topic">
                    <div class="left">
                        <span>${topic.topicReplyCount}</span>
                    </div>
                    <div class="center1">
                        <a href="http://localhost:8080//information/topics/oneTopic?topicId=${topic.topicId}&id=${requestScope.id}">
                                ${topic.topicTitle}
                        </a>
                    </div>
                    <div class="center2">
                        <a href="">${topic.userName}</a>
                    </div>
                    <div class="right">
                        <span>${topic.topicLastClickTime}</span>
                    </div>
                </div>
            </c:forEach>

        </div>
        <div class="bottom">
            <a href="http://localhost:8080/information/topics/homepage?id=${sessionScope.id}&page=1&topicSectonId=${sessionScope.topicSectonId}&search=${sessionScope.search}" class="first">1</a>
            <a href="http://localhost:8080/information/topics/homepage?id=${sessionScope.id}&page=2&topicSectonId=${sessionScope.topicSectonId}&search=${sessionScope.search}">2</a>
            <a href="http://localhost:8080/information/topics/homepage?id=${sessionScope.id}&page=3&topicSectonId=${sessionScope.topicSectonId}&search=${sessionScope.search}">3</a>
            <a href="http://localhost:8080/information/topics/homepage?id=${sessionScope.id}&page=4&topicSectonId=${sessionScope.topicSectonId}&search=${sessionScope.search}">4</a>
            <a href="http://localhost:8080/information/topics/homepage?id=${sessionScope.id}&page=5&topicSectonId=${sessionScope.topicSectonId}&search=${sessionScope.search}">5</a>
            <a href="http://localhost:8080/information/topics/homepage?id=${sessionScope.id}&page=${p+1}&topicSectonId=${sessionScope.topicSectonId}&search=${sessionScope.search}">下一页</a>
            <a href="http://localhost:8080/information/topics/homepage?id=${sessionScope.id}&page=${last}&topicSectonId=${sessionScope.topicSectonId}&search=${sessionScope.search}">尾页</a>
        </div>
    </div>
    <div class="right3">
        <div class="top3">
            <span>热帖榜</span>
        </div>

        <div class="center3">

            <c:forEach varStatus="s" var="t" items="${listRank}">
                <div class="one">
                    <div class="left3">
                        <span>${s.count}</span>
                    </div>
                    <div class="right33">
                        <span>${t}</span>
                    </div>
                </div>
            </c:forEach>



        </div>
        <div class="bottom3"></div>
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
