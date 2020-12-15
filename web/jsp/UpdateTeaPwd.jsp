<%@ page import="entity.Teacher" %>
<%@ page import="dao.TeacherDao" %>
<%--
  Created by IntelliJ IDEA.
  User: yuan
  Date: 2020/11/13
  Time: 22:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link type="text/css" rel="stylesheet" href="css/in.css">
    <title>修改教师账号密码</title>
</head>
<body bgcolor="#7fffd4">
<%
    String id = request.getParameter("id");
    Teacher tea = TeacherDao.getTeaEntity(id);
%>
<form action="${pageContext.request.contextPath}/servlet/updateTeaPwdServlet"   method="post">
    <label>
        账号：
        <input class="input2" type="text" name="id" value="<%=tea.getId() %>">
    </label> <br>
    <label>
        密码：
        <input class="input2" type="password" name="password" value="<%=tea.getPassword()%>">
    </label> <br>
    <br><br>
    <input class="button" type="submit" value="提交">

    <br>
    <br>
</form>
</body>
</html>
