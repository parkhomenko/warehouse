package com.sparkhomenko.database.general.impl;

import com.sparkhomenko.database.general.def.ShippersData;
import com.sparkhomenko.entities.Shipper;
import java.util.List;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 * Provides methods which retrieve shippers data
 * from the database
 */
@Repository
@Transactional(rollbackFor=Exception.class)
public class ShippersDataImpl implements ShippersData {
    
    @Autowired
    SessionFactory sessionFactory;

    /**
     * Gets shippers from the database
     * ordered by name
     * @return list of shippers
     */
    public List<Shipper> get() {
        return sessionFactory.getCurrentSession()
                .createCriteria(Shipper.class)
                .addOrder(Order.asc("name"))
                .list();
    }

    /**
     * Stores a shipper into the database
     * @param shipper object that needs to be saved
     */
    public void add(Shipper shipper) {
        sessionFactory.getCurrentSession()
                .save(shipper);
    }
    
}