<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/5/2023
  Time: 5:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <!-- Font Awesome -->
    <script>
        // tt bat may
        function toggleMachineStatus(button) {
            var row = button.parentNode.parentNode;
            var statusCell = row.cells[5];
            if (statusCell.textContent === "Đang Bật") {
                statusCell.textContent = "Đang Tắt";
                button.textContent = "Mở máy";
                button.classList.remove('btn-danger');
            } else {
                statusCell.textContent = "Đang Bật";
                button.textContent = "Tắt máy";
                button.classList.add('btn-danger');
            }
        }
    </script>
    </script>
</head>
<body>
<!-- Navbar -->
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
<!-- Navbar -->
<br><br>
<table class="table table-light container table-hover">
    <tr>
        <td></td>  <td></td>
        <td><p class="text-center fs-4 fw-bold">Quản lý phòng máy</p></td>
    </tr>
    <tr class="table-primary">
        <th>Tên máy</th>
        <th>Thời gian bắt đầu</th>
        <th>Thời gian kết thúc</th>
        <th>Thời gian đã dùng</th>
        <th>Mở máy</th>
        <th>Trạng thái máy</th>
        <th>Dịch vụ</th>
        <th>Tiền dịch vụ</th>
        <th>Tổng tiền</th>
        <th>Chi tiết Máy</th>
    </tr>
    <tr>
        <td> Máy 1 </td>
        <td> data </td>
        <td> data </td>
        <td> data </td>
        <td> <button class="btn btn-primary" onclick="toggleMachineStatus(this)">Mở Máy</button> </td>
        <td class="fs-5"> Đang Tắt </td>
        <td>
            <a type="button" href="orderFood.html" class="btn btn-secondary" target="_blank" >
                Dịch vụ
            </a>
        </td>
        <td> 0 </td>
        <td> 0 </td>
        <td><a class="btn btn-primary" href="chitietmay.html" target="_blank">Chi Tiết</a></td>
    </tr>
    <tr>
        <td> Máy 2 </td>
        <td> data </td>
        <td> data </td>
        <td> data </td>
        <td> <button class="btn btn-primary" onclick="toggleMachineStatus(this)">Mở Máy</button> </td>
        <td class="fs-5"> Đang Tắt </td>
        <td>
            <a type="button" href="orderFood.html" class="btn btn-secondary" target="_blank" >
                Dịch vụ
            </a>
        </td>
        <td> 0 </td>
        <td> 0 </td>
        <td><a class="btn btn-primary" href="chitietmay.html" target="_blank">Chi Tiết</a></td>
    </tr>
</table>
<br> <br> <br>
<!-- Footer -->
<footer id="sticky-footer" class="flex-shrink-0 py-3 bg-dark text-white-50 fs-3 mt-4 fixed-bottom">
    <div class="container text-center">
        <small>Copyright &copy; Net Cỏ</small>
    </div>
</footer>
</body>
</html>