package com.example.th_4;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "TranslateServlet", value = "/translate-servlet")
public class TranslateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String,String> stringStringMap = new HashMap<>();
        stringStringMap.put("Hello","Xin Chào");
        stringStringMap.put("How","The nao");
        stringStringMap.put("Book","Quyen Vo");
        stringStringMap.put("Computer","May Tinh");
        String search = request.getParameter("search");
        String result = "Không tìm thấy";
        for (Map.Entry<String,String> stringEntry : stringStringMap.entrySet()){
            if(stringEntry.getKey().equalsIgnoreCase(search)){
                result = stringEntry.getValue();
            }
        }
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
        request.setAttribute("result",result);
        requestDispatcher.forward(request,response);
    }
}
