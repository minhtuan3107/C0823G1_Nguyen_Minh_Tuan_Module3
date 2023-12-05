<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/5/2023
  Time: 1:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Bạn có muốn xóa User có thông tin là:  </h1>
<form action="/user-servlet?action=delete" method="post">
    <input type="hidden" name="id" value="${user.id}">
    <table style="width: 100%;">
        <tr>
            <td>Tên: ${user.name}</td>
            <td>Email: ${user.email}</td>
            <td>Quốc gia: ${user.country}</td>
            <td><input type="submit" value="Có"></td>
            <td><button><a href="/user-servlet">Không</a></button></td>
        </tr>
    </table>
</form>
</body>
</html>
