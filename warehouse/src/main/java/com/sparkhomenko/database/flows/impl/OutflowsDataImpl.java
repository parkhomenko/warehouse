package com.sparkhomenko.database.flows.impl;

import com.sparkhomenko.database.flows.def.OutflowsData;
import com.sparkhomenko.entities.Outflow;
import java.util.List;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 * Provides methods which retrieve outflows data
 * from the database
 */
@Repository
@Transactional(rollbackFor=Exception.class)
public class OutflowsDataImpl implements OutflowsData {

    @Autowired
    SessionFactory sessionFactory;
    
    /**
     * Gets outflows data from the database
     * ordered by selling date
     * @return list of outflows
     */
    public List<Outflow> get() {
        return sessionFactory.getCurrentSession()
                .createCriteria(Outflow.class)
                .addOrder(Order.desc("outflowdate"))
                .list();
    }

    /**
     * Stores an outflow into the database
     * @param outflow object that needs to be saved
     */
    public void add(Outflow outflow) {
        sessionFactory.getCurrentSession()
                .save(outflow);
    }
    
}