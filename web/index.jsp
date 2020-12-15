<%--
  Created by IntelliJ IDEA.
  User: yuan
  Date: 2020/11/13
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>学生信息管理系统</title>
</head>
<body>
    <style>
        body{
            background-color: cadetblue;
            background-position: center center;
        }

        .login{
            position: absolute;
            top: 50%;
            left: 50%;
            margin: -150px 0 0 -150px;
            width:300px;
            height:300px;

        }
        .input1{
            padding:10px;
            width:100%;
            color:black;
            margin-bottom:10px;
            background-color: bisque;
            border: 1px solid black;
            border-radius:4px;
            letter-spacing:2px;
        }
        form button{
            width:100%;
            padding:10px;
            background-color:#CDC673;
            border:1px solid black;
            border-radius:4px;
            cursor:pointer;
        }

    </style>

</body>

<body class="back" background="jsp/images/bg1.jpg">
<%--background.jpeg--%>
    <div class="login">
        <h1 align="center">Login</h1>
        <%
            String ifFail = (String)request.getAttribute("ifFail");
            if("failed".equals(ifFail)){
        %>
            <h5 > 密码错误，请重新输入</h5>
        <%
            }
        %>

        <form action="${pageContext.request.contextPath}/servlet/loginCheckServlet" method="post" onsubmit="return beforeSubmit(this)">
            账号： <input class="input1" type="text" placeholder="请输入账号"  name="id">  <br/>
            密码： <input class="input1" type="password" placeholder="请输入密码" name="pwd"> <br/>
            <img  id="imgValidate" src="servlet/validateServlet" onclick="refresh();">
            <a onclick="refresh();"  style="color: brown;">看不清，换一张</a>
            请输入验证码：<input class="input1" type="text" name="code" size="10"><br/>

            <label>
                <input type="radio" name="radio" value="student" checked="checked">
                学生
            </label>
            <label>
                <input type="radio" name="radio" value="teacher" checked="checked">
                教师
            </label>
            <label>
                <input type="radio" name="radio" value="admin" checked="checked">
                管理员
            </label>
            <br/>
            <br/>
            <br/>
            <input class="input1" type="submit" value="登录">

        </form>
    </div>

    <script language="JavaScript">
        function  beforeSubmit(form) {
            if(form.id.value===""){
                alert("用户名不能为空");
                form.id.focus();
                return false;
            }
            if(form.pwd.value===""){
                alert("密码不能为空");
                form.pwd.focus();
                return false;
            }
            return true;
        }
    </script>

    <script type="text/javascript">
        function refresh() {
            document.getElementById("imgValidate").src="/servlet/validateServlet?now="+Math.random();
        }
    </script>
</body>
</html>
