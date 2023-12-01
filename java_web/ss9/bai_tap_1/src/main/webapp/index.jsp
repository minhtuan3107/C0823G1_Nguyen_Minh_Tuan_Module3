<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Discount Calculator</title>
</head>
<body>
<form action="/discount-servlet" method="post">
    <input type="text" name="des" placeholder="Nhập mô tả của sản phẩm">
    <input type="number" name="price" placeholder="Nhập giá niêm yết của sản phẩm">
    <input type="number" name="percent" placeholder="Tỷ lệ chiết khấu (phần trăm)">
    <input type="submit" id="submit" placeholder="Tính">
</form>
<h1>Lượng chiết khấu: ${amount}</h1>
<h1>Giá sau khi được chiết khấu: ${money}</h1>
</body>
</html>