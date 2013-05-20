package com.sparkhomenko.database.general.impl;

import com.sparkhomenko.database.general.def.CustomersData;
import com.sparkhomenko.entities.Customer;
import java.util.List;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 * Provides methods which retrieve customers data
 * from the database
 */
@Repository
@Transactional(rollbackFor=Exception.class)
public class CustomersDataImpl implements CustomersData {
    
    @Autowired
    SessionFactory sessionFactory;

    /**
     * Gets customers from the database
     * ordered by name
     * @return list of customers
     */
    public List<Customer> get() {
        return sessionFactory.getCurrentSession()
                .createCriteria(Customer.class)
                .addOrder(Order.asc("name"))
                .list();
    }

    /**
     * Stores a customer into the database
     * @param customer object that needs to be saved
     */
    public void add(Customer customer) {
        sessionFactory.getCurrentSession()
                .save(customer);
    }
    
}