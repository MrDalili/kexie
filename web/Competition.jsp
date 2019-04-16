

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
    <script type="text/javascript">
        function examineSelect() {
            var cid = document.getElementById("cid").value;
            if (cid == "no"){
                alert("请选择比赛，再点击提交");
                return false;
            } else{
                return true;
            }
        }
    </script>
</head>
<body>
<div style="float:right; margin-right: 40px ;margin-top: 20px">
    <c:if test="${empty user}">
        <a href="${pageContext.request.contextPath}/admin/login.jsp"><font color="black">登录</font></a>
    </c:if>
</div>

<div class="container-fluid">
</div>>
<h1>活动自助报名</h1>
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
    <form  action="${pageContext.request.contextPath}/SignUp?method=apply" onsubmit="return examineSelect()" method="post" >
        <select  target="hidden_frame" name="cid" id="cid" class="select" style="width: 550px;
                padding: 2em 2em 1em 8em;height: 100px;font-size: larger" >
            <option  value="no">-----选择下列活动名-----</option>
            <c:forEach items="${list}" var="list">
                <option  value="${list.cid}">${list.cname}</option>
            </c:forEach>

        </select>
        <div class="signin" href="javascript:void(0)">
            <input style="margin-top: 50px"  type="submit" value="跳转到该比赛的报名页面" >
        </div>
    </form>

</div>
</body>
</html>


