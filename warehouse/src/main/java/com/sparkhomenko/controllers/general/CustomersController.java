package com.sparkhomenko.controllers.general;

import com.sparkhomenko.controllers.AbstractController;
import com.sparkhomenko.database.general.def.CustomersData;
import com.sparkhomenko.entities.Customer;
import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Provides methods which transfer customers data
 * to the corresponding jsp view pages
 * and handle user's actions
 */
@Controller
@RequestMapping(value = "/customers")
public class CustomersController extends AbstractController {
    
    @Autowired
    CustomersData customersData;
    
    /**
     * Gets customers and renders them
     * @param model map collection of parameters which can be used in the jsp file
     * @return name which will be resolved into the jsp page using
     * apache tiles configuration in the customers.xml file
     */
    @RequestMapping(method = RequestMethod.GET)
    public String showCustomers(ModelMap model) {
        List<Customer> customers = customersData.get();
        model.addAttribute("customers", customers);
        return "customers";
    }
    
    /**
     * Shows the form for the new customer creation routine
     * @param model model map collection of parameters which can be used in the jsp file
     * @return name which will be resolved into the jsp page using
     * apache tiles configuration in the customers.xml file
     */
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String showCustomersForm(ModelMap model) {
        Customer customer = new Customer();
        model.addAttribute(customer);
        return "customer";
    }
    
    /**
     * Handles the submit action for a new customer
     * @param customer object with all customer input information
     * @param result validation information about the current action
     * @return name which will be resolved into the jsp page using
     * apache tiles configuration in the customers.xml file
     */
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String createCustomer(@Valid Customer customer, BindingResult result) {
        if (result.hasErrors()) {
            return "customer";
        } else {
            customersData.add(customer);
            return "redirect:/customers";
        }
    }
    
}