<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/4/2023
  Time: 11:44 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="/product-servlet?action=search">
  <table style="width: 100%;">
    <tr>
      <td>Enter name search: </td>
      <td><input type="text" name="name" id="name" required></td>
      <td><input type="submit" value="Search"></td>
    </tr>
  </table>
</form>
</body>
</html>
