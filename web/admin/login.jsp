<%--
  Created by IntelliJ IDEA.
  User: 27548
  Date: 2019/2/28
  Time: 16:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Purple Admin</title>
    <!-- plugins:css -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/style.css">
    <!-- endinject -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/admin/images/favicon.png" />
</head>

<body>
<div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
        <div class="content-wrapper d-flex align-items-center auth">
            <div class="row w-100">
                <div class="col-lg-4 mx-auto">
                    <div class="auth-form-light text-left p-5">
                        <div class="brand-logo">
                            <img src="${pageContext.request.contextPath}/admin/images/logo.svg">
                        </div>
                        <h4>欢迎来到自主报名系统后台，请输入账号密码登陆吧</h4>
                        <h6 class="font-weight-light"><font color="red">${msg}</font></h6>
                        <form class="pt-3" id="myform" method="post" action="${pageContext.request.contextPath}/AdminInfoServlet?method=login">
                            <div class="form-group">
                                <input type="text" name="account" class="form-control form-control-lg" id="exampleInputEmail1" placeholder="Username">
                            </div>
                            <div class="form-group">
                                <input type="password" name="password" class="form-control form-control-lg" id="exampleInputPassword1" placeholder="Password">
                            </div>
                            <div class="mt-3">
                                <a class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn" id="postMyData"  href="javascript:submit_form()">登陆</a>
                            </div>
                            <div class="my-2 d-flex justify-content-between align-items-center">
                                <div class="form-check">
                                    <label class="form-check-label text-muted">
                                        <input type="checkbox" class="form-check-input">
                                        记住密码
                                    </label>
                                </div>
                                <a href="#" class="auth-link text-black">忘记密码?</a>
                            </div>
                            <%--<div class="mb-2">--%>
                                <%--<button type="button" class="btn btn-block btn-facebook auth-form-btn">--%>
                                    <%--<i class="mdi mdi-facebook mr-2"></i>使用QQ登陆--%>
                                <%--</button>--%>
                            <%--</div>--%>
                            <div class="text-center mt-4 font-weight-light">
                                没有账号? <a href="javascript:js_method()" class="text-primary">注册账号</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->
<!-- plugins:js -->
<script src="${pageContext.request.contextPath}/admin/vendors/js/vendor.bundle.base.js"></script>
<script src="${pageContext.request.contextPath}/admin/vendors/js/vendor.bundle.addons.js"></script>
<!-- endinject -->
<!-- inject:js -->
<script src="${pageContext.request.contextPath}/admin/js/off-canvas.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/misc.js"></script>
<!-- endinject -->
</body>
<script type="text/javascript">
    function js_method() {
        alert("暂未开通注册功能，请联系网站管理员");
    };
    function submit_form() {
        document.getElementById("myform").submit();
    }
</script>
</html>
