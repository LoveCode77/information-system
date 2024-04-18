<%--
  Created by IntelliJ IDEA.
  User: R720
  Date: 2021/4/20
  Time: 16:09
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/commonHeader1.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/allWords.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/footer.css">
</head>
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

    </div>
</div>
<div class="banner">
</div>

<div class="content">
    <div class="left">
        <ul>
            <li><a href="http://localhost:8080/information/word/automatic?id=${sessionScope.id}" >不良倾向帖子</a> </li>
            <li><a href="http://localhost:8080/information/word/automatic?id=${sessionScope.id}&sort=1">不良倾向回复</a> </li>
            <li><a href="http://localhost:8080/information/word/allWord">全部关键词</a> </li>
            <li><a href="http://localhost:8080/information/word/addWord">添加关键词</a> </li>
        </ul>
    </div>

    <div class="right">
        <div class="topics">

            <div class="topic">
                <div class="one">
                    <span>操作</span>
                </div>
                <div class="two">
                    <a href="单个帖子.html">危险等级</a>
                </div>
                <div class="three">
                    <span>关键词</span>
                </div>
                <div class="four">
                    <a href="单个帖子.html">触发次数</a>
                </div>
            </div>
                <c:forEach items="${requestScope.words}" var="word">
                    <div class="topic">
                        <div class="one">
                            <div class="first">
                                <a href="http://localhost:8080/information/word/updateWord?wordId=${word.wordId}">修改</a>
                            </div>
                            <div class="second">
                                <a href="http://localhost:8080/information/word/deleteWord?wordId=${word.wordId}">删除</a>
                            </div>
                        </div>
                        <div class="two">
                            <a href="">${word.rank}</a>
                        </div>
                        <div class="three">
                            <span>   ${word.wordContent}</span>
                        </div>
                        <div class="four">
                            <a href=""> ${word.count}</a>
                        </div>
                    </div>
                </c:forEach>
        </div>
        <div class="bottom">
            <div class="bCenter">
                <c:if test="${page>1}">
                    <div>
                        <a href="http://localhost:8080/information/word/allWord?page=${page-1}">上一页</a>
                    </div>
                </c:if>
                <div>
                    <a href="http://localhost:8080/information/word/allWord?page=1">1</a>
                </div>
                <div>
                    <a href="http://localhost:8080/information/word/allWord?page=2">2</a>
                </div>
                <div>
                    <a href="http://localhost:8080/information/word/allWord?page=3">3</a>
                </div>
                <div>
                    <a href="http://localhost:8080/information/word/allWord?page=4">4</a>
                </div>
                <div>
                    <a href="http://localhost:8080/information/word/allWord?page=5">5</a>
                </div>
                <div>
                    <a href="http://localhost:8080/information/word/allWord?page=${pages}">尾页</a>
                </div>
                <c:if test="${page<pages}">
                    <div>
                        <a href="http://localhost:8080/information/word/allWord?page=${page+1}">下一页</a>
                    </div>
                </c:if>
                <div>
                    <input type="button" value="跳转到" id="about-dialog-button-bar"></input>
                </div>
                <div>
                    <input type="text" id="input-button">
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">

    let inputButto=document.getElementById("input-button");
    let about=document.getElementById("about-dialog-button-bar");
    about.onclick=function () {
    let  string =  inputButto.value;
    alert(${page});
    alert(${pages});
    if(${page<1}){
        string=1;
    }
    if(string>${pages}){
        string=${pages};
    }
    alert("last"+string);
    location.href="http://localhost:8080/information/word/allWord?page="+string;
    }
</script>
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
