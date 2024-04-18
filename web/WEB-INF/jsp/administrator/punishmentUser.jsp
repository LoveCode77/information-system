<%--
  Created by IntelliJ IDEA.
  User: R720
  Date: 2021/4/30
  Time: 16:55
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>处罚用户</title>
    <%--    引入通用的css--%>
    <jsp:include page="common/commonCss.jsp"></jsp:include>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/administrator/punishmentUser.css" >

</head>
<body>
<%--引入头部导航页和banner--%>
<jsp:include page="common/commonHeader.jsp"></jsp:include>
<div class="content">
    <%--    引入左侧导航页 如用户管理 帖子管理等--%>
    <jsp:include page="common/commonNav.jsp"></jsp:include>
    <div class="show">
        <%--        引入帖子管理的菜单--%>
        <jsp:include page="common/userMenu02.jsp"></jsp:include>
        <%--    <%@include file="../common/userMenu.jsp" %>--%>
        <%--        表格名称--%>


            <form method="post" action="${pageContext.request.contextPath}/punishment/storePunishmentUser">
                <div class="one">
                    <div class="line">
                        <div class="line-left" >
                            <span>处罚用户用户名:</span>
                        </div>
                        <div class="line-right">
                            <input type="text" name="name">
                        </div>
                    </div>
                    <div class="line">
                        <div class="line-left">
                            <span>处罚类型：</span>
                        </div>
                        <div class="line-right">
                            <input type="text" name="type" list="type-list">
                            <datalist id="type-list" style="font-size: 30px">
                                <option>禁止发帖</option>
                                <option>禁止回复</option>
                                <option>禁止登录</option>
                            </datalist>
                        </div>
                    </div>
                    <div class="line">
                        <div class="line-left">
                            <span>处罚天数：</span>
                        </div>
                        <div class="line-right">
                            <input type="text" name="date">
                        </div>
                    </div>
                    <div class="line">
                        <div class="line-left">
                        </div>
                        <div class="line-right">
                            <input type="submit" value="提交">
                        </div>
                    </div>
                </div>
            </form>





    </div>

</div>
<%--    底部--%>
<%@ include file="common/commonBottom.jsp"%>
</body>
</html>
