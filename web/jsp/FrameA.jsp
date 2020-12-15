<%--
  Created by IntelliJ IDEA.
  User: yuan
  Date: 2020/11/13
  Time: 21:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>欢迎使用学生信息管理系统</title>
</head>
<%
    String number = request.getParameter("number");
%>
<frameset rows="20%,80%">
    <frame src="../jsp/Hello.jsp" noresize scrolling="no" name="top" >
    <frameset cols="20%,80%">
        <frame src="../jsp/Aloginsucceed.jsp?number=<%=number%>" noresize scrolling="no" name="left">
        <frame src="" noresize scrolling="yes" name="right">
    </frameset>
</frameset>
<noframes>
    <body>
    </body>
</noframes>
</html>
