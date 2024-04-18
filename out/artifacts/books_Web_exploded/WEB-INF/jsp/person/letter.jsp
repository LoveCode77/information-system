
<%--
    聊天窗口
  Created by IntelliJ IDEA.
  User: R720
  Date: 2021/4/26
  Time: 22:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.kuang.util.DataToCommon" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.5.1.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/chatWindow.css">
    <title>交流页面</title>
</head>
<body>
<div class="header">
    <div class="logo">
        <img src="${pageContext.request.contextPath}/static/image/logo.png">
    </div>
    <div class="title">
        <span>校园匿名信息交流平台私聊系统</span>
    </div>
    <div class="explain">
        <span>呵护隐私，关注您的健康成长</span>
    </div>
</div>
<div class="content-top">
    <c:forEach items="${lists}" var="list">
        <c:if test="${list.sendId!=id}">
            <div class="left-one">
                <div class="head-portrait">
                    <img src="${addressSend}">
                </div>
                <div class="username">
                    <span>${sendName} ${list.time.month}/${list.time.day} ${list.time.hours}:${list.time.minutes}:${list.time.seconds}</span>
                </div>
                <div class="information">
            <span>
                    ${list.content}
            </span>
                </div>
            </div>
        </c:if>
        <c:if test="${list.sendId==id}">
            <div class="right-one">
                <div class="head-portrait">
                    <img src="${addressReceive}">
                </div>
                <div class="username">

                    <span>${userName}  ${list.time.month}/${list.time.day} ${list.time.hours}:${list.time.minutes}:${list.time.seconds} </span>
                </div>
                <div class="information">
            <span>
                ${list.content}
            </span>
                </div>
            </div>
        </c:if>
    </c:forEach>
</div>
<div style="width: 998px;height: 20px;border-right:#f0f0f0 solid 1px; border-left:#f0f0f0 solid 1px;margin: 0 auto"></div>
<div class="content-bottom">
    <textarea  id="content" required="required" placeholder="请输入你要发送的内容">
    </textarea>
    <div class="send">
        <button value="发送" id="button">发送</button>
    </div>
</div>
<script>

    // alert("ajax");
    $(function (){
        var showContent = $(".content-top");
        showContent[0].scrollTop = showContent[0].scrollHeight;

        $("#button").click(function (){

            // alert("button")
            $.post("${pageContext.request.contextPath}/privateLetter/insert",
                {'content':$("#content").val(),'sendId':${sendId},'id':${id}},
                function (data){
                console.log(data);
                    location.reload();
                    let content = $("#content");
                    content[0].value=" ";


                // let html="";
                // for (let i = 0; i <data.length ; i++) {
                //     html+="<tr>"+
                //         "<td>"+data[i].id+ "<td>"+
                //         "<td>"+data[i].name+ "<td>"+
                //         "<td>"+data[i].password+ "<td>"+
                //         "<tr>";
                // }
                // $("#content").html(html);
            })
        })
    })
</script>
</body>
</html>
