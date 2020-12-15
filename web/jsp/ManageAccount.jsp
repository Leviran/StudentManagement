<%@ page import="entity.Teacher" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.TeacherDao" %>
<%@ page import="entity.Student" %>
<%@ page import="dao.StudentDao" %><%--
  Created by IntelliJ IDEA.
  User: yuan
  Date: 2020/12/13
  Time: 23:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户信息管理</title>
</head>
<body>
    <%
        List<Teacher> tealist = TeacherDao.getAllTea();
        List<Student> stulist = StudentDao.getAllStu();
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
                <td><a href="AdminUpdateTeaPwd.jsp?id=<%=t.getId()%>" target="right">修改密码</a></td>
            </tr>
        <%
            }
        %>
    </table>


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
            for(Student s: stulist){
        %>
        <tr>
            <td><%=s.getId() %></td>
            <td><%=s.getName()%></td>
            <td><%=s.getSex()%></td>
            <td><%=s.getPassword()%></td>
            <td><a href="AdminUpdateStuPwd.jsp?id=<%=s.getId()%>" target="right">修改密码</a></td>
        </tr>
        <%
            }
        %>
    </table>

<%--    <tr align="center">--%>
<%--        <a href="AdminUpdateStuPwd.jsp" target="right">修改学生账号密码</a>--%>
<%--    </tr>--%>
<%--    <br/>--%>
<%--    <tr align="center">--%>
<%--        <a href="UpdateTeaPwd.jsp" target="right">修改教师账号密码</a>--%>
<%--    </tr>--%>
    <br/>
</body>
</html>
