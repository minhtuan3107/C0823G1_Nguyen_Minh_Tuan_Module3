<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<a href="/user-servlet?action=create">Thêm mới User</a>
<br>
<a href="/user-servlet?action=sort">Sắp xếp theo tên</a>
<br>
<form action="/user-servlet?action=search" method="post">
    Nhập tên quốc gia cần tìm kiếm: <input type="text" name="name">
    <input type="submit" value="Submit">
</form>
<table width="100%">
    <tr>
        <td>STT</td>
        <td>Tên</td>
        <td>Email</td>
        <td>Quốc gia</td>
        <td>Trạng thái</td>
    </tr>
    <c:forEach items="${userList}" var="user" varStatus="loop">
        <tr>
            <td>${loop.count}</td>
            <td>${user.name}</td>
            <td>${user.email}</td>
            <td>${user.country}</td>
            <td><a href="/user-servlet?action=edit&id=${user.id}">Sửa</a></td>
            <td><a href="/user-servlet?action=delete&id=${user.id}">Xóa</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>