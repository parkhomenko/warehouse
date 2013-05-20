package com.sparkhomenko.database.general.impl;

import com.sparkhomenko.database.general.def.WarehousesData;
import com.sparkhomenko.entities.Warehouse;
import java.util.List;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 * Provides methods which retrieve warehouses data
 * from the database
 */
@Repository
@Transactional(rollbackFor=Exception.class)
public class WarehousesDataImpl implements WarehousesData {
    
    @Autowired
    SessionFactory sessionFactory;

    /**
     * Gets warehouses from the database
     * ordered by name
     * @return list of warehouses
     */
    public List<Warehouse> get() {
        return sessionFactory.getCurrentSession()
                .createCriteria(Warehouse.class)
                .addOrder(Order.asc("name"))
                .list();
    }

    /**
     * Stores a warehouse into the database
     * @param warehouse object that needs to be saved
     */
    public void add(Warehouse warehouse) {
        sessionFactory.getCurrentSession()
                .save(warehouse);
    }
    
}