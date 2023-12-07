<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script>
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
<!-- Navbar -->
<br><br>
<table class="table table-light container">
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
    </tr>
   <c:forEach items="${mayTinhList}" var="mayTinh">
       <tr>
           <td>${mayTinh.tenMayTinh}sss</td>
           <td>${mayTinh.ramMayTinh}</td>
           <td>${mayTinh.chip}</td>
           <td>${mayTinh.hang}</td>
           <td> <button class="btn btn-primary" onclick="toggleMachineStatus(this)">Mở Máy</button> </td>
           <td class="fs-5"> Đang Tắt </td>
           <td>
               <a type="button" href="orderFood.jsp" class="btn btn-secondary" target="_blank" >
                   Dịch vụ
               </a>
           </td>
       </tr>
   </c:forEach>
</table>
<br> <br> <br>

<!-- Footer -->
<footer id="sticky-footer" class="flex-shrink-0 py-3 bg-dark text-white-50 fs-3 mt-4 fixed-bottom">
    <div class="container text-center">
        <small>Copyright &copy; Net Cỏ</small>
    </div>
</footer>


<script src="../ss9/bootstrap-5.2.3-dist/js/bootstrap.bundle.js"></script>
</body>
</html>