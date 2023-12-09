<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/5/2023
  Time: 11:31 PM
  To change this template use File | Settings | File Templates.
--%>
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
  <!-- Font Awesome -->


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
<table class="table table-light container-fluid table-hover">

  <tr>
    <td></td>
    <td><p style="font-size: 30px" class="text-center fw-bold">Lịch sử  dùng </p></td>
    <td></td><td></td>

  <tr> <td> <a  class="btn btn-primary" href="/may-tinh-servlet">Home</a></td></tr>
  </tr>
  <tr class="table-primary">
    <th>Mã máy tính</th>
    <th>Mã bảng sử dụng</th>
    <th>Thời gian bắt đầu</th>
    <th>Thời gian kết thúc</th>
    <th>Thời gian sử dụng</th>
    <th>Nhân Viên </th>
    <th>Chi Tiết dịch vụ</th>
    <th>Tổng Tiền</th>
    <th>Trạng Thái</th>
    <th>Xác Nhận Thanh Toán</th>
  </tr>

<c:forEach items="${historyList}" var="bangsudung">
  <tr>
    <td>${bangsudung.maMayTinh.idMayTinh}</td>
    <td>${bangsudung.idBangSuDung}</td>
    <td>${bangsudung.gioBatDau}</td>
    <td >${bangsudung.gioKetThuc}</td>
    <td>${(bangsudung.daDung / 60)} phút</td>

    <td>${bangsudung.maNhanVien.idNhanVien}</td>

    <td> <a type="button" href="/history-rental-servlet?action=orderUsed&id=${bangsudung.idBangSuDung}" class="btn btn-secondary" >
      Xem dịch vụ
    </a></td>

    <td>${bangsudung.getTongTien()}</td>
    <c:if test="${bangsudung.status == true}">
      <td>
        <p class="btn btn-success">Đã Thanh Toán</p>
      </td>
    </c:if>

    <c:if test="${bangsudung.status == false}">
      <td>
        <p class="btn btn-warning">Chưa thanh toán</p>
      </td>
    </c:if>

    <c:if test="${bangsudung.status == false}">
    <td><a href="/history-rental-servlet?action=confirmationPayment&id=${bangsudung.idBangSuDung}&idMay=${idMay}" class="btn btn-primary">Đồng ý</a> </td>
    </c:if>
    <c:if test="${bangsudung.status == true}">
      <td><p >Đã thanh toán</p> </td>
    </c:if>
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
