<%@ page import="entity.Teacher" %>
<%@ page import="dao.TeacherDao" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: yuan
  Date: 2020/12/13
  Time: 23:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>教师档案管理</title>
</head>
<body>
<%
    List<Teacher> tealist = TeacherDao.getAllTea();
%>
<h4>教师列表</h4>
<table>
    <tr>
        <th>账号</th>
        <th>姓名</th>
        <th>性别</th>
        <th>密码</th>
        <th>操作</th>
    </tr>
    <%
        for(Teacher t: tealist){
    %>
    <tr>
        <td><%=t.getId() %></td>
        <td><%=t.getName()%></td>
        <td><%=t.getSex()%></td>
        <td><%=t.getPassword()%></td>
        <td><a href="DeleteTeaAccount.jsp?id=<%=t.getId()%>"target="right">删除教师账号</a></td>
        <td><a href="updateTeaInfo.jsp"target="right">修改教师信息</a></td>
    </tr>
    <%
        }
    %>
</table>
<br/>
        <a href="AddTeaAccount.jsp" target="right">添加教师账号</a>
    <br/>
</body>
</html>
