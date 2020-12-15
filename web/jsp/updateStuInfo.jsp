<%@ page import="entity.Student" %>
<%@ page import="dao.StudentDao" %>
<%--
  Created by IntelliJ IDEA.
  User: yuan
  Date: 2020/11/13
  Time: 17:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link type="text/css" rel="stylesheet" href="css/in.css">
    <title>修改学生信息</title>
</head>
<body bgcolor="#7fffd4">
    <%
        String id = request.getParameter("id");
        Student stu = StudentDao.getStuById(id);
    %>
<form action="${pageContext.request.contextPath}/servlet/updateStuInfoServlet?oldid=<%=id%>"   method="post" onsubmit="return update(this)">
   <table>
          <tr>
              学号:
              <input class="input2" type="text" name="id" value="<%=stu.getId()%>"><br/>
          </tr>
          <tr>
              姓名:
              <input class="input2" type="text" name="name" value="<%=stu.getName() %>"><br/>
          </tr>
          <tr>
              出生日期:
              <input class="input2" type="text" name="birth" value="<%=stu.getBirth()%>"><br/>
          </tr>
          <tr>
              性别:
              <input class="input2" type="text" name="sex" value="<%=stu.getSex() %>"><br/>
          </tr>
           <tr>
               院系:
               <input class="input2" type="text" name="department" value="<%=stu.getDepartment() %>"><br/>
           </tr>
           <tr>
               专业:
               <input class="input2" type="text" name="major" value="<%=stu.getMajor() %>"><br/>
           </tr>
           <tr>
               年级:
               <input class="input2" type="text" name="grade" value="<%=stu.getGrade() %>"><br/>
           </tr>
           <tr>
               班级:
               <input class="input2" type="text" name="clazz" value="<%=stu.getClazz() %>"><br/>
           </tr>
           <tr>
               邮箱:
               <input class="input2" type="text" name="mail" value="<%=stu.getMail()%>"><br/>
           </tr>
   </table>
    <br/><br/>
    <input class="button" type="submit" value="提交">
</form>

<br/>
    <%
        String ifSuccess = (String) request.getAttribute("ifSuccess");
        if(ifSuccess.equals("success")){
    %>
    <h5>修改成功</h5>
    <%
    }else if(ifSuccess.equals("failed")){
    %>
    <h5>修改失败</h5>
    <%
        }else if(ifSuccess==null){

        }
    %>
<script language="JavaScript">
    function  update(form) {
        if(form.id.value==""){
            alert("请输入学号");
            form.id.focus();
            return false;
        }
        if(form.name.value==""){
            alert("请输入姓名");
            form.name.focus();
            return false;
        }
        if(form.birth.value==""){
            alert("请输入出生日期");
            form.birth.focus();
            return false;
        }
        if(form.sex.value=="") {
            alert("请输入性别");
            form.sex.focus();
            return false;
        }
        if(form.department.value==""){
            alert("请输入院系");
            form.department.focus();
            return false;
        }
        if(form.major.value==""){
            alert("请输入专业");
            form.major.focus();
            return false;
        }
        if(form.grade.value==""){
            alert("请输入年级");
            form.grade.focus();
            return false;
        }
        if(form.clazz.value==""){
            alert("请输入班级");
            form.clazz.focus();
            return false;
        }
        if(form.mail.value==""||check())
        {
            alert("请输入邮箱");
            form.mail.focus();
            return false;
        }
        return true;
    }
</script>

<script>
    //todo 邮箱格式检验
    function check(){
        var reg = /^\w+((.\w+)|(-\w+))@[A-Za-z0-9]+((.|-)[A-Za-z0-9]+).[A-Za-z0-9]+$/; //正则表达式
        var obj = document.getElementById("mail"); //要验证的对象
        if(!reg.test(obj.value)){ //正则验证不通过，格式不对
            alert("邮箱格式错误！");
            return false;
        }else{
            return true;
        }
    }
</script>

</body>
</html>
