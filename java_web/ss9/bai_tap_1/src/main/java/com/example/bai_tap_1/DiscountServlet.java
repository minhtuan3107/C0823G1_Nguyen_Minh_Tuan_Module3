package com.example.bai_tap_1;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DiscountServlet", value = "/discount-servlet")
public class DiscountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String des = request.getParameter("des");
    double price = Double.parseDouble(request.getParameter("price"));
    double percent = Double.parseDouble(request.getParameter("percent"));
    double amount = price * percent * 0.01;
    double money = price - amount;
    RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
    request.setAttribute("amount", amount);
    request.setAttribute("money", money);
    requestDispatcher.forward(request,response);
    }
}
