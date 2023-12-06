package com.example.demo.controller;

import com.example.demo.model.LoaiDichVu;
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

@WebServlet(name = "LoaiDichVuServlet", value = "/loai-dich-vu-servlet")
public class LoaiDichVuServlet extends HttpServlet {
    private final ILoaiDichVuService loaiDichVuService = new LoaiDichVuService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                break;
            default:
                hienThiLoaiDichVu(request, response);
        }
    }

    protected void xoaLoaiDichVu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        loaiDichVuService.xoaLoaiDichVu(id);
        response.sendRedirect("/loai-dich-vu-servlet");
    }

    protected void hienThiLoaiDichVu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<LoaiDichVu> list = loaiDichVuService.layDanhSachLoaiDichVu();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
        request.setAttribute("list", list);
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "edit":
                suaLoaiDichVu(request, response);
                break;
            default:
        }
    }

    protected void suaLoaiDichVu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        loaiDichVuService.suaLoaiDichVu(new LoaiDichVu(id, name));
        response.sendRedirect("/loai-dich-vu-servlet");
    }
}
