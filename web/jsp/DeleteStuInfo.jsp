<%@ page import="dao.Stuinfo" %>
<%@ page import="bean.stuinfo" %><%--
  Created by IntelliJ IDEA.
  User: yuan
  Date: 2020/11/9
  Time: 20:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除学生信息</title>
</head>
<body bgcolor="#7fffd4">
请输入该学生学号：
<br>
<form action="DeleteStuInfo.jsp" method="post">
    <label>
        <input class="input2" type="text" name="stuId">
    </label>
    <input class="button" type="submit" value="查找">
</form>
<%
    String stuId = request.getParameter("stuId");
    stuinfo stu=new stuinfo();
    if(stuId==null){

    }
    else {
        stu = Stuinfo.findName(stuId);
        if (stu.getStuId()== null) {
            out.print("没有你查找的信息，请检查输入信息是否有误");
        } else {
            out.print(stu.getStuId() + "   ");
            out.print(stu.getStuName() + "    ");
            out.print(stu.getStuBri()+"     ");
            out.print(stu.getStuSex()+"     ");
            out.print(stu.getStuGrade()+"     ");
            out.print(stu.getStuSchool()+"     ");
            out.print(stu.getStuMajor()+"     ");
            out.print(stu.getStuClass()+"     ");
            out.print(stu.getStuTel()+"     ");
            out.print(String.format("<a href=\"/servlet/delstu?stuId=%s\">删除</a>",stu.getStuId()));
            out.print(String.format("<a href=\"DeleteStuInfo.jsp\">取消</a>",stu.getStuId()));
        }
    }
%>

</body>
</html>
