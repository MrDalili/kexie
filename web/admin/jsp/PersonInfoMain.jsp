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
            <a href="${pageContext.request.contextPath}/admin/jsp/CompetitionInfo.jsp">比赛报名人列表></a>报名人详情
        </h3>
        <div style="margin-top: 20px" class="col-12 grid-margin">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">详情</h4>
                        <p class="card-description">
                            <%--都是必填项哦--%>
                        </p>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: large">学号：</label>
                                    <div class="col-sm-9">
                                        <input class="form-control" name="cname" value="${uid}" readonly/>
                                        <%--<input id="competitionName" name="competitionName" type="text" class="form-control">--%>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: large">名称：</label>
                                    <div class="col-sm-9">
                                        <input class="form-control" name="corganizer" value="${uname}" readonly/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: large">学院专业：</label>
                                    <div class="col-sm-9">
                                        <input type="datetime" class="form-control" name="cStartTime" value="${uacademy}:${umajor}" readonly/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: large">报名时间：</label>
                                    <div class="col-sm-9">
                                        <input type="datetime" class="form-control" name="cEndTime" value="${usignUpTime}" readonly/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: large">QQ：</label>
                                    <div class="col-sm-9">
                                        <input class="form-control" name="cdescribe" value="${uQQ}" readonly/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: large">TEL：</label>
                                    <div class="col-sm-9">
                                        <input class="form-control" name="ccost" value="${utelephone}" readonly/>
                                        <input type="hidden" name="cid" value="${com.cid}">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label" style="font-size: large">成绩：</label>
                                <div class="col-sm-9">
                                    <input class="form-control" name="ccost" value="${ugrade}" readonly/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label" style="font-size: large">备注；</label>
                            <div class="col-sm-9">
                                <input class="form-control" name="ccost" value="${udescribe}" readonly/>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </div>
    <!-- partial:../../partials/_footer.html -->
    <%@include file="footer.jsp"%>
    <!-- partial -->
</div>
