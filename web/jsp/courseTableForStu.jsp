<%@ page import="entity.Student" %>
<%@ page import="dao.StudentDao" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="dao.McgDao" %>
<%@ page import="dao.TableDao" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.CourseTable" %><%--
  Created by IntelliJ IDEA.
  User: yuan
  Date: 2020/12/13
  Time: 21:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生课表</title>
</head>
<body>
<%
    String id = request.getParameter("id");
    Student stu = StudentDao.getStuById(id);
    String majorid = stu.getMajor();
    String grade = stu.getGrade();
    ResultSet cidset = McgDao.getCidByMAG(majorid,grade);
    while(cidset.next()){
        String cid = cidset.getString("cid");
        List<CourseTable> ctlist = TableDao.courseForStu(id);
        while(!ctlist.isEmpty()){
            //todo咋把对应的课放到相应位置啊
        }
    }
%>
<table border="1px">
    <tr>
        <th>节数</th>
        <th>周一</th>
        <th>周二</th>
        <th>周三</th>
        <th>周四</th>
        <th>周五</th>
        <th>周六</th>
        <th>周日</th>

    </tr>
    <tr>
        <td>1-2节</td>


        <td><%=""%></td>
        <td><%="" %></td>
        <td> <a href="DeleteStudentServlet?sno=<%="" %>   ">删除</a> </td>

    </tr>
</table>
</body>
</html>
