package com.example.java_web.controller;

import com.example.java_web.model.Student;
import com.example.java_web.service.IStudentService;
import com.example.java_web.service.StudentService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "StudentServlet", value ={"","/student-servlet", "/student"})
public class StudentServlet extends HttpServlet {
    private IStudentService iStudentService = new StudentService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action){
            case "create":
                showFormCreate(request,response);
                break;
            default:
                showListStudent(request, response);
        }

    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("/create_student.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showListStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Student> list = iStudentService.showListStudent();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/result.jsp");
        request.setAttribute("list", list);
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action){
            case "create":
                addNewStudent(request,response);
                break;
        }
    }

    private void addNewStudent(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        boolean gender = request.getParameter("gender").equals("male");
        double point = Double.parseDouble(request.getParameter("point"));
        iStudentService.addNewStudent(new Student(id,name,gender,point));
        try {
            response.sendRedirect("/student-servlet");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
