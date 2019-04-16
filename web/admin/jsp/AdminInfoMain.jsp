<%--
  Created by IntelliJ IDEA.
  User: 27548
  Date: 2019/3/2
  Time: 9:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="main-panel">
    <div class="content-wrapper">
        <h3 class="page-title">
            <a href="${pageContext.request.contextPath}/AdminInfoServlet?method=queryCompetitionInfoByAaccount">已发布比赛></a>活动详情
        </h3>
        <div style="margin-top: 20px" class="col-12 grid-margin">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">活动信息</h4>
                    <form id="newCompetition" class="form-sample" method="post" action="${pageContext.request.contextPath}/CompetitionServlet?method=AddNewCompetition">
                        <p class="card-description">
                            <%--都是必填项哦--%>
                        </p>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: large">账号:</label>
                                    <div class="col-sm-9">
                                        <h1 class="form-control"><font style="font-size: large">${user.aaccount}</font></h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: large">名称:</label>
                                    <div class="col-sm-9">
                                        <h1 class="form-control"><font style="font-size: large">${user.aname}</font></h1>
                                        <%--<input id="competitionName" name="competitionName" type="text" class="form-control">--%>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: large">身份:</label>
                                    <div class="col-sm-9">
                                        <h1 class="form-control"><font style="font-size: large">${user.aidentity}</font></h1>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <button  style="margin-top: 10px" type="button"onclick="copyUrl()" class="btn btn-inverse-success btn-fw">修改密码</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- partial:../../partials/_footer.html -->
    <%@include file="footer.jsp"%>
    <!-- partial -->
</div>