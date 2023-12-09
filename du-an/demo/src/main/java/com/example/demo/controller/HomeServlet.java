package com.example.demo.controller;

import com.example.demo.model.BangSuDung;
import com.example.demo.model.DichVuDiKem;
import com.example.demo.model.MayTinh;
import com.example.demo.model.SuDungChiTiet;
import com.example.demo.service.dichvuservice.DichVuService;
import com.example.demo.service.dichvuservice.IDichVuService;
import com.example.demo.service.maytinhservice.IMayTinhService;
import com.example.demo.service.maytinhservice.MayTinhService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeServlet", value = "/home-servlet")
public class HomeServlet extends HttpServlet {
    private IMayTinhService computerService = new MayTinhService();
    private IDichVuService iDichVuService = new DichVuService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "orderFood":
                orderFood(request, response);
                break;
            case "listOrder":
                listOrder(request, response);
                break;
            case "orderUsed":
                listOrderUsed(request, response);
                break;
            default:
                listAreRental(request, response);
        }

    }

    private void listAreRental(HttpServletRequest request, HttpServletResponse response) {
        List<BangSuDung> mayDangThue = computerService.getListAreRental();
        List<MayTinh> mayChuaThue = computerService.listNotRental();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/View/home1.jsp");
        request.setAttribute("mayDangThue", mayDangThue);
        request.setAttribute("mayChuaThue", mayChuaThue);
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void listOrderUsed(HttpServletRequest request, HttpServletResponse response) {
        int idMay = Integer.parseInt(request.getParameter("id"));
        int idSuDung = computerService.getIdSuDung(idMay);
        System.out.println("helloo" + idSuDung + " heloo " + idMay);

        List<SuDungChiTiet> listUsed = iDichVuService.getListUsed(idSuDung);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("View/dichVuDaDung.jsp");
        request.setAttribute("listUsed", listUsed);
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    private void orderFood(HttpServletRequest request, HttpServletResponse response) {
        int idMay = Integer.parseInt(request.getParameter("id"));
        int idSuDung = computerService.getIdSuDung(idMay);
        List<DichVuDiKem> dichVuList = iDichVuService.getListDichVu();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/View/home1.jsp");
        request.setAttribute("idSuDung", idSuDung);
        request.setAttribute("idMay", idMay);
        request.setAttribute("dichVuList", dichVuList);
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "listOrder":
                listOrder(request, response);
                break;
        }
    }

    private void listOrder(HttpServletRequest request, HttpServletResponse response) {
        List<DichVuDiKem> list = iDichVuService.getListDichVu();
        int idMay = Integer.parseInt(request.getParameter("idMay"));
        int idSuDung = computerService.getIdSuDung(idMay);
        System.out.println(idSuDung);

        for (DichVuDiKem dichVuDiKem : list) {
            int quantity = Integer.parseInt(request.getParameter("quantity" + dichVuDiKem.getMaLoaiDichVu()));
            if (quantity != 0) {
                iDichVuService.addUsingDetail(dichVuDiKem.getMaDichVuDiKem(), idSuDung, quantity);
            }
        }
        try {
            response.sendRedirect("home-servlet");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }


    }


}