<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/1/2023
  Time: 10:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        .login{
            height: 180px;
            width: 230px;
            margin: 0;
            padding: 10px;
            border: 1px #CCC solid;
        }
        .login input{
            padding: 5px;margin: 5px;
        }
    </style>
</head>
<body>
    <form action="/login-servlet" method="post">
        <div class="login">
            <input type="text" name="username" size="30" placeholder="username">
            <input type="password" name="password" size="30" placeholder="password">
            <input type="submit" value="Sign in">
        </div>
    </form>
</body>
</html>
