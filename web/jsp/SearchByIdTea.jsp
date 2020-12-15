<%@ page import="dao.TeacherDao" %>
<%@ page import="entity.Teacher" %>
<%--
  Created by IntelliJ IDEA.
  User: yuan
  Date: 2020/11/14
  Time: 0:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人信息</title>
</head>
<body bgcolor="#7fffd4">
<%
    Teacher tea = new Teacher();
    String id=request.getParameter("id");
    tea= TeacherDao.getTeaById(id);
%>
<tr>
    账号：<%=tea.getId()%>
</tr><br/>
<tr>
    姓名：<%=tea.getName()%>
</tr><br/>
<tr>
    性别：<%=tea.getSex()%>
</tr><br/>
<tr>
    院系：<%=tea.getDepartment()%>
</tr><br/>
<tr>
    邮箱：<%=tea.getMail()%>
</tr><br/>
<br/>

</body>
</html>
