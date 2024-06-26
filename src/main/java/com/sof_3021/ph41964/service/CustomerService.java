package com.sof_3021.ph41964.service;

import com.sof_3021.ph41964.entity.Customer;
import com.sof_3021.ph41964.entity.Size;
import org.springframework.data.domain.Page;

import java.util.List;

public interface CustomerService {
    List<Customer> getAll();

    Customer getById(int id);

    void create(Customer customer);

    void update(Customer customer);

    void remove(int id);

    List<Customer> getAllActive();

    List<Customer> search(String search);

    Page<Customer> getByPageActive(Integer page);

    Page<Customer> search(Integer page, String search);
}
