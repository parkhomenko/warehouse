package com.sparkhomenko.database.general.def;

import com.sparkhomenko.entities.Warehouse;
import java.util.List;

public interface WarehousesData {
    
    public List<Warehouse> get();
    public void add(Warehouse warehouse);
    
}