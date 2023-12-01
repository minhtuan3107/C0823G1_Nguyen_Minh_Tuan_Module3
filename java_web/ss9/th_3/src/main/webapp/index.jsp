<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/1/2023
  Time: 10:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Currency Converter</h2>
<form action="/convert-servlet" method="post">
    <label> Rate : </label>
    <input type="number" name="rate" placeholder="rate" value="22000">
    <label>USD: </label>
    <input type="number" name="usd" placeholder="usd" value="0">
    <input type="submit" id="submit" value="Converter">
</form>
</body>
</html>
