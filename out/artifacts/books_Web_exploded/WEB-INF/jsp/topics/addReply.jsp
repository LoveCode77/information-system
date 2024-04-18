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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/reply.css">
    <title>addReply</title>
</head>
<body>
<!--头部-->
<div class="replyContent">
    <form method="post" action="${pageContext.request.contextPath}/topics/storeReply?topicId=${sessionScope.topicId}&id=${sessionScope.id}&">
        <div class="replyFirst">
            <textarea rows="3" cols="20" name="replyContexts">请输入</textarea>
        </div>
        <div class="replySecond">
            <input type="submit" value="确认">
        </div>
    </form>
</div>
</body>
</html>
