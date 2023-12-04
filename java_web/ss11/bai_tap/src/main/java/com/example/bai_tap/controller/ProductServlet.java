package com.example.bai_tap.controller;

import com.example.bai_tap.model.Product;
import com.example.bai_tap.service.IProductService;
import com.example.bai_tap.service.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/product-servlet")
public class ProductServlet extends HttpServlet {
    private IProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                showFormAdd(request, response);
                break;
            case "edit":
                showFormEdit(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                    break;
            case "search":
                showFormSearch(request, response);
                break;
            default:
                displayCustomer(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                addNewProduct(request, response);
                break;
            case "edit":
                editProduct(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            case "search":
                searchProduct(request, response);
                break;
        }
    }

    protected void displayCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = productService.getList();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
        request.setAttribute("productList", productList);
        requestDispatcher.forward(request, response);
    }

    protected void showFormSearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.getRequestDispatcher("/form_search_product.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void showFormAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.getRequestDispatcher("/create_product.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        productService.remove(id);
        try {
            response.sendRedirect("/product-servlet");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void editProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String nameEdit = request.getParameter("name");
        int priceEdit = Integer.parseInt(request.getParameter("price"));
        String desEdit = request.getParameter("des");
        String manufactureEdit = request.getParameter("manufacture");
        List<Product> productList = productService.getList();
        Product productEdit = new Product(nameEdit, priceEdit, desEdit, manufactureEdit);
        for (Product product : productList) {
            if (product.getId() == id) {
                productService.edit(id, productEdit);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
                request.setAttribute("productList", productList);
                requestDispatcher.forward(request, response);
                break;
            }
        }
    }


    protected void showFormEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        List<Product> productList = productService.getList();
        RequestDispatcher requestDispatcher;
        for (Product product : productList) {
            if (product.getId() == id) {
                requestDispatcher = request.getRequestDispatcher("/edit_product.jsp");
                request.setAttribute("product", product);
                requestDispatcher.forward(request, response);
                break;
            }
        }
    }

    protected void searchProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList1 = productService.getList();
        List<Product> productList = new ArrayList<>();
        String name = request.getParameter("name");
        for (Product product : productList1) {
            if (product.getName().contains(name)) {
                productList.add(product);
            }
        }
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
        request.setAttribute("productList", productList);
        requestDispatcher.forward(request, response);
    }

    protected void addNewProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
        String des = request.getParameter("des");
        String manufacture = request.getParameter("manufacture");
        Product product = new Product(id, name, price, des, manufacture);
        productService.add(product);
        try {
            response.sendRedirect("/product-servlet");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}