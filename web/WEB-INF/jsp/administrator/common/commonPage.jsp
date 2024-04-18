<%--
  Created by IntelliJ IDEA.
  User: R720
  Date: 2021/5/7
  Time: 13:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="bottom">
    <div class="bCenter">
        <c:if test="${page>1}">
            <div>
                <a href="${pageUrl}?page=${page-1}">上一页</a>
            </div>
        </c:if>
        <c:if test="${pages<=5}">
            <c:forEach var="i" begin="1" end="${pages}">
                <div>
                    <a href="${pageUrl}?page=${i}">${i}</a>
                </div>
            </c:forEach>
        </c:if>
        <c:if test="${pages>5}">
            <c:forEach var="i" begin="1" end="5">
                <div>
                    <a href="${pageUrl}?page=${i}">${i}</a>
                </div>
            </c:forEach>
        </c:if>
        <div>
            <a href="${pageUrl}?page=${pages}">尾页</a>
        </div>
        <c:if test="${page<pages}">
            <div>
                <a href="${pageUrl}?page=${page+1}">下一页</a>
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
<script>

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
        location.href="http://localhost:8080/information/user/administratorIndex?page="+string;
    }

</script>
