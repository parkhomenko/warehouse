package com.sparkhomenko.controllers.reports;

import com.sparkhomenko.controllers.AbstractController;
import com.sparkhomenko.database.general.def.WarehousesData;
import com.sparkhomenko.database.reports.def.RemainsData;
import com.sparkhomenko.entities.Inflow;
import com.sparkhomenko.entities.Warehouse;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Provides methods which transfer inflows data
 * without outflow part, that is the remains data,
 * to the corresponding jsp view page
 * 
 * The jsp page renders cross-table report
 * about currently available goods in all warehouses
 */
@Controller
@RequestMapping(value = "/report")
public class RemainsController extends AbstractController {
    
    @Autowired
    RemainsData remainsData;
    
    @Autowired
    WarehousesData warehousesData;
    
    /**
     * Gets inflows and renders them (without outflows)
     * @param model map collection of parameters which can be used in the jsp file
     * @return name which will be resolved into the jsp page using
     * apache tiles configuration in the remains.xml file
     */
    @RequestMapping(method = RequestMethod.GET)
    public String showRemains(ModelMap model) {
        List<Inflow> inflows = remainsData.get();
        List<Warehouse> warehouses = warehousesData.get();
        model.addAttribute("inflows", inflows);
        model.addAttribute("warehouses", warehouses);
        return "remains";
    }
    
}