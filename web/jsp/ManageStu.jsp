<%@ page import="dao.StudentDao" %>
<%@ page import="entity.Student" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: yuan
  Date: 2020/12/13
  Time: 23:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生档案管理</title>
</head>
<body>

<%
    List<Student> list = StudentDao.getAllStu();
%>
<h4>学生列表</h4>
<table>
    <tr>
        <th>账号</th>
        <th>姓名</th>
        <th>性别</th>
        <th>密码</th>
        <th>操作</th>
    </tr>
    <%
        for(Student s: list){
    %>
    <tr>
        <td><%=s.getId() %></td>
        <td><%=s.getName()%></td>
        <td><%=s.getSex()%></td>
        <td><%=s.getPassword()%></td>
        <td><a href="DeleteStuAccount.jsp?id=<%=s.getId()%>"target="right">删除学生账号</a></td>
        <td><a href="updateStuInfo.jsp?id=<%=s.getId()%>"target="right">修改学生信息</a></td>
    </tr>
    <%
        }
    %>
</table>
<br/>

</body>
</html>
