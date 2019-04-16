<%--&lt;%&ndash;--%>
Created by IntelliJ IDEA.
User: 27548
Date: 2019/2/28
Time: 22:17
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%--将外部样式引进来--%>
    <%@include file="style.jsp"%>
</head>
<body>
<div class="container-scroller">
    <div class="container-fluid page-body-wrapper">
        <!-- 页面上侧内容 -->
        <%@include file="top.jsp"%>

        <!--页面容器样式包含所有的元素-->
        <div class="container-fluid page-body-wrapper">
            <!-- 页面左侧内容 -->
            <%@include file="left.jsp"%>
            <%--主页内容--%>
            <%@include file="CompetitionInfoMain.jsp"%>
        </div>

    </div>
    <%--外部的js资源--%>
    <%@include file="linkScript.jsp"%>
</body>

</html>


