<%--
  Created by IntelliJ IDEA.
  User: yuan
  Date: 2020/12/15
  Time: 10:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加课程安排</title>
</head>
<body>
<form action="servlet/addCourseTableServlet" method="post" onsubmit="check(this)">
    课程id：<input id="cid" type="text" name="cid"><br/>
    授课教师id：<input id="tid" type="text" name="tid"><br/>
    上课地点：<input id="addr" type="text" name="addr"><br/>
    上课时间：<input id="day" type="text" name="day"><br/>
    第几节：<input id="sec" type="text" name="sec"><br/>
    <input type="submit" value="确定添加"><br/>
</form>

<%
    String takeup = request.getParameter("takeup");
    //如果教室被占
    if(takeup!=null){
%>
<h5>该教室在当天所选时段所选教室已经有课，请重新选择</h5>
<%
    }
%>

<script language="JavaScript">
    function check(form) {

    }
</script>

</body>
</html>
