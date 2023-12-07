package com.example.demo.controller;

import com.example.demo.model.DichVuDiKem;
import com.example.demo.model.LoaiDichVu;
import com.example.demo.service.DichVuDiKemService;
import com.example.demo.service.IDichVuDiKemService;
import com.example.demo.service.ILoaiDichVuService;
import com.example.demo.service.LoaiDichVuService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DichVuDiKemServlet", value = "/dich-vu-di-kem-servlet")
public class DichVuDiKemServlet extends HttpServlet {
    private final IDichVuDiKemService dichVuDiKemService = new DichVuDiKemService();
    private final ILoaiDichVuService loaiDichVuService = new LoaiDichVuService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            default:
                hienThiDanhSachDichVuDiKem(request, response);
                hienThiDanhSachLoaiDichVuDiKem(request, response);
        }
    }

    protected void hienThiDanhSachDichVuDiKem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<DichVuDiKem> listdvdk = dichVuDiKemService.hienThiDichVuDiKem();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/dich_vu_di_kem.jsp");
        request.setAttribute("listdvdk", listdvdk);
        requestDispatcher.forward(request, response);
    }

    protected void hienThiDanhSachLoaiDichVuDiKem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<LoaiDichVu> list = loaiDichVuService.layDanhSachLoaiDichVu();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/dich_vu_di_kem.jsp");
        request.setAttribute("list", list);
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
