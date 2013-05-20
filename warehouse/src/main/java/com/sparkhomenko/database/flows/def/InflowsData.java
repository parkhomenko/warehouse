package com.sparkhomenko.database.flows.def;

import com.sparkhomenko.entities.Inflow;
import java.util.List;

public interface InflowsData {
    
    public List<Inflow> get();
    public void add(Inflow inflow);
    public Inflow get(Long id);
    
}