<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/1/2023
  Time: 10:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Tu Dien</h2>
<form action="/translate-servlet" method="post">
    <input type="text" name="search" placeholder="Nhap chu">
    <input type="submit" id="submit" value="Search">
</form>
Result: ${result}
</body>
</html>
