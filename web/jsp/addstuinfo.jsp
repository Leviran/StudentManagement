<%--
  Created by IntelliJ IDEA.
  User: yuan
  Date: 2020/11/13
  Time: 17:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<title>修改学生信息</title>
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
 <%

    String flag =  request.getParameter("flag");

    if(flag==null){       //如果得到为 null.

    }
    else {          // 不为空 后 转成int 类型 分析判断
        int flag1 = Integer.parseInt(flag);
        if (flag1 == 0) {

        } else if (flag1 == 1) {
            out.print("该学生的信息已存在，不能重复添加");
            out.print("<br/>");
        } else {

        }
    }
%>


<form action="/servlet/addStuServlet"   method="post" onsubmit="return addStudent(this)">
    <table align="center" bgcolor="#7fffd4">

        <tr>学号：  <input class="input2" type="text" name="id">  <br/></tr>
        <tr>姓名：      <input class="input2" type="text" name="name"> <br/></tr>
        <tr>出生日期：      <input class="input2" type="text" name="birth">   <br/></tr>
        <tr>院系:   <input class="input2" type="text" name="department"> <br/></tr>
        <tr>专业:       <input class="input2" type="text" name="major"> <br/></tr>
        <tr>年级:    <input class="input2" type="text" name="grade"> <br/></tr>
        <tr>班级        <input class="input2" type="text" name="clazz"> <br/></tr>
        <tr>性别:       <input class="input2" type="text" name="sex"> <br/></tr>
        <tr>邮箱:   <input class="input2" type="text" name="mail"><br/></tr>
    </table>
    <br><br>
    <input class="button" type="submit" value="提交">
    <br>
    <br>

</form>
<script language="JavaScript">
    function  addStudent(form) {
        if(form.stuId.value==""){
            alert("请输入学号");
            form.stuId.focus();
            return false;
        }
        if(form.stuName.value==""){
            alert("请输入姓名");
            form.stuName.focus();
            return false;
        }
        if(form.stuBri.value==""){
            alert("请输入出生日期");
            form.stuBri.focus();
            return false;
        }
        if(form.stuSex.value=="") {
            alert("请输入性别");
            form.stuSex.focus();
            return false;
        }
        if(form.stuGrade.value==""){
            alert("请输入年级");
            form.stuGrade.focus();
            return false;
        }
        if(form.stuSchool.value==""){
            alert("请输入院系");
            form.stuSchool.focus();
            return false;
        }
        if(form.stuMajor.value==""){
            alert("请输入专业");
            form.stuMajor.focus();
            return false;
        }
        if(form.stuClass.value==""){
            alert("请输入班级");
            form.stuClass.focus();
            return false;
        }
        if(form.stuTel.value=="")
        {
            alert("请输入手机号码");
            form.stuTel.focus();
            return false;
        }

        return true;
    }
</script>
</body>
</html>
