<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <style>
        table{
            border-collapse: collapse;
        }
    </style>
</head>
<body>

<a href="/student-servlet?action=create">Thêm mới sinh viên</a>
<h1>Danh sách sinh viên</h1>
<table border="1px">
    <tr>
        <th>STT</th>
        <th>Tên</th>
        <th>Giới tính</th>
        <th>Điểm</th>
        <th>Xếp Loại</th>
    </tr>
    <c:forEach items="${list}" var="student" varStatus="loop">
        <tr>
            <td>${loop.count}</td>
            <td><c:out value="${student.name}"/></td>

<%--            Giới tính--%>
            <c:if test="${student.gender == true}">
                <td>Nam</td>
            </c:if>
            <c:if test="${student.gender == false}">
                <td>Nữ</td>
            </c:if>
            
<%--            Điểm--%>
            <td>${student.point}</td>
            <c:choose>
                <c:when test="${student.point >= 7}">
                    <td>Giỏi</td>
                </c:when>
                <c:when test="${student.point >= 6}">
                    <td>Khá</td>
                </c:when>
                <c:when test="${student.point >= 5}">
                    <td>Trung bình</td>
                </c:when>
                <c:otherwise>
                    <td>Yếu</td>
                </c:otherwise>
            </c:choose>
        </tr>
    </c:forEach>
</table>
</body>
</html>
