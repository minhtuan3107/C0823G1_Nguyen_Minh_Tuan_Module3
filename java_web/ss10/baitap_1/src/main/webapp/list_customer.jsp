<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/4/2023
  Time: 10:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        th{
            width: 20%;}
    </style>
</head>
<body>
<h1>Danh sách khách hàng</h1>
<table style="border-collapse: collapse">
    <tr>
        <th>Tên</th>
        <th>Ngày Sinh</th>
        <th>Địa Chỉ</th>
        <th>Ảnh</th>
    </tr>
    <c:forEach items="${customerList}" var="customer" varStatus="loop">
        <tr>
            <th>${customer.name}</th>
            <th>${customer.date}</th>
            <th>${customer.address}</th>
            <th><img src="${customer.pic}" style="height: 50%; width: 50%; "></th>
        </tr>
    </c:forEach>
</table>
</body>
</html>
