<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>USER</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<a class="btn btn-primary" role="button" href="/user-servlet?action=create">Thêm mới User</a>
<a class="btn btn-primary" role="button" href="/user-servlet?action=sort">Sắp xếp theo tên</a>
<br>
<form action="/user-servlet?action=search" method="post">
    <div class="mb-3">
        <label for="exampleInputEmail1" class="form-label">Nhập tên quốc gia cần tìm kiếm: </label>
        <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="name">
        <br>
        <button type="submit" class="btn btn-primary">Submit</button>
    </div>
</form>
<br>
<table width="100%" class="table">
    <tr>
        <td>STT</td>
        <td>Tên</td>
        <td>Email</td>
        <td>Quốc gia</td>
        <td>Trạng thái</td>
        <td></td>
    </tr>
    <c:forEach items="${userList}" var="user" varStatus="loop">
        <tr>
            <td>${loop.count}</td>
            <td>${user.name}</td>
            <td>${user.email}</td>
            <td>${user.country}</td>
            <td><a type="submit" class="btn" href="/user-servlet?action=edit&id=${user.id}">Sửa</a></td>
            <td><!-- Button trigger modal -->
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Xóa
                </button>
                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                Bạn có muốn xóa id là ${user.id} và tên là ${user.name} không ?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn" data-bs-dismiss="modal">Không</button>
                                <a type="submit" class="btn btn-primary" role="button" href="/user-servlet?action=delete&id=${user.id}">Xóa</a>
                            </div>
                        </div>
                    </div>
                </div>
            </td>
        </tr>
    </c:forEach>
</table>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous">
</script>
</body>
</html>