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
            发布比赛
        </h3>
        <div style="margin-top: 20px" class="col-12 grid-margin">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">请填写相应的信息</h4>
                            <form id="newCompetition" class="form-sample" method="post" action="${pageContext.request.contextPath}/CompetitionServlet?method=AddNewCompetition"
                                  enctype="multipart/form-data">
                        <p class="card-description">
                            都是必填项哦
                        </p>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: large">活动名称</label>
                                    <div class="col-sm-9">
                                        <input id="competitionName" name="cname" type="text" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: large">活动组织单位</label>
                                    <div class="col-sm-9">
                                        <input id="organizerName" name="corganizer" type="text" class="form-control">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: large">比赛开始日期</label>
                                    <div class="col-sm-9">
                                        <input class="form-control" name="cStartTime" id="startTime" type="date">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: large">比赛截至日期</label>
                                    <div class="col-sm-9">
                                        <input class="form-control"name="cEndTime" id="endTime" type="date">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: large">比赛简介</label>
                                    <div class="col-sm-9">
                                        <input class="form-control" name="cdescribe" id="competitionDescribe" placeholder="">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: large">报名费用</label>
                                    <div class="col-sm-9">
                                        <input class="form-control" name="ccost" id="cost"  placeholder="0.0" onkeyup="value=value=this.value.replace(/[^0-9.]/g,'') ">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group" style="margin-left: 20px;" >
                                <label><font style=" font-size: large;">微信群或QQ群二维码</font></label>
                                <input style="margin-top: 10px" type="file" name="cimage" class="file-upload-default">
                                <div class="input-group col-xs-12">
                                    <input type="text" class="form-control file-upload-info" disabled="" placeholder="点击上传上传二维码">
                                    <span class="input-group-append">
                                        <button class="file-upload-browse btn btn-gradient-primary" type="button">上传</button>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <button type="button" onclick="addNewCompetition()" class="btn btn-gradient-danger btn-icon-text">
                            <i class="mdi mdi-upload btn-icon-prepend"></i>
                            发布比赛
                        </button>
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