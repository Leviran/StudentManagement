<%@ page import="dao.TeacherDao" %>
<%@ page import="entity.Teacher" %><%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2020/11/9
  Time: 22:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除教师账号</title>
</head>
<body bgcolor="#7fffd4">

<%
    String id = request.getParameter("id");
    Teacher tea = null;
    if(id!=null)
    {
        tea=TeacherDao.getTeaById(id);
        if(tea.getId()!=null)
        {
            out.print(tea.getId()+"<br/>");
            out.print(tea.getName()+"<br/>");
//            out.print(String.format("<a href=\" /servlet/delTeaServlet?id=%s\" > " + "确定 </a>",id));
//            out.print(String.format("<a href=\"/jsp/DeleteTeaAccount.jsp?\" > " + " 取消</a>"));
        }
    }
%>
<a href="/servlet/delTeaServlet?id=<%=id%>">确定</a><br/>
<a href="/servlet/ManageTea.jsp">取消</a>
</body>
</html>
