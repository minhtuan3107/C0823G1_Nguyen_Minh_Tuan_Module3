package com.example.bai_tap.controller;

import com.example.bai_tap.model.User;
import com.example.bai_tap.service.IUSerService;
import com.example.bai_tap.service.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserServlet", value = "/user-servlet")
public class UserServlet extends HttpServlet {
    private final IUSerService iuSerService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showFormCreate(request, response);
                break;
            case "edit":
                showFormEdit(request, response);
                break;
            case "delete":
                deleteUser(request, response);
                break;
            case "sort":
                showListUserSort(request, response);
                break;
            default:
                showListUser(request, response);
        }
    }

    protected void showFormCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/create_user.jsp").forward(request, response);
    }

    protected void showFormEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = iuSerService.findUser(id);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/edit_user.jsp");
        request.setAttribute("user", user);
        requestDispatcher.forward(request, response);
    }

    protected void showListUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> userList = iuSerService.getListUser();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
        request.setAttribute("userList", userList);
        requestDispatcher.forward(request, response);
    }

    protected void showListUserSort(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> userList = iuSerService.sortByName();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
        request.setAttribute("userList", userList);
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createUser(request, response);
                break;
            case "edit":
                editUser(request, response);
                break;
            case "search":
                searchUser(request, response);
                break;
        }
    }

    protected void searchUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String country = request.getParameter("name");
        List<User> userList = iuSerService.searchByCountry(country);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
        request.setAttribute("userList", userList);
        requestDispatcher.forward(request, response);
    }

    protected void deleteUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        iuSerService.deleteUser(id);
        response.sendRedirect("/user-servlet");
    }

    protected void createUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User user = new User(name, email, country);
        iuSerService.addUser(user);
        response.sendRedirect("/user-servlet");
    }

    protected void editUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        iuSerService.editUser(new User(id, name, email, country));
        response.sendRedirect("/user-servlet");
    }
}