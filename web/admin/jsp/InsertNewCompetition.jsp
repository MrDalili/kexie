<%--
  Created by IntelliJ IDEA.
  User: 27548
  Date: 2019/3/2
  Time: 9:35
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
            <%@include file="insertNewCompetitionMain.jsp"%>
        </div>

    </div>
    <%--外部的js资源--%>
    <!-- plugins:js -->
    <script src="${pageContext.request.contextPath}/admin/vendors/js/vendor.bundle.base.js"></script>
    <script src="${pageContext.request.contextPath}/admin/vendors/js/vendor.bundle.addons.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page-->
    <!-- End plugin js for this page-->
    <!-- inject:js -->
    <script src="${pageContext.request.contextPath}/admin/js/off-canvas.js"></script>
    <script src="${pageContext.request.contextPath}/admin/js/misc.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page-->
    <script src="${pageContext.request.contextPath}/admin/js/dashboard.js"></script>
    <script src="${pageContext.request.contextPath}/admin/js/file-upload.js"></script>
    <!-- End custom js for this page-->

</body>

</html>


