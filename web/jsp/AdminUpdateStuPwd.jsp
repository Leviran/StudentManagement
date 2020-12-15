<%--
  Created by IntelliJ IDEA.
  User: yuan
  Date: 2020/11/13
  Time: 22:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link type="text/css" rel="stylesheet" href="css/in.css">
    <title>修改学生账号密码</title>
</head>
<body bgcolor="#7fffff">
<%
    String id = request.getParameter("id");
    System.out.println(id);
%>
<form action="servlet/updateStuPwdServlet"   method="post">
    <label>
        账号：<input class="input2" type="text" name="id" value=<%=id%> %>
    </label> <br/>
    <label>
        密码：<input class="input2" type="password" name="newpwd"%>
    </label> <br/>
    <br><br>
    <input class="button" type="submit" value="确认修改">
</form>
    <br/>

    <%
        String ifSuccess = (String)request.getParameter("ifSuccess");
        if("success".equals(ifSuccess)){
    %>
    <h5>修改成功！</h5>
    <%
    }else if("failed".equals(ifSuccess)){
    %>
    <h5>修改失败！</h5>
    <%
        }else if(ifSuccess==null){
        }
    %>
    <br/>

</body>
</html>
