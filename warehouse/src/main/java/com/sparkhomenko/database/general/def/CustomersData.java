package com.sparkhomenko.database.general.def;

import com.sparkhomenko.entities.Customer;
import java.util.List;

public interface CustomersData {
    
    public List<Customer> get();
    public void add(Customer customer);
    
}