<%--
  Created by IntelliJ IDEA.
  User: yuan
  Date: 2020/12/14
  Time: 16:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link type="text/css" rel="stylesheet" href="css/in.css">
    <title>修改密码</title>
</head>
<body bgcolor="#7fffd4">


    <%
        String id = request.getParameter("id");
    %>

    <form action="${pageContext.request.contextPath}/servlet/ChangePwdTeaServlet?id=<%=id%>"   method="post" onsubmit="return beforeSubmit(this)">
        旧密码： <input class="input1" type="text" placeholder="请输入旧密码"  name="oldpwd">  <br/>
        新密码： <input class="input1" type="password" placeholder="请输入新密码" name="newpwd"> <br/>
        <br/><br/>
        <input class="button" type="submit" value="提交">
    </form>
    <%
        String oldpwdwrong = (String) request.getAttribute("oldpwdwrong");
        if(oldpwdwrong.equals("wrong")){
    %>
    <br/>
    <h5> 旧密码错误，请重新输入</h5>
    <br/>
    <%
    }else if(oldpwdwrong.equals("right")){
    %>
    <h5>密码修改成功</h5>
    <%
        }else if(oldpwdwrong==null){

        }
    %>


    <script language="JavaScript">
        function  beforeSubmit(form) {
            if(form.oldpwd.value===""){
                alert("旧密码不能为空");
                form.oldpwd.focus();
                return false;
            }
            if(form.newpwd.value===""){
                alert("新密码不能为空");
                form.newpwd.focus();
                return false;
            }
            return true;
        }
    </script>

</body>
</html>






