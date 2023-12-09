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
<h1>Sửa loại dịch vụ</h1>
<form action="/loai-dich-vu-servlet?action=edit" method="post">
    <div class="modal-body">
        <div class="mb-3">
            <input type="hidden" name="id" value="${loaiDichVu.maLoaiDichVu}">
            <label class="form-label">Tên dịch vụ</label>
            <input type="text" class="form-control" name="name">
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close
        </button>
        <button type="submit" class="btn btn-primary">Sửa</button>
    </div>
</form>
<footer id="sticky-footer" class="flex-shrink-0 py-3 bg-dark text-white-50 fs-3 mt-4 fixed-bottom">
    <div class="container text-center">
        <small>Copyright &copy; Net Cỏ</small>
    </div>
</footer>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</html>
