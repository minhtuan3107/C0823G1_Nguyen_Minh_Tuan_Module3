package com.example.baitap_1.model;

public class Customer {
    private String name;
    private String date;
    private String address;
    private String pic;

    public Customer(String name, String date, String address, String pic) {
        this.name = name;
        this.date = date;
        this.address = address;
        this.pic = pic;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }
}
