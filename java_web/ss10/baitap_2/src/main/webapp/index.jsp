<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1>May tinh</h1>
<form action="/calculator-servlet" method="post">
    <table>
        <tr>
            <td>Nhập số thứ nhất : </td>
            <td><input type="number" name="firstNumber"></td>
        </tr>
        <tr>
            <td>Chọn phép tính: </td>
            <td>
                <select name="operator">
                    <option value="add">Cộng</option>
                    <option value="apartFrom">Trừ</option>
                    <option value="core">Nhân</option>
                    <option value="divide">Chia</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>Nhập số thứ hai: </td>
            <td><input type="number" name="secondNumber"></td>
        </tr>
        <tr>
            <td><button type="submit">Submit</button></td>
        </tr>
    </table>
</form>
Kết quả : ${text}
</body>
</html>