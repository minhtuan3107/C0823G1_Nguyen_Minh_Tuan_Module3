package com.example.du_an.controller;

import com.example.du_an.model.MayTinh;
import com.example.du_an.service.MayTinhService;
import com.example.du_an.service.impl.IMayTinhService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "MayTinhServlet", value = "/may-tinh-servlet")
public class MayTinhServlet extends HttpServlet {
    private IMayTinhService mayTinhService = new MayTinhService();

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
                showListMayTinh(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void showListMayTinh(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("lis1");
        List<MayTinh> mayTinhList = mayTinhService.getListMayTinh();

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
        request.setAttribute("mayTinhList", mayTinhList);
        for (MayTinh mayTinh :  mayTinhList){
            System.out.println(mayTinh);
        }
        requestDispatcher.forward(request, response);
    }
}
