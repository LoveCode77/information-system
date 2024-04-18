<%--
  Created by IntelliJ IDEA.
  User: R720
  Date: 2021/5/8
  Time: 14:40
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="menu">
    <ul>
        <li><a href="${pageContext.request.contextPath}/information/information?id=${sessionScope.id}">我的信息</a></li>
        <li><a href="${pageContext.request.contextPath}/privateLetter/allChat?id=${sessionScope.id} ">我的私信</a></li>
        <li><a href="${pageContext.request.contextPath}/topics/allPunishment">我的违规</a></li>
        <li><a href="${pageContext.request.contextPath}/information/updateInformation?id=${sessionScope.id}">修改信息</a></li>
        <li><a href="${pageContext.request.contextPath}/information/replaceImage">头像操作</a></li>
        <li><a href="${pageContext.request.contextPath}/information/updatePassword">修改密码</a></li>
        <li><a href="${pageContext.request.contextPath}/information/updateUserName">修改昵称</a></li>
    </ul>
</div>
