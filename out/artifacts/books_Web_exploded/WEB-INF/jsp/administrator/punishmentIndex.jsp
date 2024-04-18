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
    <title>处罚主页</title>
<%--    引入通用的css--%>
    <jsp:include page="common/commonCss.jsp"></jsp:include>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/administrator/allPunishment.css" >

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


         <div class="one">
        <div class="operation">
            <span style="line-height: 80px">操作</span>
        </div>

        <div class="user-name">
                <span>
                  违规者用户名
                </span>
        </div>
        <div class="admin-name">
                <span>
                 处理着用户名
                </span>
        </div>
        <div class="punishment-information">
                <span>
                  处罚信息
                </span>
        </div>
        <div class="time-begin">
                <span>
                   处罚开始时间
                </span>
        </div>
        <div class="time-over">
                <span>
                   处罚结束时间
                </span>
        </div>
        <div class="status">
                <span>
                  处罚状态
                </span>
        </div>
    </div>

    <c:forEach items="${lists}" var="map">
        <div class="one">
            <div class="operation">
                <div class="update">
                    <span>
                       <a style="color: black" href="${pageContext.request.contextPath}/punishment/cancelPunishment?punishmentId=${map.punishmentId}">取消</a>
                    </span>
                </div>
                <div class="delete">
                    <span>
                          <a href="">预留</a>
                    </span>
                </div>
            </div>
            <div class="user-name">
                <span>
                ${map.crime}
                </span>
            </div>
            <div class="admin-name">
                <span>
                        ${map.police}
                </span>
            </div>
            <div class="punishment-information">
                <span>
                        ${map.information}
                </span>
            </div>
            <div class="time-begin">
                <span>
                        ${map.punishmentBegin}
                </span>
            </div>
            <div class="time-over">
                <span>
                        ${map.punishmentOver}
                </span>
            </div>
            <div class="status">
                <span>
                        ${map.outDated}
                </span>
            </div>
        </div>
    </c:forEach>





        <%@include file="common/commonPage.jsp" %>
    </div>

</div>
<%--    底部--%>
    <%@ include file="common/commonBottom.jsp"%>
</body>
</html>
