<%--
  Created by IntelliJ IDEA.
  User: 27548
  Date: 2019/3/2
  Time: 9:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    function copyUrl() {
        var Url=document.getElementById("input");
        Url.select(); // 选择对象
        document.execCommand("Copy"); // 执行浏览器复制命令
        alert("复制成功！");
    }
</script>
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
                                    <label class="col-sm-3 col-form-label" style="font-size: large">活动名称:</label>
                                    <div class="col-sm-9">
                                        <h1 class="form-control"><font style="font-size: large">${com.cname}</font></h1>
                                        <%--<input id="competitionName" name="competitionName" type="text" class="form-control">--%>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: large">活动组织单位:</label>
                                    <div class="col-sm-9">
                                        <h1 class="form-control"><font style="font-size: large">${com.corganizer}</font></h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: large">比赛开始日期:</label>
                                    <div class="col-sm-9">
                                        <h1 class="form-control"><font style="font-size: large">${com.cStartTime}</font></h1>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: large">比赛截至日期:</label>
                                    <div class="col-sm-9">
                                        <h1 class="form-control"><font style="font-size: large">${com.cEndTime}</font></h1>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: large">比赛简介:</label>
                                    <div class="col-sm-9">
                                        <h1 class="form-control"><font style="font-size: large">${com.cdescribe}</font></h1>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: large">报名费用:</label>
                                    <div class="col-sm-9">
                                        <h1 class="form-control"><font style="font-size: large">${com.ccost}</font></h1>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: large">报名链接</label>
                                    <div class="col-sm-9">

                                        <input class="form-control" id="input" value="www.ningdali.com/kexie/SignUpServlet?method=apply&cid=${com.cid}" readonly/>
                                        <button  style="margin-top: 10px" type="button"onclick="copyUrl()" class="btn btn-inverse-success btn-fw">复制链接</button>
                                    </div>

                                </div>

                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- partial:../../partials/_footer.html -->
    <%@include file="footer.jsp"%>
    <!-- partial -->
</div>
<script type="text/javascript">
    function addNewCompetition() {
        var competitionName = document.getElementById("competitionName");
        var organizerName = document.getElementById("organizerName");
        var startTime = document.getElementById("startTime");
        var endTime = document.getElementById("endTime");
        var competitionDescribe = document.getElementById("competitionDescribe");
        var str = "必填项：";
        if (competitionName == ""){
            str += "活动名称、";
        }
        if (organizerName == ""){
            str += "发起活动组织者、"
        }
        if (startTime == ""){
            str += "活动开始时间、";
        }
        if (endTime == ""){
            str += "活动结束时间、";
        }
        if (competitionDescribe == ""){
            str += "活动描述、";
        }
        if(str != "必填项："){
            alert(str + "不能为空");
        }else {
            document.getElementById("newCompetition").submit();
        }

    }
</script>