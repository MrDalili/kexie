
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
    //查看详情
    function getDetailsForPerson(uid,uname,umajor,uacademy,ugrade,usignUpTime,uQQ,utelephone,udescribe) {

        <%--window.location.href='${pageContext.request.contextPath}/CompetitionServlet?method=showPersonInfo&uid='+uid+'&uname='+uname+--%>
                <%--'&umajor='+umajor+'&ugrade='+ugrade+'&usignUpTime='+usignUpTime+'&uQQ='+uQQ+'&utelephone='+utelephone+--%>
            <%--'&udescribe='+udescribe;--%>
        $.ajax({
            contentType:"application/x-www-form-urlencoded; charset=utf-8",
            url:'${pageContext.request.contextPath}/CompetitionServlet?method=showPersonInfo',
            type:'post',
            data:{
                "uid":uid,
                "uname":uname,
                "umajor":umajor,
                "uacademy":uacademy,
                "ugrade":ugrade,
                "usignUpTime":usignUpTime,
                "uQQ":uQQ,
                "utelephone":utelephone,
                "udescribe":udescribe
            },
            dataType: "text",
            success:function (data) {
                window.location.href="${pageContext.request.contextPath}/"+data;
            }
        })

    }
    //获取数据
    function getMemberOfCompetitionApply() {
        //获取用户请求信息
        var id = document.getElementById("id").value;
        var name = document.getElementById("name").value;
        var major = document.getElementById("major").value;
        var academy = document.getElementById("academy").value;
        var competitionName = document.getElementById("competitionName").value;
        alert(name+major+academy+competitionName);
        //创建Ajax对象

        var ajax;
        if (window.XMLHttpRequest){
            ajax = new XMLHttpRequest();
        } else if (window.ActiveXObject){
            ajax = new ActiveXObject("Msxm12.XMLHTTP");
        }
        //复写onreadystatenment
        ajax.onreadystatechange = function (ev) {
            //判断ajax状态码
            if (ajax.readyState == 4){
                if (ajax.status == 200){
                    //获取相应数据
                    var result = ajax.responseText;
                    alert(result);
                    //处理相应数据

                }
            }
        }
        //发送请求
        ajax.open("get", "CompetitionServlet?name=" + name + "&majory=" + major + "&academy=" + academy + "&competitionName=" + competitionName + "&id=" + id);

        ajax.contentType("application/x-www-form-urlencoded; charset=utf-8");
        ajax.send(null);
    }
    function AjaxSubmit1() {
        var id = document.getElementById("id").value;
        var name = document.getElementById("name").value;
        var major = document.getElementById("major").value;
        var academy = document.getElementById("academy").value;
        var competitionName = document.getElementById("competitionName").value;
        $.ajax({
            contentType:"application/x-www-form-urlencoded; charset=utf-8",
            url:'${pageContext.request.contextPath}/CompetitionServlet?method=getMemberInfoOfCompetitionApply',
            type:'post',
            data:{
                "id":id,
                "name":name,
                "major":major,
                "academy":academy,
                "competitionName":competitionName
            },
            dataType: "json",
            success:function (data) {
                var ta = document.getElementById("ta");
                ta.innerHTML="";
                var tr = ta.insertRow(0);
                var cell0 = tr.insertCell(0);
                cell0.innerHTML = "学号";
                var cell1 = tr.insertCell(1);
                cell1.innerHTML = "姓名";
                var cell2 = tr.insertCell(2);
                cell2.innerHTML = "专业";
                var cell3 = tr.insertCell(3);
                cell3.innerHTML = "学院";
                var cell4 = tr.insertCell(4);
                cell4.innerHTML = "比赛名称";
                var cell4 = tr.insertCell(5);
                cell4.innerHTML = "QQ";
                var cell4 = tr.insertCell(6);
                cell4.innerHTML = "更多";
                $.each(data, function(index, data){
                    var tr = ta.insertRow(1);
                    var cell0 = tr.insertCell(0);
                    cell0.innerHTML = data.u_id;
                    var cell1 = tr.insertCell(1);
                    cell1.innerHTML = data.u_name;
                    var cell2 = tr.insertCell(2);
                    cell2.innerHTML = data.major;
                    var cell3 = tr.insertCell(3);
                    cell3.innerHTML = data.academy;
                    var cell4 = tr.insertCell(4);
                    cell4.innerHTML = data.competitionName;
                    var cell4 = tr.insertCell(5);
                    cell4.innerHTML = data.QQ;
                    var cell4 = tr.insertCell(6);
                    cell4.innerHTML = "<a href=\'#\' onclick='getDetailsForPerson('${person.u_id}','${person.u_name}','${person.major}','${person.academy}','${person.grade}','${person.signUpTime}','${person.QQ}','${person.telephone}','${person.u_describe}')'>详细信息</a>";

                })

            }
        })

    }
