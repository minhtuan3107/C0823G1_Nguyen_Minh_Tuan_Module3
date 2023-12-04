package com.example.bai_tap.service;

import com.example.bai_tap.model.Product;
import com.example.bai_tap.repository.IProductRepository;
import com.example.bai_tap.repository.ProductRepository;

import java.util.List;

public class ProductService implements IProductService{
    private IProductRepository productRepository = new ProductRepository();
    @Override
    public List<Product> getList() {
        return productRepository.getList();
    }

    @Override
    public void add(Product product) {
        productRepository.add(product);
    }

    @Override
    public void remove(int id) {
        productRepository.remove(id);
    }

    @Override
    public void edit(int id, Product product) {
        productRepository.edit(id,product);
    }

    @Override
    public List<Product> search(String name) {
        return productRepository.search(name);
    }
}
