package com.example.bai_tap.model;

public class Product {
    private int id;
    private String name;
    private int price;
    private String des;
    private String manufacture;

    public Product(int id, String name, int price, String des, String manufacture) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.des = des;
        this.manufacture = manufacture;
    }

    public Product(String name, int price, String des, String manufacture) {
        this.name = name;
        this.price = price;
        this.des = des;
        this.manufacture = manufacture;
    }

    public Product() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public String getManufacture() {
        return manufacture;
    }

    public void setManufacture(String manufacture) {
        this.manufacture = manufacture;
    }
}
