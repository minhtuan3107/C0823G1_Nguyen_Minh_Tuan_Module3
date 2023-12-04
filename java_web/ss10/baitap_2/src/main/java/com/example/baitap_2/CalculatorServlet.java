package com.example.baitap_2;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", value = "/calculator-servlet")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double firstNumber = Double.parseDouble(request.getParameter("firstNumber"));
        double secondNumber = Double.parseDouble(request.getParameter("secondNumber"));
        double result = 0;
        String text = "";
        String check = request.getParameter("operator");
        switch (check) {
            case "add":
                result = firstNumber + secondNumber;
                text += result;
                break;
            case "apartFrom":
                result = firstNumber - secondNumber;
                text += result;
                break;
            case "core":
                result = firstNumber * secondNumber;
                text += result;
                break;
            case "divide":
                if (secondNumber == 0) {
                    text += "Lỗi chia cho 0";
                } else {
                    result = firstNumber / secondNumber;
                }
                break;
        }
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
        request.setAttribute("text", text);
        requestDispatcher.forward(request, response);
    }
}
