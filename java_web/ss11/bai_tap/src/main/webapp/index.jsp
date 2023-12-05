<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<a href="/product-servlet?action=add">Thêm mới sản phẩm</a>
<form method="post" action="/product-servlet?action=search">
    <table style="width: 100%;">
        <tr>
            <td>Enter name search:</td>
            <td><input type="text" name="name" id="name" required></td>
            <td><input type="submit" value="Search"></td>
        </tr>
    </table>
</form>
<table style="width: 100%">
    <tr>
        <td>Stt</td>
        <td>Name</td>
        <td>Price</td>
        <td>Des</td>
        <td>ManuFacture</td>
    </tr>
    <c:forEach items="${productList}" var="product" varStatus="loop">
        <tr>
            <td>${loop.count}</td>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>${product.des}</td>
            <td>${product.manufacture}</td>
            <td><a href="/product-servlet?action=edit&id=${product.id}">Sửa sản phẩm</a>
            </td>
            <td><a onclick="showMessage(${product.id})">Xóa sản phẩm</a>
            </td>
        </tr>
    </c:forEach>
    <c:if test="${productList.size() == 0}">
        <tr>
            <td>
                Không có sản phẩm nào
            </td>
        </tr>
    </c:if>
</table>
</body>
<script>
    function showMessage(id) {
        let option = confirm('Are you sure to delete ?');
        if (option === true) {
            window.location.href = "/product-servlet?action=delete&id=" + id;
        }
    }
</script>
</html>