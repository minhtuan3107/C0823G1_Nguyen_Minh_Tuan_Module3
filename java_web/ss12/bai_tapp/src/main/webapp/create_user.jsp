<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/5/2023
  Time: 10:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/user-servlet?action=create" method="post">
    <table width="50%">
        <tr>
            <td>Nhập tên cần tạo: </td>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <td>Nhập email: </td>
            <td><input type="text" name="email"></td>
        </tr>
        <tr>
            <td>Nhập quốc gia: </td>
            <td><input type="text" name="country"></td>
        </tr>
        <tr>
            <td>Xác nhận: </td>
            <td><input type="submit" value="submit"></td>
        </tr>
    </table>
</form>
</body>
</html>
