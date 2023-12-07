
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="test.jsp"/>
<h1>Thêm mới sinh viên</h1>
<form method="post" action="/student-servlet?action=create">
    ID: <input type="number" name="id"><br/>
    Tên: <input type="text" name = "name"><br/>
    Giới tính: <input type="radio" name="gender" value="male"> Nam
    <input type="radio" value="female" name="gender"> Nữ <br>
    Điểm: <input type="number" name="point"><br/>
    <input type="submit" value="Thêm mới">
</form>
</body>
</html>
