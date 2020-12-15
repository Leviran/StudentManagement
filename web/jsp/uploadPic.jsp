<%--@elvariable id="massage" type="servlet.uploadFileServlet"--%>
<%--
  Created by IntelliJ IDEA.
  User: yuan
  Date: 2020/11/13
  Time: 12:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%String ctxPath=request.getContextPath(); %>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>上传图片</title>
</head>
<body>
    <form action="<%=ctxPath%>/servlet/uploadFileServlet" method="post" enctype="multipart/form-data">
        <input class="input2" type="file" name="file">
        <input class="button" type="submit" name="upload"  value="提交">
    </form>
        ${massage}
</body>
</html>
