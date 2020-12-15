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
<h3>根据专业代码、年级查询课程</h3>
<form action="jsp/ManageCourseShow.jsp" method="post" onsubmit="check(this)">
    专业：<input type="text" name="major"><br/>
    年级：<input type="text" name="grade"><br/><br/>
    <input type="submit" value="提交查询"><br/>
</form>


<script language="JavaScript">
    function check(form){
        if(form.major.value==""){
            alert("专业不能为空");
            form.id.focus();
            return false;
        }
        if(form.grade.value==""){
            alert("年级不能为空");
            form.id.focus();
            return false;
        }
        return true;
    }
</script>


</body>
</html>
