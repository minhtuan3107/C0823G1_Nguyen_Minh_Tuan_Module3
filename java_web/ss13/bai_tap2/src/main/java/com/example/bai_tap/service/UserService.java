package com.example.bai_tap.service;

import com.example.bai_tap.model.User;
import com.example.bai_tap.repository.IUserRepository;
import com.example.bai_tap.repository.UserRepository;

import java.util.List;

public class UserService implements IUSerService {
    private final IUserRepository userRepository = new UserRepository();

    @Override
    public List<User> getListUser() {
        return userRepository.getListUser();
    }

    @Override
    public void addUser(User user) {
        userRepository.addUser(user);
    }

    @Override
    public void editUser(User user) {
        userRepository.editUser(user);
    }

    @Override
    public void deleteUser(int id) {
        userRepository.deleteUser(id);
    }

    @Override
    public User findUser(int id) {
        return userRepository.findUser(id);
    }

    @Override
    public List<User> searchByCountry(String country) {
        return userRepository.searchByCountry(country);
    }

    @Override
    public List<User> sortByName() {
        return userRepository.sortByName();
    }

    @Override
    public void addUserTransaction(User user) {
        userRepository.addUserTransaction(user);
    }
}
