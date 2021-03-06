<%--
  Created by IntelliJ IDEA.
  User: 27548
  Date: 2019/2/28
  Time: 19:43
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<HTML>
<HEAD>
    <meta http-equiv="Content-Language" content="zh-cn">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath}/css/Style1.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript"  src="${pageContext.request.contextPath}/js/public.js"></script>
    <script type="text/javascript">
        function addCategory(){
            window.location.href = "${pageContext.request.contextPath}/admin/category/add.jsp";
        }
    </script>
</HEAD>
<body>
<br>
<table cellSpacing="1" cellPadding="0" width="100%" align="center" bgColor="#f5fafe" border="0">
    <TBODY>
    <tr>
        <td class="ta_01" align="center" bgColor="#afd1f3">
            <strong>已发布比赛</strong>
        </TD>
    </tr>
    <tr>
        <td class="ta_01" align="right">
            <button type="button" id="add" name="add" value="添加" class="button_add" onclick="addCategory()">
                &#28155;&#21152;
            </button>

        </td>
    </tr>
    <tr>
        <td class="ta_01" align="center" bgColor="#f5fafe">
            <table cellspacing="0" cellpadding="1" rules="all"
                   bordercolor="gray" border="1" id="DataGrid1"
                   style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
                <tr
                        style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">

                    <td align="center" width="10%">
                        姓名
                    </td>
                    <td align="center" width="15%">
                        班级
                    </td>
                    <td align="center" width="12%">
                        学院
                    </td>
                    <td align="center" width="12%">
                        所参加比赛
                    </td>
                    <td align="center" width="17%">
                        报名时间
                    </td>

                    <td align="center" width="8%">
                        获奖情况
                    </td>
                    <td align="center" width="8%">
                        备注
                    </td>
                    <td align="center" width="8%">
                        QQ
                    </td>
                    <td align="center" width="8%">
                        联系方式
                    </td>
                    <td width="7%" align="center">
                        编辑
                    </td>
                    <td width="7%" align="center">
                        删除
                    </td>
                </tr>
                <c:forEach items="${user.competitionList}" var="competition"  varStatus="status">
                    <c:forEach items="${competition.personList}" var="person">
                    <tr onmouseover="this.style.backgroundColor = 'white'"
                        onmouseout="this.style.backgroundColor = '#F5FAFE';">
                        <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                            width="10%">
                                ${person.u_name}
                        </td>
                        <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                            width="15%">
                                ${person.major}
                        </td>
                        <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                            width="12%">
                                ${person.academy}
                        </td>
                        <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                            width="12%">
                                ${person.competition}
                        </td>

                        <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                            width="17%">
                                ${person.signUpTime}
                        </td>

                        <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                            width="8%">
                                ${person.grade}
                        </td>
                        <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                            width="8%">
                                ${person.u_describe}
                        </td>
                        <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                            width="8%">
                                ${person.QQ}
                        </td>
                        <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                            width="8%">
                                ${person.telephone}
                        </td>
                        <td align="center" style="HEIGHT: 22px">
                            <a href="edit.jsp">
                                <img src="${pageContext.request.contextPath}/img/admin/i_edit.gif" border="0" style="CURSOR: hand">
                            </a>
                        </td>

                        <td align="center" style="HEIGHT: 22px">
                            <a href="#">
                                <img src="${pageContext.request.contextPath}/img/admin/i_del.gif" width="16" height="16" border="0" style="CURSOR: hand">
                            </a>
                        </td>
                    </tr>
                    </c:forEach>
                </c:forEach>
            </table>
        </td>
    </tr>
    </TBODY>
</table>
</body>
</HTML>

