<%@ page import="dao.TeacherDao" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Scoreinfo" %>
<%@ page import="dao.ScoreDao" %><%--
  Created by IntelliJ IDEA.
  User: yuan
  Date: 2020/12/13
  Time: 23:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生课程成绩管理</title>
</head>
<body>


<h4>成绩信息列表</h4>
<table>
    <tr>
        <th>课程号</th>
        <th>学生id</th>
        <th>成绩</th>
        <th>等级</th>
    </tr>
    <%
        String tid = request.getParameter("id");
        List<String> cidlist = TeacherDao.getCidList(tid);
        List<Scoreinfo> silist = null;
        for(String cid: cidlist){
            List<Scoreinfo> silt = ScoreDao.getScoreInfo(cid);
            for(Scoreinfo si :silt){
                silist.add(si);
            }
        }
        for(Scoreinfo si: silist){
    %>
    <tr>
        <td><%=si.getCid() %></td>
        <td><%=si.getSid()%></td>
        <td><%=si.getScore()%></td>
        <td><%=si.getLevel()%></td>
    </tr>
    <%
        }
    %>
</table>

</body>
</html>
