

<%--
  Created by IntelliJ IDEA.
  User: 27548
  Date: 2019/2/24
  Time: 22:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>自助报名</title>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%--<meta name="viewport" content="width=device-width, initial-scale=1">--%>
    <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js" type="text/javascript"></script>
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <meta name="keywords" content="Flat Dark Web Login Form Responsive Templates, Iphone Widget Template, Smartphone login forms,Login form, Widget Template, Responsive Templates, a Ipad 404 Templates, Flat Responsive Templates" />
    <link href="${pageContext.request.contextPath}/css/style.css" rel='stylesheet' type='text/css' />

    <!--webfonts-->
    <link href='http://fonts.useso.com/css?family=PT+Sans:400,700,400italic,700italic|Oswald:400,300,700' rel='stylesheet' type='text/css'>
    <link href='http://fonts.useso.com/css?family=Exo+2' rel='stylesheet' type='text/css'>
    <!--//webfonts-->
    <style type="text/css">
        select {
            width: 450px;
            height: 60px;
            font-size: 15px;
            color:#9199aa;
            padding: 1em 2em 1em 3em;
            /*Chrome和Firefox里面的边框是不一样的，所以复写了一下*/
            border: solid 0px #000;
            margin-top: 36px;
            margin-left: -20px;
            margin-bottom: -30px;
            outline: none;
            border-bottom: 1px solid #484856;

            /*很关键：将默认的select选择框样式清除*/
            appearance:none;
            -moz-appearance:none;
            -webkit-appearance:none;

            /*在选择框的最右侧中间显示小箭头图片*/
            background: url("https://raw.githubusercontent.com/ourjs/static/gh-pages/2015/arrow.png") no-repeat scroll right center transparent;


            /*为下拉小箭头留出一点位置，避免被文字覆盖*/
            padding-right: 14px;
        }

        input{
            margin-top: 10px;
        }

    </style>

</head>
<body>
<%--<div class="container-fluid">--%>
<!--
    描述：菜单栏
-->
<%--<div class="container-fluid">--%>
<%--<div class="col-md-3" style="padding-top:20px">--%>
<%--<ol class="list-inline">--%>
<div style="float:right; margin-right: 40px ;margin-top: 20px">
    <c:if test="${empty user}">
        <a href="${pageContext.request.contextPath}/admin/login.jsp"><font color="black">登录</font></a>
        <%--<a href="${pageContext.request.contextPath}/UserServlet?method=registUI"><font color="black">注册</font></a>--%>
    </c:if>
</div>
<%--</ol>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--<script>$(document).ready(function(c) {--%>
<%--$('.close').on('click', function(c){--%>
<%--$('.login-form').fadeOut('slow', function(c){--%>
<%--$('.login-form').remove();--%>
<%--});--%>
<%--});--%>
<%--});--%>
<%--</script>--%>
<div class="container-fluid">
    <%--<%@include file="jsp/head.jsp"%>--%>
</div>>
<!--SIGN UP-->
<h1>${cname}报名</h1>
<div class="login-form">
    <div class="close"> </div>
    <div class="head-info">
        <label class="lbl-1"> </label>
        <label class="lbl-2"> </label>
        <label class="lbl-3"> </label>
    </div>
    <div class="clear"> </div>
    <div class="avtar">
        <img src="${pageContext.request.contextPath}/images/avtar.png" />
    </div>
    <%--action="${pageContext.request.contextPath}/SignUp?method=1" method="post"--%>
    <form name="myform" action="${pageContext.request.contextPath}/SignUp?method=signUp&cid=${cid}" method="post" id="form1">
        <input type="text" name="id" id="id" class="text" value="学号" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '学号';}" >
        <%--<div class="key">--%>
        <%--<input type="password" value="姓名" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '姓名';}">--%>
        <%--</div>--%>
        <input type="text" name="name" id="name" class="text" value="姓名" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '姓名';}" >
        <input type="text" name="major" id="major" class="text" value="专业班级" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'xxxx专业1601班';}" >
        <%--<div  style="z-index: 300; background: url(images/adm.png) no-repeat 10px 15px; width: 24px;height: 24px">--%>

        <%--</div>--%>

        <select target="hidden_frame" name="academy" id="academy" class="select" style="background: url(images/adm.png) no-repeat 10px 15px;" >
            <option>-----请选择您所在的学院-----</option>
            <option>计算机科学学院</option>
            <option>机电工程学院</option>
            <option>环境与化学工程学院</option>
            <option>电子信息学院</option>
            <option>管理学院</option>
            <option>服装与艺术设计学院</option>
            <option>人文社会科学学院</option>
            <option>理学院</option>
            <option>新媒体艺术学院</option>
            <option>马克思主义学院</option>
            <option>应用技术学院(继续教育学院、中澳国际学院)</option>
            <option>材料工程学院</option>
            <option>城市规划与市政工程学院</option>
        </select>
        <input type="text" name="QQ" id="QQ" class="text" class="input" value="QQ" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'QQ';}" >
        <input type="text" name="telephone" id="telephone" class="text" value="TEL" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'TEL';}" >
        <input type="hidden" name="method" value="1">
        <div class="signin" href="javascript:void(0)">
            <input type="submit" id="register" value="注册" >
        </div>
    </form>

</div>
<%--<div class="copy-rights">--%>
<%--<p>Copyright &copy; 2015.Company name All rights reserved.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>--%>
<%--</div>--%>
<c:if test="${flag==1}">
    <script>
        alert("报名成功！")
    </script>
</c:if>
<c:if test="${flag==2}">
    <script>
        alert("报名失败！")
    </script>
</c:if>
</body>
</html>


