<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/4/2023
  Time: 1:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/product-servlet?action=edit" method="post">
  <table>
    <tr>
      <td>ID Edit: ${product.id}</td>
      <td></td>
    </tr>
    <tr>
      <td>Enter name edit:</td>
      <td><input type="text"  name="name" value="${product.name}"></td>
    </tr>
    <tr>
      <td>Enter price edit:</td>
      <td><input type="number" name="price" value="${product.price}"></td>
    </tr> <tr>
    <td>Enter des edit:</td>
    <td><input type="text" name="des" value="${product.des}"></td>
  </tr>
    <tr>
      <td>Enter manufacture edit:</td>
      <td><input type="text" name="manufacture" value="${product.manufacture}"></td>
    </tr>
    <tr>
      <td><input type="submit" value="submit"></td>
    </tr>
  </table>
</form>
</body>
</html>
