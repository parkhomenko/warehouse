package com.sparkhomenko.database.general.def;

import com.sparkhomenko.entities.Product;
import java.util.List;

public interface GoodsData {
    
    public List<Product> get();
    public void add(Product product);
    
}