package com.example.duan.controller;

import com.example.duan.model.BangSuDung;
import com.example.duan.model.DichVuDiKem;
import com.example.duan.model.SuDungChiTiet;
import com.example.duan.service.DichVuService;
import com.example.duan.service.MayTinhService;
import com.example.duan.service.impl.IDichVuService;
import com.example.duan.service.impl.IMayTinhService;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "HistoryRentalServlet" , value = "/history-rental-servlet")
public class HistoryRentalServlet extends HttpServlet {
  private IMayTinhService computerService = new MayTinhService();
  private IDichVuService iDichVuService = new DichVuService();

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String action = request.getParameter("action");
    if (action == null) {
      action = "";
    }
    switch (action){
      case "historyRental":
        historyRental(request,response);
        break;
      case "orderUsed":
        orderHistoryUsed(request,response);
        break;
      case "confirmationPayment":
        confirmationPayment(request,response);
        break;
      default:
        historyRental(request,response);

    }


  }

  private void confirmationPayment(HttpServletRequest request, HttpServletResponse response) {
    int idSuDung = Integer.parseInt(request.getParameter("id"));
    computerService.setConfirmationPayment(idSuDung);
    int idMay = Integer.parseInt(request.getParameter("idMay"));
    List<BangSuDung> historyList = computerService.historyRental(idMay);
    RequestDispatcher requestDispatcher = request.getRequestDispatcher("/View/historyRental.jsp");
    request.setAttribute("historyList",historyList);
    request.setAttribute("idMay",idMay);
    try {
      requestDispatcher.forward(request,response);
    } catch (ServletException e) {
      throw new RuntimeException(e);
    } catch (IOException e) {
      throw new RuntimeException(e);
    }


  }

  private void orderHistoryUsed(HttpServletRequest request, HttpServletResponse response) {
    int idSuDung = Integer.parseInt(request.getParameter("id"));
    List<SuDungChiTiet> listUsed = iDichVuService.getListUsed(idSuDung);
    RequestDispatcher requestDispatcher = request.getRequestDispatcher("View/dichVuDaDung.jsp");
    request.setAttribute("listUsed",listUsed);
    try {
      requestDispatcher.forward(request,response);
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
    switch (action){
      case "confirmationPayment":
        confirmationPayment(request,response);
        break;
    }

  }

  private void historyRental(HttpServletRequest request, HttpServletResponse response) {
    int idMay = Integer.parseInt(request.getParameter("id"));
    List<BangSuDung> historyList = computerService.historyRental(idMay);
    RequestDispatcher requestDispatcher = request.getRequestDispatcher("/View/historyRental.jsp");
    request.setAttribute("historyList",historyList);
    request.setAttribute("idMay",idMay);
    try {
      requestDispatcher.forward(request,response);
    } catch (ServletException e) {
      throw new RuntimeException(e);
    } catch (IOException e) {
      throw new RuntimeException(e);
    }


  }
}
