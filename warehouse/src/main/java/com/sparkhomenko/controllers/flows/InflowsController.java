package com.sparkhomenko.controllers.flows;

import com.sparkhomenko.controllers.AbstractController;
import com.sparkhomenko.database.flows.def.InflowsData;
import com.sparkhomenko.database.general.def.GoodsData;
import com.sparkhomenko.database.general.def.ShippersData;
import com.sparkhomenko.database.general.def.WarehousesData;
import com.sparkhomenko.entities.Inflow;
import com.sparkhomenko.entities.Product;
import com.sparkhomenko.entities.Shipper;
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
 * Provides methods which transfer inflows data
 * to the corresponding jsp view pages
 * and handle user's actions
 * 
 * Inflow is an action of storing goods
 * into the warehouse by shipper
 */
@Controller
@RequestMapping(value = "/inflows")
public class InflowsController extends AbstractController {
    
    @Autowired
    InflowsData inflowsData;
    
    @Autowired
    GoodsData goodsData;
    
    @Autowired
    ShippersData shippersData;
    
    @Autowired
    WarehousesData warehousesData;
    
    List<Product> goods;
    List<Shipper> shippers;
    List<Warehouse> warehouses;
    
    /**
     * Gets inflows and renders them
     * @param model map collection of parameters which can be used in the jsp file
     * @return name which will be resolved into the jsp page using
     * apache tiles configuration in the inflows.xml file
     */
    @RequestMapping(method = RequestMethod.GET)
    public String showInflows(ModelMap model) {
        List<Inflow> inflows = inflowsData.get();
        model.addAttribute("inflows", inflows);
        return "inflows";
    }
    
    /**
     * Shows the form for the new product creation routine;
     * data about currently available goods, shippers and warehouses
     * is provided for the user to choose
     * @param model model map collection of parameters which can be used in the jsp file
     * @return name which will be resolved into the jsp page using
     * apache tiles configuration in the inflows.xml file
     */
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String showInflowForm(ModelMap model) {
        Inflow inflow = new Inflow();
        goods = goodsData.get();
        shippers = shippersData.get();
        warehouses = warehousesData.get();
        model.addAttribute(inflow);
        model.addAttribute("goods", goods);
        model.addAttribute("shippers", shippers);
        model.addAttribute("warehouses", warehouses);
        return "inflow";
    }
    
    /**
     * Handles the submit action for a new inflow
     * @param inflow object with all product input information
     * @param result validation information about the current action
     * @param model model map collection of parameters which can be used in the jsp file
     * @return name which will be resolved into the jsp page using
     * apache tiles configuration in the inflows.xml file
     */
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String createCustomer(@Valid Inflow inflow, BindingResult result, ModelMap model) {
        if (result.hasErrors()) {
            model.addAttribute("goods", goods);
            model.addAttribute("shippers", shippers);
            model.addAttribute("warehouses", warehouses);
            return "inflow";
        } else {
            inflowsData.add(inflow);
            return "redirect:/inflows";
        }
    }
    
}