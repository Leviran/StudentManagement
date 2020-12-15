<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.Student" %>
<%@ page import="dao.StudentDao" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: yuan
  Date: 2020/11/13
  Time: 20:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    .input2 {
        padding: 10px;
        width: 20%;
        color:black;
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
<body bgcolor="#7fffd4">
<%
    List<Student> arrayList = StudentDao.getAllStu();
//    List<Student> arrayList1 = new ArrayList<>();  //保存姓名查找
    Student stuByName = null;
        Student stu1 = new Student();// 保存用户名查找
%>
<br>
输入学生学号查找：
<br>
<form action="StuInfo.jsp" method="post">
    <label>
        <input class="input2" type="text" name="stuId">
    </label>
    <input class="button" type="submit" value="查找">
</form>

<%
    String stuId = request.getParameter("stuId");
    if(stuId==null){

    }
    else{
    stu1 = StudentDao.getStuById(stuId);
    if(stu1.getId()==null){
        out.print("没有你查找的信息，请检查输入信息是否有误");
    }
    else{
    out.print(stu1.getId()+"   ");
    out.print(stu1.getName()+"    ");
    out.print(stu1.getBirth()+"    ");
    out.print(stu1.getSex()+"    ");
    out.print(stu1.getGrade()+"   ");
    out.print(stu1.getDepartment()+"     ");
    out.print(stu1.getMajor()+"     ");
    out.print(stu1.getClazz()+"    ");
    out.print(stu1.getMail()+"     ");
    out.print(String.format("<a href=\"/jsp/DeleteStuInfo.jsp?stuId=%s\">删除</a>",
    stu1.getId()));
%>     &nbsp;&nbsp;
<%
    out.print(String.format("<a href=\"/jsp/updateStuInfo.jsp?stuId=%s\">修改</a>",
    stu1.getId()));
        }
        out.print("<br/>");
    }
%>
<br>
<br>
<br>
输入姓名查找：
<br>
<form action="StuInfo.jsp" method="post">
    <label>
        <input class="input2" type="text" name="stuName">
    </label>
    <input class="button" type="submit" value="查找">
</form>
<%
    String stuName = request.getParameter("stuName");
    if(stuName==null){

    }
    else{
    stuByName = StudentDao.getStuByName(stuName);
    if(stuByName==null){
    out.print("没有你查找的信息，请检查信息是否有误");
    out.print("<br/>");
    }
    else{
//    for(Student stu2:stuByName){
    out.print(stuByName.getId()+"   ");
    out.print(stuByName.getName()+"    ");
    out.print(stuByName.getBirth()+"    ");
    out.print(stuByName.getSex()+"    ");
    out.print(stuByName.getGrade()+"   ");
    out.print(stuByName.getMajor()+"    ");
    out.print(stuByName.getDepartment()+"     ");
    out.print(stuByName.getClazz()+"    ");
    out.print(stuByName.getMail()+"    ");
    out.print(String.format("<a href=\"/jsp/DeleteStuInfo.jsp?stuId=%s\">删除</a>", stuByName.getId()));
%>     &nbsp;&nbsp;
<%
    out.print(String.format("<a href=\"/jsp/updateStuInfo.jsp?stuId=%s\">修改</a>", stuByName.getId()));
    out.print("<br/>");
    }
//    }
    }

%>
<%
    out.println("<br/>");
    out.println("-----------------------------------------------------------------------------------------------------------------------------");
    out.println("<br/>");
%>
<%
       for (Student stu:arrayList) {
           out.print(stu.getId() + "   ");
           out.print(stu.getName() + "    ");
           out.print(stu.getBirth() + "    ");
           out.print(stu.getSex() + "   ");
           out.print(stu.getGrade() + "     ");
           out.print(stu.getDepartment() + "    ");
           out.print(stu.getMajor() + "    ");
           out.print(stu.getClazz() + "    ");
           out.print(stu.getMail() + "    ");
           out.print("<br/>");
       }
%>
<br/>
<br/>


</body>
</html>
