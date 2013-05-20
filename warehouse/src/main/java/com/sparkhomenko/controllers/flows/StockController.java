package com.sparkhomenko.controllers.flows;

import com.sparkhomenko.controllers.AbstractController;
import com.sparkhomenko.database.flows.def.InflowsData;
import com.sparkhomenko.database.flows.def.OutflowsData;
import com.sparkhomenko.database.general.def.CustomersData;
import com.sparkhomenko.entities.Customer;
import com.sparkhomenko.entities.Inflow;
import com.sparkhomenko.entities.Outflow;
import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Provides methods which transfer stock data
 * to the corresponding jsp view pages
 * and handle user's actions
 * 
 * Stock represents currently available goods
 * in the warehouse
 */
@Controller
@RequestMapping(value = "/stock")
public class StockController extends AbstractController {
    
    public static final String NOSUCHAMOUNT = "There is no such amount in the chosen warehouse";
    
    @Autowired
    InflowsData inflowsData;
    
    @Autowired
    OutflowsData outflowsData;
    
    @Autowired
    CustomersData customersData;
    
    Inflow inflow;
    List<Customer> customers;
    
    /**
     * Gets inflows (with the amount left, i.e. without outflow data) and renders them
     * @param model map collection of parameters which can be used in the jsp file
     * @return name which will be resolved into the jsp page using
     * apache tiles configuration in the stock.xml file
     */
    @RequestMapping(method = RequestMethod.GET)
    public String showInflows(ModelMap model) {
        List<Inflow> inflows = inflowsData.get();
        model.addAttribute("inflows", inflows);
        return "stock";
    }
    
    /**
     * Shows the form for buying currently selected inflow (outflow form)
     * @param inflow_id identifier for the selected inflow
     * @param model model map collection of parameters which can be used in the jsp file
     * @return name which will be resolved into the jsp page using
     * apache tiles configuration in the stock.xml file
     */
    @RequestMapping(value = "/buy/{inflow_id}", method = RequestMethod.GET)
    public String showBuyingForm(@PathVariable("inflow_id") Long inflow_id, ModelMap model) {
        inflow = inflowsData.get(inflow_id);
        Outflow outflow = new Outflow();
        outflow.setInflow(inflow);
        customers = customersData.get();
        model.addAttribute(outflow);
        model.addAttribute("product_name", inflow.getProduct().getName());
        model.addAttribute("customers", customers);
        return "stockbuy";
    }
    
    /**
     * Handles the submit action for a new outflow
     * @param outflow object with all product input information
     * @param result validation information about the current action
     * @param model model map collection of parameters which can be used in the jsp file
     * @return name which will be resolved into the jsp page using
     * apache tiles configuration in the stock.xml file
     */
    @RequestMapping(value = "/buy/{inflow_id}", method = RequestMethod.POST)
    public String buyingProduct(@Valid Outflow outflow, BindingResult result, ModelMap model) {
        if (result.hasErrors()) {
            model.addAttribute("product_name", inflow.getProduct().getName());
            model.addAttribute("customers", customers);
            return "stockbuy";
        } else {
            if (outflow.getAmount() > inflow.getAmount()) {
                result.rejectValue("amount", "", NOSUCHAMOUNT);
                model.addAttribute("product_name", inflow.getProduct().getName());
                model.addAttribute("customers", customers);
                return "stockbuy";
            } else {
                outflowsData.add(outflow);
                return "redirect:/outflows";
            }
        }
    }
    
}