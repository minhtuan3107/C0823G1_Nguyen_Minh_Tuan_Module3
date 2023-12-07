package com.example.demo.controller;

import com.example.demo.model.DichVuDiKem;
import com.example.demo.service.DichVuDiKemService;
import com.example.demo.service.IDichVuDiKemService;

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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "display":
                hienThiDanhSachDichVuDiKem(request, response);
                break;
            default:
                hienThiDanhSachDichVuDiKem(request, response);
                break;
        }
    }


    protected void hienThiDanhSachDichVuDiKem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println(1);
        List<DichVuDiKem> list = dichVuDiKemService.layDanhSachDichVuDiKem();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("dvdk.jsp");
        request.setAttribute("list", list);
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
