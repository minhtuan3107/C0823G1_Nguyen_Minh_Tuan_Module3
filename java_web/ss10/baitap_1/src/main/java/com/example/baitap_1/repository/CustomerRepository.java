package com.example.baitap_1.repository;

import com.example.baitap_1.model.Customer;

import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository{
    private static List<Customer>customerList = new ArrayList<>();
    static {
        customerList.add(new Customer("Tuan","31-07-2005","Đà Nẵng","https://images2.thanhnien.vn/Uploaded/phucndh/2023_01_15/z4040523388756-c00d06cee10967450c92ab5ef4b703af-8795.jpg"));
        customerList.add(new Customer("Độ","31-07-2005","Đà Nẵng","https://images2.thanhnien.vn/Uploaded/phucndh/2023_01_15/z4040523388756-c00d06cee10967450c92ab5ef4b703af-8795.jpg"));
        customerList.add(new Customer("Toại","31-07-2005","Đà Nẵng","https://images2.thanhnien.vn/Uploaded/phucndh/2023_01_15/z4040523388756-c00d06cee10967450c92ab5ef4b703af-8795.jpg"));
    }
    @Override
    public List<Customer> getList() {
        return customerList;
    }
}
