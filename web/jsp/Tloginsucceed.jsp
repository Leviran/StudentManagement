<%@ page import="dao.TeacherDao" %><%--
  Created by IntelliJ IDEA.
  User: yuan
  Date: 2020/11/13
  Time: 20:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>教师登录页面</title>
</head>
<body bgcolor="#7fffd4">
<%
//    todo id好像没什么用
    String id = request.getParameter("number");
%>
<%--<tr align="center">--%>
<%--    <a href="addstuinfo.jsp" target="right"> 添加学生信息</a>--%>
<%--</tr>--%>
<%--<br/>--%>
<%--<tr align="center">--%>
<%--    <a href="StuInfo.jsp" target="right"> 查看学生信息</a>--%>
<%--</tr>--%>
<%--<br/>--%>
<tr align="center">
    <a href="SearchByIdTea.jsp?id=<%=id%>" target="right"> 查看个人信息</a>
</tr>
<tr align="center">
    <a href="changePwdTea.jsp?id=<%=id%>" target="right">修改密码</a>
</tr>
<tr align="center">
    <a href="CourseTableTea.jsp?id=<%=id%>" target="right">任课信息查询</a>
</tr>
<br/>
<tr align="center">
    <a href="StuGrade.jsp?id=<%=id%>" target="right"> 学生课程成绩管理</a>
</tr>
<br/>
<%--<br/>--%>
<%--<tr align="center">--%>
<%--    <a href="DeleteStuInfo.jsp" target="right"> 删除学生信息</a>--%>
<%--</tr>--%>
<%--<br/>--%>
<%--<tr align="center">--%>
<%--    <a href="updateStuInfo.jsp" target="right"> 修改学生信息</a>--%>
<%--</tr>--%>
<%--<br/>--%>
<tr align="center">
    <a href="/index.jsp" target="_top"> 退出登录</a>
</tr>
<br/>
</body>
</html>
