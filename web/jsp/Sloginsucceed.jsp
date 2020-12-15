<%@ page import="dao.Stuinfo" %><%--
  Created by IntelliJ IDEA.
  User: yuan
  Date: 2020/11/14
  Time: 20:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生信息管理系统</title>
</head>
<body bgcolor="#7fffd4">
<%
    String id = request.getParameter("number");
%>
<tr align="center">
    <a href="SearchById.jsp?id=<%=id%>" target="right">查看个人信息</a>
</tr>
<br>
<tr>
    <td align="center">
      <a href="updateStuInfo.jsp?id=<%=id%>" target="right">修改个人信息</a>
    </td>
</tr>
<tr>
    <td align="center">
        <a href="changePwdStu.jsp?id=<%=id%>" target="right">修改密码</a>
    </td>
</tr>
<tr>
    <td align="center">
        <a href="courseTableForStu.jsp?id=<%=id%>" target="right">查看课表(还看不了)</a>
    </td>
</tr>
<br>
<tr>
    <a href="uploadPic.jsp" target="right">上传照片</a>
</tr>
<br>
<tr>
    <a href="/index.jsp" target="_top" >退出</a>
</tr>

</body>
</html>