</script>
<div class="main-panel">
    <div class="content-wrapper">
        <h3 class="page-title">
            查询信息
        </h3>
        <div style="margin-top: 20px" class="col-12 grid-margin">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">选择对应的信息</h4>
                    <form class="form-sample" method="post" action="${pageContext.request.contextPath}/CompetitionServlet?method=queryApplyForCompetition">
                        <p class="card-description">
                            可以有不填项哦
                        </p>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">学号</label>
                                    <div class="col-sm-9">
                                        <input id="id" type="text" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">姓名</label>
                                    <div class="col-sm-9">
                                        <input id="name" type="text" class="form-control">
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">学院</label>
                                    <div class="col-sm-9">
                                        <select id="academy" class="form-control">
                                            <option></option>
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
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">班级</label>
                                    <div class="col-sm-9">
                                        <input id="major" type="text" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">比赛名称</label>
                                    <div class="col-sm-9">
                                        <input class="form-control" id="competitionName" placeholder="">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <button type="button" onclick="AjaxSubmit1()" class="btn btn-gradient-success btn-md">查询</button>
                    </form>
                </div>
            </div>
        </div>
        <div class="page-header">
            <h3 class="page-title">
                比赛报名详情
            </h3>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <%--<button type="button" class="btn btn-gradient-danger btn-icon-text">--%>
                        <%--<i class="mdi mdi-upload btn-icon-prepend"></i>--%>
                        <%--发布比赛--%>
                    <%--</button>--%>
                    <%--<li class="breadcrumb-item"><a href="#">比赛列表</a></li>--%>
                    <%--<li class="breadcrumb-item active" aria-current="page">Basic tables</li>--%>
                </ol>
            </nav>
        </div>

        <div class="row">
            <div class="col-lg-6 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">人员列表</h4>
                        <%--<p class="card-description">--%>
                        <%--Add class <code>.table</code>--%>
                        <%--</p>--%>
                        <table class="table" id="ta">
                            <thead>
                            <tr>
                                <th>学号</th>
                                <th>姓名</th>
                                <th>专业</th>
                                <th>所在学院</th>
                                <th>比赛名称</th>
                                <th>QQ</th>
                                <th>更多</th>
                            </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${user.competitionList}" var="competition" varStatus="status">
                                    <c:forEach items="${competition.personList}" var="person">
                                        <tr>
                                            <td>${person.u_id}</td>
                                            <td>${person.u_name}</td>
                                            <td>${person.major}</td>
                                            <td>${person.academy}</td>
                                            <td>${person.competitionName}</td>
                                            <td>${person.QQ}</td>
                                            <td><a href="#"  onclick="getDetailsForPerson('${person.u_id}','${person.u_name}','${person.major}','${person.academy}','${person.grade}','${person.signUpTime}','${person.QQ}','${person.telephone}','${person.u_describe}')">详细信息</a> </td>
                                        </tr>
                                    </c:forEach>
                                </c:forEach>
                            </tbody>
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