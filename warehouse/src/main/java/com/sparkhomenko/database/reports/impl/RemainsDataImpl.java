package com.sparkhomenko.database.reports.impl;

import com.sparkhomenko.database.reports.def.RemainsData;
import com.sparkhomenko.entities.Inflow;
import java.util.List;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 * Provides methods which retrieve inflow data
 * from the database in the way needed
 * to form the current stock remains
 */
@Repository
@Transactional(rollbackFor=Exception.class)
public class RemainsDataImpl implements RemainsData {
    
    @Autowired
    SessionFactory sessionFactory;

    /**
     * Gets inflows from the database
     * ordered by the product name
     * and by the warehouse name
     * @return list of inflows
     */
    public List<Inflow> get() {
        return sessionFactory.getCurrentSession()
                .createCriteria(Inflow.class)
                .createAlias("product", "p")
                .createAlias("warehouse", "w")
                .addOrder(Order.asc("p.name"))
                .addOrder(Order.asc("w.name"))
                .list();
    }
    
}