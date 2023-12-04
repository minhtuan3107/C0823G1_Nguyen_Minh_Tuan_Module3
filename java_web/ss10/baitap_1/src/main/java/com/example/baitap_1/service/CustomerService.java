package com.example.baitap_1.service;

import com.example.baitap_1.model.Customer;
import com.example.baitap_1.repository.CustomerRepository;
import com.example.baitap_1.repository.ICustomerRepository;

import java.util.List;

public class CustomerService implements ICustomerService {
    private ICustomerRepository customerRepository = new CustomerRepository();

    @Override
    public List<Customer> getList() {
        return customerRepository.getList();
    }
}
