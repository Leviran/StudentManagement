<%--
  Created by IntelliJ IDEA.
  User: yuan
  Date: 2020/11/13
  Time: 20:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>欢迎使用学生信息管理系统</title>
</head>
<%
    //这个是lly写的，但是从loginCheckServlet传过来的是session.setAttribute为啥要用request.getParameter来获取值啊
    //知道了，她还写了一个jsp页面跳转参数number
    String number = request.getParameter("number");
//    String number = (String) session.getAttribute("Sid");
%>
<frameset rows="20%,80%">
    <frame src="../jsp/Hello.jsp" noresize scrolling="no" name="top" >
    <frameset cols="20%,80%">
        <frame src="../jsp/Sloginsucceed.jsp?number=<%=number%>" noresize scrolling="no" name="left">
        <frame src="" noresize scrolling="yes" name="right">
    </frameset>
</frameset>
<noframes>
    <body>
    </body>
</noframes>
</html>
