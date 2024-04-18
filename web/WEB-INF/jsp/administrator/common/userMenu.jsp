<%--
  Created by IntelliJ IDEA.
  User: R720
  Date: 2021/5/7
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="menu">
    <ul>
        <c:if test="${controlPage==1}">
            <li class="mark"><a href="${pageContext.request.contextPath}/user/administratorIndex">所有用户</a></li>
            <li><a href="${pageContext.request.contextPath}/user/administratorInsertIndex">新建用户</a></li>
        </c:if>
        <c:if test="${controlPage==2}">
            <li ><a href="${pageContext.request.contextPath}/user/administratorIndex">所有用户</a></li>
            <li class="mark"><a href="${pageContext.request.contextPath}/user/administratorInsertIndex">新建用户</a></li>
        </c:if>
        <c:if test="${controlPage==3}">
            <li ><a href="${pageContext.request.contextPath}/user/administratorIndex">所有用户</a></li>
            <li><a href="${pageContext.request.contextPath}/user/administratorInsertIndex">新建用户</a></li>
            <li class="mark"><a href="">修改用户</a></li>
        </c:if>
    </ul>
</div>