<%@ page import="entity.CourseTable" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.McgDao" %>
<%@ page import="dao.TableDao" %><%--
  Created by IntelliJ IDEA.
  User: yuan
  Date: 2020/12/13
  Time: 23:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>课程管理</title>
</head>
<body>
<%
    String majorid = request.getParameter("major");
    String grade = request.getParameter("grade");
%>
<form>
    专业：<input type="text" name="major" value=<%=majorid%>><br/>
    年级：<input type="text" name="grade" value=<%=grade%>><br/>
</form>
<%
    List<CourseTable> ct = null;
    List<String> cidlist = McgDao.getCidByMAG(majorid,grade);
    for(String cid :cidlist){
        List<CourseTable> ctlist = TableDao.courseForStu(cid);
        for(CourseTable ctb : ctlist){
            ct.add(ctb);
        }
    }
%>

<h4>课程列表</h4>
<table>
    <tr>
        <th>课程号</th>
        <th>教师id</th>
        <th>上课地点</th>
        <th>上课日期</th>
        <th>第几节</th>
        <th>操作</th>
        <th>操作</th>
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
        <td><a href="deleteCourseA.jsp?cid=<%=ctb.getCid()%>&tid=<%=ctb.getTid()%>"target="right">删除课程安排</a></td>
        <td><a href="updateCourseA.jsp?cid=<%=ctb.getCid()%>&tid=<%=ctb.getTid()%>%>"target="right">修改课程安排</a></td>
    </tr>
    <%
        }
    %>
</table>

<br/>
<a href="addCourseA.jsp"target="right">添加课程安排</a>



</body>
</html>
