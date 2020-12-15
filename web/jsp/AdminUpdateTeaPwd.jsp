%--
  Created by IntelliJ IDEA.
  User: yuan
  Date: 2020/12/14
  Time: 16:15
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
%>
<form action="servlet/updateTeaPwdServlet"   method="post">
    <label>
        账号：<input class="input2" type="text" name="id" value=<%=id%> %>
    </label> <br/>
    <label>
        密码：<input class="input2" type="password" name="newpwd"%>
    </label> <br/>
    <br><br>
    <input class="button" type="submit" value="确认修改">
    <br/>

    <%
        String ifSuccess = (String)request.getParameter("ifSuccess");
        if(ifSuccess.equals("success")){
    %>
        <h5>修改成功！</h5>
    <%
        }else if(ifSuccess.equals("failed")){
    %>
        <h5>修改失败！</h5>
    <%
        }else if(ifSuccess==null){
        }
    %>
    <br/>
</form>
</body>
</html>
