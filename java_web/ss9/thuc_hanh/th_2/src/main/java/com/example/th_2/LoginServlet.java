package com.example.th_2;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginServlet", value = "/login-servlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String username = request.getParameter("username");
    String password = request.getParameter("password");
        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        if("admin".equals(username) && password.equals("admin")){
            writer.println("<h1>WellCome " + username + " To Website </h1>");
        }else {
            writer.println("<h1> Login Error </h1>");
        }
        writer.println("</html>");
    }
}
