package com.example.bai_tap.service;

import com.example.bai_tap.model.User;

import java.util.List;

public interface IUSerService {
    List<User> getListUser();

    void addUser(User user);

    void editUser(User user);

    void deleteUser(int id);

    User findUser(int id);

    List<User> searchByCountry(String country);

    List<User> sortByName();

    void addUserTransaction(User user);
}
