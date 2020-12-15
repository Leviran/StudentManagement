<%@ page import="dao.TeacherDao" %><%--
  Created by IntelliJ IDEA.
  User: yuan
  Date: 2020/11/13
  Time: 21:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加教师账号</title>
    <style>
        .input2 {
            padding: 10px;
            width: 20%;
            color: black;
            margin-bottom: 10px;
            background-color: bisque;
            border: 1px solid black;
            border-radius: 4px;
            letter-spacing: 2px;
        }
        .button
        {
            align-items: center;
            padding: 10px;
            width: 10%;
            color: black;
            margin-bottom: 10px;
            background-color: bisque;
            border: 1px solid black;
            border-radius: 4px;
            letter-spacing: 2px;
        }
    </style>
</head>
<body bgcolor="#7fffd4">
<form action="servlet/addTeaServlet" method="post" onsubmit="beforeSubmit(this)">
    账号：<input type="text" name="id"><br/>
    密码：<input type="text" name="password"><br/>
    姓名：<input type="text" name="name"><br/>
    性别：<input type="text" name="sex"><br/>
</form>
<br/>
<a href="Aloginsucceed.jsp">返回主界面</a><br/>

<%
    String flag = request.getParameter("flag");
    if(flag==null){       //如果得到为 null.

    }
    else {          // 不为空 后 转成int 类型 分析判断
        int flag1 = Integer.parseInt(flag);
        if (flag1 == 0) {

        } else if (flag1 == 1) {
%>
            <h5>该账号已存在，不能重复添加</h5>
<%
        } else {

        }
    }
%>

<script language="JavaScript">
    function  beforeSubmit(form) {
        if(form.id.value===""){
            alert("用户名不能为空");
            form.id.focus();
            return false;
        }
        if(form.password.value===""){
            alert("密码不能为空");
            form.password.focus();
            return false;
        }
        if(form.name.value===""){
            alert("姓名不能为空");
            form.name.focus();
            return false;
        }
        if(form.sex.value===""){
            alert("性别不能为空");
            form.sex.focus();
            return false;
        }
        return true;
    }
</script>


</body>
</html>
