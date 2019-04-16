<%--
  Created by IntelliJ IDEA.
  User: 27548
  Date: 2019/3/1
  Time: 9:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
    function AjaxSubmit1(str) {
        var cid =str;
        //alert(cid)
        $.ajax({
            contentType:"application/x-www-form-urlencoded; charset=utf-8",
            url:'${pageContext.request.contextPath}/CompetitionServlet?method=queryCompetitionDetails',
            type:'post',
            data:{
                "cid":cid,
            },
            dataType: "text",
            success:function (data) {
                window.location.href="${pageContext.request.contextPath}/"+data;
            }
        })

    }
    function AjaxSubmit2(str) {
        var cid =str;
        //alert(cid)
        $.ajax({
            contentType:"application/x-www-form-urlencoded; charset=utf-8",
            url:'${pageContext.request.contextPath}/CompetitionServlet?method=queryCompetitionDetailsToUpdate',
            type:'post',
            data:{
                "cid":cid,
            },
            dataType: "text",
            success:function (data) {
                window.location.href="${pageContext.request.contextPath}/"+data;
            }
        })

    }
</script>

<div class="main-panel">
    <div class="content-wrapper">
        <div class="page-header">
            <h3 class="page-title">
                比赛信息
            </h3>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <a href="${pageContext.request.contextPath}/admin/jsp/InsertNewCompetition.jsp">
                        <button  type="button" class="btn btn-gradient-danger btn-icon-text">
                            <i class="mdi mdi-upload btn-icon-prepend"></i>
                            发布比赛
                        </button>
                    </a>
                    <%--<li class="breadcrumb-item"><a href="#">比赛列表</a></li>--%>
                    <%--<li class="breadcrumb-item active" aria-current="page">Basic tables</li>--%>
                </ol>
            </nav>
        </div>
        <div class="row">
            <div class="col-lg-6 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">已发布比赛列表</h4>
                        <%--<p class="card-description">--%>
                            <%--Add class <code>.table</code>--%>
                        <%--</p>--%>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>比赛名称</th>
                                    <th>比赛时间</th>
                                    <th>报名人数</th>
                                    <th>比赛当前状态</th>
                                    <th>编辑</th>
                                    <th>详情</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${user.competitionList}" var="competition" varStatus="status">
                                <tr>
                                    <td>${status.count}</td>
                                    <td>${competition.cname}</td>
                                    <td>${competition.cStartTime}----${competition.cEndTime}</td>
                                    <td>${competition.total}</td>
                                    <td>
                                        <c:if test="${competition.cflag == 1}">
                                            <label class="badge badge-warning">审核中</label>
                                        </c:if>
                                        <c:if test="${competition.cflag == 2}">
                                            <label class="badge badge-success">比赛进行中</label>
                                        </c:if>
                                        <c:if test="${competition.cflag == 3}">
                                            <label class="badge badge-info">比赛结束</label>
                                        </c:if>
                                        <c:if test="${competition.cflag == 4}">
                                            <label class="badge badge-danger">审核不通过</label>
                                        </c:if>
                                    </td>
                                    <td><a href="#" onclick="AjaxSubmit2('${competition.cid}')">修改</a> </td>
                                    <td><a  href="#" onclick="AjaxSubmit1('${competition.cid}')">查看</a></td>
                                </tr>

                            </tbody>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- content-wrapper ends -->
    <!-- partial:../../partials/_footer.html -->
    <%@include file="footer.jsp"%>
    <!-- partial -->
</div>
