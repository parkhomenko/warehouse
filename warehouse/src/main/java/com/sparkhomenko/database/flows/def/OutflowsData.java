package com.sparkhomenko.database.flows.def;

import com.sparkhomenko.entities.Outflow;
import java.util.List;

public interface OutflowsData {
    
    public List<Outflow> get();
    public void add(Outflow outflow);
    
}