package com.sparkhomenko.database.flows.impl;

import com.sparkhomenko.database.flows.def.InflowsData;
import com.sparkhomenko.entities.Inflow;
import java.util.List;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 * Provides methods which retrieve inflows data
 * from the database
 */
@Repository
@Transactional(rollbackFor=Exception.class)
public class InflowsDataImpl implements InflowsData {

    @Autowired
    SessionFactory sessionFactory;
    
    /**
     * Gets inflows from the database
     * ordered by the product name
     * @return list of inflows
     */
    public List<Inflow> get() {
        return sessionFactory.getCurrentSession()
                .createCriteria(Inflow.class)
                .createAlias("product", "p")
                .addOrder(Order.asc("p.name"))
                .list();
    }

    /**
     * Stores an inflow into the database
     * @param inflow object that needs to be saved
     */
    public void add(Inflow inflow) {
        sessionFactory.getCurrentSession()
                .save(inflow);
    }

    /**
     * Get an inflow by its identifier
     * @param id identifier of the inflow
     * @return inflow object
     */
    public Inflow get(Long id) {
        return (Inflow)sessionFactory.getCurrentSession()
                .get(Inflow.class, id);
    }
    
}