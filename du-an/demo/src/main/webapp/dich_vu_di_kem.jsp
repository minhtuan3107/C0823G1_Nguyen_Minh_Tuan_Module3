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
<h1 style="text-align: center">Danh sách loại dịch vụ đi kèm</h1>
<table class="table" style="width: 100%;">
    <tr>
        <td><a class="btn btn-success" href="/loai-dich-vu-servlet" role="button">Hiển thị loại dịch vụ</a>
        </td>
        <td>
        <td scope="col">
            <!-- Button trigger modal -->
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                Thêm dịch vụ đi kèm
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
                            <form action="/dich-vu-di-kem-servlet?action=add" method="post">
                                <div class="mb-3">
                                    <label class="form-label">Nhập tên dịch vụ đi kèm</label>
                                    <input type="text" class="form-control" name="name">
                                    <label class="form-label">Nhập giá dịch vụ đi kèm</label>
                                    <input type="number" class="form-control" name="price">
                                    <br>
                                    <select class="form-select" aria-label="Default select example" name="maldv">
                                        <option selected>Chọn loại dịch vụ</option>
                                        <c:forEach items="${list}" var="l" varStatus="loop">
                                            <option value="${l.maLoaiDichVu}">${l.tenLoaiDichVu}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-primary">Thêm</button>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </td>
    </tr>
</table>
<table class="table" style="width: 100%;">
    <thead>
    <tr>
        <th scope="col">STT</th>
        <th scope="col">Tên Dịch Vụ Đi Kèm</th>
        <th scope="col">Giá dịch vụ đi kèm</th>
        <th scope="col">Loại dịch vụ</th>
        <th scope="col">Sửa</th>
        <th scope="col">Xóa</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${listdvdk}" var="dvdk" varStatus="loop">
        <tr>
            <td>${loop.count}</td>
            <td>${dvdk.tenDichVuDiKem}</td>
            <td>${dvdk.giaDichVuDiKem}</td>
            <td>${dvdk.tenLoaiDichVu}</td>
            <td>
                <a class="btn btn-primary" role="button"
                   href="/dich-vu-di-kem-servlet?action=edit&id=${dvdk.maDichVuDiKem}">Sửa</a>
            </td>
            <td>
                <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                        data-bs-target="#exampleModal1"
                        onclick="send('${dvdk.maDichVuDiKem}','${dvdk.tenDichVuDiKem}')"> Xóa
                </button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/dich-vu-di-kem-servlet?action=delete" method="post">
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
</body>
<script>
    function send(id, title) {
        document.getElementById("id").value = id;
        document.getElementById("title").innerText = title;
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous">
</script>

</html>