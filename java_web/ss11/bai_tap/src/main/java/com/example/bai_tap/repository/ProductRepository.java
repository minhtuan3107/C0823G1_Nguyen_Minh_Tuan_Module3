package com.example.bai_tap.repository;

import com.example.bai_tap.model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository{
    private static List<Product>productList = new ArrayList<>();
    static {
        productList.add(new Product(1,"Do an",100000,"Banh mi","Viet Nam"));
        productList.add(new Product(2,"Do uong",100000,"Nuoc","Viet Nam"));
        productList.add(new Product(3,"Dao",100000,"Dao","Viet Nam"));
        productList.add(new Product(4,"Keo",100000,"Keo","Viet Nam"));
        productList.add(new Product(5,"Bua",100000,"Bua","Viet Nam"));
    }
    @Override
    public List<Product> getList() {
        return productList;
    }

    @Override
    public void add(Product product) {
        productList.add(product);
    }

    @Override
    public void remove(int id) {
        for (Product product : productList){
            if(product.getId() == id){
                productList.remove(product);
                break;
            }
        }
    }

    @Override
    public void edit(int id, Product product) {
        for (Product product1: productList){
            if(product1.getId() == id){
                product1.setName(product.getName());
                product1.setPrice(product.getPrice());
                product1.setDes(product.getDes());
                product1.setManufacture(product.getManufacture());
                break;
            }
        }
    }

    @Override
    public List<Product> search(String name) {
        List<Product>products = new ArrayList<>();
        for (Product product:productList){
            if(product.getName().contains(name)){
                products.add(product);
            }
        }
        return products;
    }
}
