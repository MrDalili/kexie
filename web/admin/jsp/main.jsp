<%--
  Created by IntelliJ IDEA.
  User: 27548
  Date: 2019/3/1
  Time: 8:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="main-panel">
    <div class="content-wrapper">
        <%--是一个方块--%>
        <div class="row">
            <div class="col-12">
              <span class="d-flex align-items-center purchase-popup">
                <p>Like what you see? Check out our premium version for more.</p>
                <a href="https://github.com/BootstrapDash/PurpleAdmin-Free-Admin-Template" target="_blank" class="btn ml-auto download-button">Download Free Version</a>
                <a href="#product/purple-bootstrap-4-admin-template/" target="_blank" class="btn purchase-button">Upgrade To Pro</a>
                <i class="mdi mdi-close popup-dismiss"></i>
              </span>
            </div>
        </div>
        <div class="page-header">
            <h3 class="page-title">
              <span class="page-title-icon bg-gradient-primary text-white mr-2">
                <i class="mdi mdi-home"></i>
              </span>
                Dashboard
            </h3>
            <nav aria-label="breadcrumb">
                <ul class="breadcrumb">
                    <li class="breadcrumb-item active" aria-current="page">
                        <span></span>Overview
                        <i class="mdi mdi-alert-circle-outline icon-sm text-primary align-middle"></i>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="row">
            <div class="col-md-4 stretch-card grid-margin">
                <div class="card bg-gradient-danger card-img-holder text-white">
                    <div class="card-body">
                        <img src="${pageContext.request.contextPath}/admin/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image"/>
                        <h4 class="font-weight-normal mb-3">你已发布的比赛
                            <i class="mdi mdi-chart-line mdi-24px float-right"></i>
                        </h4>
                        <h2 class="mb-5">${user.competitionNum}个</h2>
                        <%--<h6 class="card-text">Increased by 60%</h6>--%>
                    </div>
                </div>
            </div>
            <div class="col-md-4 stretch-card grid-margin">
                <div class="card bg-gradient-info card-img-holder text-white">
                    <div class="card-body">
                        <img src="${pageContext.request.contextPath}/admin/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image"/>
                        <h4 class="font-weight-normal mb-3">总报名人数
                            <i class="mdi mdi-bookmark-outline mdi-24px float-right"></i>
                        </h4>
                        <h2 class="mb-5">${user.singUpNum}人</h2>
                        <%--<h6 class="card-text">Decreased by 10%</h6>--%>
                    </div>
                </div>
            </div>
            <%--<div class="col-md-4 stretch-card grid-margin">--%>
                <%--<div class="card bg-gradient-success card-img-holder text-white">--%>
                    <%--<div class="card-body">--%>
                        <%--<img src="images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image"/>--%>
                        <%--<h4 class="font-weight-normal mb-3">Visitors Online--%>
                            <%--<i class="mdi mdi-diamond mdi-24px float-right"></i>--%>
                        <%--</h4>--%>
                        <%--<h2 class="mb-5">95,5741</h2>--%>
                        <%--<h6 class="card-text">Increased by 5%</h6>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
        </div>
    </div>
    <%--页脚--%>

</div>
