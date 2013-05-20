package com.sparkhomenko.database.general.impl;

import com.sparkhomenko.database.general.def.GoodsData;
import com.sparkhomenko.entities.Product;
import java.util.List;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 * Provides methods which retrieve goods data
 * from the database
 */
@Repository
@Transactional(rollbackFor=Exception.class)
public class GoodsDataImpl implements GoodsData {

    @Autowired
    SessionFactory sessionFactory;
    
    /**
     * Gets goods from the database
     * ordered by name
     * @return list of goods
     */
    public List<Product> get() {
        return sessionFactory.getCurrentSession()
                .createCriteria(Product.class)
                .addOrder(Order.asc("name"))
                .list();
    }

    /**
     * Stores a product into the database
     * @param product object that needs to be saved
     */
    public void add(Product product) {
        sessionFactory.getCurrentSession()
                .save(product);
    }
    
}