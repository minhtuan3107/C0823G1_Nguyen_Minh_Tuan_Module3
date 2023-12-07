<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/5/2023
  Time: 10:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/user-servlet?action=edit" method="post">
    <input type="hidden" name="id" value="${user.id}">
    <table width="50%">
        <tr>
            <td>ID cần sửa là:</td>
            <td>${user.id}</td>
        </tr>
        <tr>
            <td>Nhập tên muốn sửa</td>
            <td><input type="text" value="${user.name}" name="name"></td>
        </tr>
        <tr>
            <td>Nhập email muốn sửa</td>
            <td><input type="text" value="${user.email}" name="email"></td>
        </tr>
        <tr>
            <td>Nhập quốc gia muốn sửa</td>
            <td><input type="text" value="${user.country}" name="country"></td>
        </tr>
        <tr>
            <td>Xác nhận</td>
            <td><input type="submit" value="Submit"></td>
        </tr>
    </table>
</form>
</body>
</html>
