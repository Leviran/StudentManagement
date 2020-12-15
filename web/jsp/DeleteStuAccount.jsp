<%@ page import="entity.Student" %>
<%@ page import="dao.StudentDao" %><%--
  Created by IntelliJ IDEA.
  User: yuan
  Date: 2020/11/13
  Time: 22:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除学生账号</title>
</head>
<body bgcolor="#7fffd4">

<%
    String id = request.getParameter("id");
    Student stu = null;
    if(id!=null)
    {
        stu= StudentDao.getStuById(id);
        if(stu.getId()!=null)
        {
            out.print(stu.getId()+"<br/>");
            out.print(stu.getName()+"<br/>");
        }
    }
%>
<a href="servlet/delStuServlet?id=<%=id%>">确定</a><br/>
<a href="servlet/ManageStu.jsp">取消</a>
</body>
</html>
