<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <title>JSP - Hello World</title>
</head>
<body>
<nav style="padding: 0;" class="navbar navbar-expand-sm navbar-light bg-body-tertiary">
    <!-- Container wrapper -->
    <div class="container-fluid bg-dark">
        <!-- Navbar brand -->
        <a class="navbar-brand me-2" target="_blank" href="https://www.facebook.com/dolevan1011">
            <img
                    src="./img/logo.jpg"
                    height="60"
                    width="160"
                    alt="MDB Logo"
                    loading="lazy"
                    style="margin-top: -1px;"
            />
        </a>
    </div>
</nav>

<table class="table">
    <thead>
    <tr>
        <th scope="col">STT</th>
        <th scope="col">Tên Dịch Vụ</th>
        <th scope="col">Hành động</th>
        <th scope="col">
            <!-- Button trigger modal -->
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                Thêm loại dịch vụ mới
            </button>

            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel2"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel2">Thêm loại dịch vụ</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form action="/loai-dich-vu-servlet?action=add" method="post">
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Nhập tên loại dịch vụ</label>
                                    <input type="text" class="form-control" id="exampleInputEmail1"
                                           aria-describedby="emailHelp" name="name">
                                </div>
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="loai" varStatus="loop">
        <tr>
            <td>${loop.count}</td>
            <td>${loai.tenLoaiDichVu}</td>
            <td>
                <a class="button btn-danger"
                   href="/loai-dich-vu-servlet?action=edit&id=${loai.maLoaiDichVu}">Sửa</a>
            </td>
            <td>
                <button type="button" class="btn btn-outline-warning" data-bs-toggle="modal"
                        data-bs-target="#exampleModal1"
                        onclick="send('${loai.maLoaiDichVu}','${loai.tenLoaiDichVu}')"> Xóa
                </button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/loai-dich-vu-servlet?action=delete" method="post">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #ffc107; color:#000; font-size: 1.2rem">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Xác nhận xóa</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <input type="hidden" name="id" id="id">
                <div class="modal-body">
                    Bạn có muốn xóa "<span style="color:#ffc107 " id="title"></span>" hay không?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Không</button>
                    <button type="submit" class="btn btn-warning">Xóa</button>
                </div>
            </div>
        </form>
    </div>
</div>
<footer id="sticky-footer" class="flex-shrink-0 py-3 bg-dark text-white-50 fs-3 mt-4 fixed-bottom">
    <div class="container text-center">
        <small>Copyright &copy; Net Cỏ</small>
    </div>
</footer>
<script>
    function send(id, title) {
        document.getElementById("id").value = id;
        document.getElementById("title").innerText = title;
    }
</script>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</html>