

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
  <style>   <style>
    /* 触发弹窗图片的样式 */
  #myImg {
    border-radius: 5px;
    cursor: pointer;
    transition: 0.3s;
  }

  #myImg:hover {opacity: 0.7;}

  /* 弹窗背景 */
  .modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.9); /* Black w/ opacity */
  }

  /* 图片 */
  .modal-content {
    margin: auto;
    display: block;
    width: 80%;
    max-width: 700px;
  }

  /* 文本内容 */
  #caption {
    margin: auto;
    display: block;
    width: 80%;
    max-width: 700px;
    text-align: center;
    color: #ccc;
    padding: 10px 0;
    height: 150px;
  }

  /* 添加动画 */
  .modal-content, #caption {
    -webkit-animation-name: zoom;
    -webkit-animation-duration: 0.6s;
    animation-name: zoom;
    animation-duration: 0.6s;
  }

  @-webkit-keyframes zoom {
    from {-webkit-transform:scale(0)}
    to {-webkit-transform:scale(1)}
  }

  @keyframes zoom {
    from {transform:scale(0)}
    to {transform:scale(1)}
  }

  /* 关闭按钮 */
  .close {
    position: absolute;
    top: 15px;
    right: 35px;
    color: #f1f1f1;
    font-size: 40px;
    font-weight: bold;
    transition: 0.3s;
  }

  .close:hover,
  .close:focus {
    color: #bbb;
    text-decoration: none;
    cursor: pointer;
  }

  /* 小屏幕中图片宽度为 100% */
  @media only screen and (max-width: 700px){
    .modal-content {
      width: 100%;
    }
  }
  </style>
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
  <div style="float:right; margin-right: 40px ;margin-top: 20px">
        <c:if test="${empty user}">
          <a href="${pageContext.request.contextPath}/admin/login.jsp"><font color="black">登录</font></a>
          <%--<a href="${pageContext.request.contextPath}/UserServlet?method=registUI"><font color="black">注册</font></a>--%>
        </c:if>
  </div>

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
    <%--<img src="${pageContext.request.contextPath}/images/avtar.png" />--%>
      <!-- 触发弹窗 - 图片改为你的图片地址 -->
      <img id="myImg" src="${pageContext.request.contextPath}${cimage}"
           alt="扫码加入QQ群了解更多详情" width="300" height="200" >

      <!-- 弹窗 -->
      <div id="myModal" class="modal">

        <!-- 关闭按钮 -->
        <span class="close" onclick="document.getElementById('myModal').style.display='none'">&times;</span>

        <!-- 弹窗内容 -->
        <img class="modal-content" id="img01">

        <!-- 文本描述 -->
        <div id="caption"></div>
      </div>
      <br>
      <font style="font-size: large;color: #9199aa">扫描二维码进入该群了解详情</font>
      <br>
      <font style="font-size: large;color: #9199aa">单击可查看大图</font>
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
      <input type="submit" id="addMum" value="报名" >
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
    <script>
      // 获取弹窗
      var modal = document.getElementById('myModal');

      // 获取图片插入到弹窗 - 使用 "alt" 属性作为文本部分的内容
      var img = document.getElementById('myImg');
      var modalImg = document.getElementById("img01");
      var captionText = document.getElementById("caption");
      img.onclick = function(){
        modal.style.display = "block";
        modalImg.src = this.src;
        captionText.innerHTML = this.alt;
      }

      // 获取 <span> 元素，设置关闭按钮
      var span = document.getElementsByClassName("close")[0];

      // 当点击 (x), 关闭弹窗
      span.onclick = function() {
        modal.style.display = "none";
      }
    </script>
</html>


