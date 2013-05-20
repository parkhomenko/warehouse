package com.sparkhomenko.controllers.general;

import com.sparkhomenko.controllers.AbstractController;
import com.sparkhomenko.database.general.def.WarehousesData;
import com.sparkhomenko.entities.Warehouse;
import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Provides methods which transfer warehouses data
 * to the corresponding jsp view pages
 * and handle user's actions
 */
@Controller
@RequestMapping(value = "/warehouses")
public class WarehousesController extends AbstractController {
    
    @Autowired
    WarehousesData warehousesData;
    
    /**
     * Gets warehouses and renders them
     * @param model map collection of parameters which can be used in the jsp file
     * @return name which will be resolved into the jsp page using
     * apache tiles configuration in the warehouses.xml file
     */
    @RequestMapping(method = RequestMethod.GET)
    public String showWarehouses(ModelMap model) {
        List<Warehouse> warehouses = warehousesData.get();
        model.addAttribute("warehouses", warehouses);
        return "warehouses";
    }
    
    /**
     * Shows the form for the new warehouse creation routine
     * @param model model map collection of parameters which can be used in the jsp file
     * @return name which will be resolved into the jsp page using
     * apache tiles configuration in the warehouses.xml file
     */
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String showWarehouseForm(ModelMap model) {
        Warehouse warehouse = new Warehouse();
        model.addAttribute(warehouse);
        return "warehouse";
    }
    
    /**
     * Handles the submit action for a new warehouse
     * @param warehouse object with all product input information
     * @param result validation information about the current action
     * @return name which will be resolved into the jsp page using
     * apache tiles configuration in the warehouses.xml file
     */
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String createWarehouse(@Valid Warehouse warehouse, BindingResult result) {
        if (result.hasErrors()) {
            return "warehouse";
        } else {
            warehousesData.add(warehouse);
            return "redirect:/warehouses";
        }
    }
    
}