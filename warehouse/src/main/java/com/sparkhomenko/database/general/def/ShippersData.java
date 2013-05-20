package com.sparkhomenko.database.general.def;

import com.sparkhomenko.entities.Shipper;
import java.util.List;


public interface ShippersData {
    
    public List<Shipper> get();
    public void add(Shipper shipper);
    
}