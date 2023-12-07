package com.example.bai_tap.repository;

import com.example.bai_tap.model.User;

import java.util.List;

public interface IUserRepository {
    List<User> getListUser();

    void addUser(User user);

    void editUser(User user);

    void deleteUser(int id);

    User findUser(int id);

    List<User> searchByCountry(String country);

    List<User> sortByName();
}
