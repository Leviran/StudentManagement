<%@ page import="dao.StudentDao" %>
<%@ page import="entity.Student" %>
<%--
  Created by IntelliJ IDEA.
  User: yuan
  Date: 2020/11/14
  Time: 0:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link type="text/css" rel="stylesheet" href="css/in.css">
    <title>个人信息</title>
</head>
<body bgcolor="#7fffd4">
    <%
            String stuId=request.getParameter("id");
            Student stu = StudentDao.getStuById(stuId);
    %>
    <tr>
        学号：<%=stu.getId()%>
    </tr><br/>
    <tr>
        姓名：<%=stu.getName()%>
    </tr><br/>
    <tr>
        出生日期：<%=stu.getBirth()%>
    </tr><br/>
    <tr>
        性别：<%=stu.getSex()%>
    </tr><br/>
    <tr>
        院系：<%=stu.getDepartment()%>
    </tr><br/>
    <tr>
        专业：<%=stu.getMajor()%>
    </tr><br/>
    <tr>
        年级：<%=stu.getGrade()%>
    </tr><br/>
    <tr>
        班级：<%=stu.getClazz()%>
    </tr><br/>
    <tr>
        邮箱：<%=stu.getMail()%>
    </tr><br/>
    <br/>

</body>
</html>
