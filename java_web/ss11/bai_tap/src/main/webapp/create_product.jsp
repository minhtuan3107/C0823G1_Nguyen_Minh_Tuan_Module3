<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/4/2023
  Time: 11:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Tạo sản phẩm</h1>
<form method="post" action="/product-servlet?action=add">
  <table>
    <tr>
      <td>ID: </td>
      <td><input type="number" name="id" id="id" required></td>
    </tr>
    <tr>
      <td>Name: </td>
      <td><input type="text" name="name" id="name" required></td>
    </tr>
    <tr>
      <td>Price: </td>
      <td><input type="number" name="price" id="price" required></td>
    </tr>
    <tr>
      <td>Des: </td>
      <td><input type="text" name="des" id="des" required></td>
    </tr>
    <tr>
      <td>Manufacture: </td>
      <td><input type="text"name="manufacture" id="manufacture" required></td>
    </tr>
    <tr>
      <td></td>
      <td><input type="submit" value="Create product"></td>
    </tr>
  </table>
</form>
</body>
</html>
