<%@ page import="dao.TableDao" %>
<%@ page import="entity.CourseTable" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: yuan
  Date: 2020/12/13
  Time: 23:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>教师任课信息</title>
</head>
<body>
<%
    String tid = request.getParameter("id");
    List<CourseTable> ct = TableDao.courseForTea(tid);
%>
<br/>
<h4>任课信息列表</h4>
<h5>任课教师:&nbsp;&nbsp;<%=tid%></h5>
<table>
    <tr>
        <th>课程号</th>
        <th>上课地点</th>
        <th>上课日期</th>
        <th>第几节</th>
    </tr>
    <%
        for(CourseTable ctb: ct){
    %>
    <tr>
        <td><%=ctb.getCid() %></td>
        <td><%=ctb.getTid()%></td>
        <td><%=ctb.getAddr()%></td>
        <td><%=ctb.getDay()%></td>
        <td><%=ctb.getSection()%></td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>
