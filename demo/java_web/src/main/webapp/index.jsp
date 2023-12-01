<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<%--Name - Giá trị người dùng nhập vào => key-value --%>
<form action="/calculator-servlet">
    Số thứ nhất: <input type="number" name="firstNum">
    Số thứ hai: <input type="number" name="secondNum">
    <input type="submit" value="Cộng">
</form>
Result: ${ketqua}

</body>
</html>