<%--
  Created by IntelliJ IDEA.
  User: R720
  Date: 2021/4/19
  Time: 17:26
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/commonHeader1.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/teacherIndex.css">
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
            <a href="">${sessionScope.userName}</a>
            <a href="${pageContext.request.contextPath}">退出系统</a>
            <a>${sessionScope.id}</a>
        </div>
    </div>
<div class="banner">
    </div>

<div class="content">
        <div class="cleft">
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
                        <span>学号</span>
                    </div>
                    <div class="two">
                        <a href="">用户名称</a>
                    </div>
                    <div class="three">
                        <span>消极言论</span>
                    </div>
                    <div class="four">
                        <a href="">帖子编号</a>
                    </div>
                    <div class="five">
                        <span>信息发送方式</span>
                    </div>
                </div>

                <c:if test="${sort==0}">
                    <c:forEach items="${requestScope.lists}" var="list">
                        <div class="topic">
                            <div class="one">
                                <span>${list.studentNumber}</span>
                            </div>
                            <div class="two">
                                <a href="${pageContext.request.contextPath}/privateLetter/query?sendId=${list.receiveId}&id=${id}"> ${list.userName}</a>
                            </div>
                            <div class="three">
                                <span>${list.wordContent}</span>
                            </div>
                            <div class="four">
                                <a href="http://localhost:8080/information/topics/oneTopic?topicId=${list.topicId}&id=${id}"> ${list.topicId}</a>
                            </div>
                            <div class="five">
                                <span>${list.type}</span>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
                <c:if test="${sort!=0}">
                    <c:forEach items="${requestScope.lists}" var="list">
                        <div class="topic">
                            <div class="one">
                                <span>${list.studentNumber}</span>
                            </div>
                            <div class="two">
                                <a href="${pageContext.request.contextPath}/privateLetter/query?sendId=${list.receiveId}&id=${id}"> ${list.userName}</a>
                            </div>
                            <div class="three">
                                <span>${list.wordContent}</span>
                            </div>
                            <div class="four">
                                <a href=""> ${list.replyId}</a>
                            </div>
                            <div class="five">
                                <span>    ${list.type}</span>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
            </div>
            <div class="bottom">
                <div class="bCenter">
                    <c:if test="${page>1}">
                        <div>
                            <a href="http://localhost:8080/information/word/automatic?sort=${sort}&$page=${page-1}&id=${id}">上一页</a>
                        </div>
                    </c:if>
                    <div>
                        <a href="http://localhost:8080/information/word/automatic?sort=${sort}&page=1&id=${id}">1</a>
                    </div>
                    <div>
                        <a href="http://localhost:8080/information/word/automatic?sort=${sort}&page=2&id=${id}">2</a>
                    </div>
                    <div>
                        <a href="http://localhost:8080/information/word/automatic?sort=${sort}&page=3&id=${id}">3</a>
                    </div>
                    <div>
                        <a href="http://localhost:8080/information/word/automatic?sort=${sort}&page=4&id=${id}">4</a>
                    </div>
                    <div>
                        <a href="http://localhost:8080/information/word/automatic?sort=${sort}&page=5&id=${id}">5</a>
                    </div>
                    <div>
                        <a href="http://localhost:8080/information/word/automatic?sort=${sort}&page=${pages}&id=${id}">尾页</a>
                    </div>
                    <c:if test="${page<pages}">
                        <div>
                            <a href="http://localhost:8080/information/word/automatic?sort=${sort}&page=${page+1}&id=${id}">下一页</a>
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
        location.href="http://localhost:8080/information/word/automatic?sort=${sort}&page="+string+"&id=${id}";
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
