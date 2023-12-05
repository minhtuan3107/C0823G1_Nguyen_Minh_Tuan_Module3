package com.example.bai_tap.repository;

import com.example.bai_tap.model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> getList();

    void add(Product product);

    void remove(int id);

    void edit(int id, Product product);

    List<Product> search(String name);

}
