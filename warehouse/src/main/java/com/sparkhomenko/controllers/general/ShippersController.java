package com.sparkhomenko.controllers.general;

import com.sparkhomenko.controllers.AbstractController;
import com.sparkhomenko.database.general.def.ShippersData;
import com.sparkhomenko.entities.Shipper;
import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Provides methods which transfer shippers data
 * to the corresponding jsp view pages
 * and handle user's actions
 */
@Controller
@RequestMapping(value = "/shippers")
public class ShippersController extends AbstractController {
    
    @Autowired
    ShippersData shippersData;
    
    /**
     * Gets shippers and renders them
     * @param model map collection of parameters which can be used in the jsp file
     * @return name which will be resolved into the jsp page using
     * apache tiles configuration in the shippers.xml file
     */
    @RequestMapping(method = RequestMethod.GET)
    public String showShippers(ModelMap model) {
        List<Shipper> shippers = shippersData.get();
        model.addAttribute("shippers", shippers);
        return "shippers";
    }
    
    /**
     * Shows the form for the new shipper creation routine
     * @param model model map collection of parameters which can be used in the jsp file
     * @return name which will be resolved into the jsp page using
     * apache tiles configuration in the shippers.xml file
     */
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String showShipperForm(ModelMap model) {
        Shipper shipper = new Shipper();
        model.addAttribute(shipper);
        return "shipper";
    }
    
    /**
     * Handles the submit action for a new shipper
     * @param shipper object with all product input information
     * @param result validation information about the current action
     * @return name which will be resolved into the jsp page using
     * apache tiles configuration in the shippers.xml file
     */
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String createShipper(@Valid Shipper shipper, BindingResult result) {
        if (result.hasErrors()) {
            return "shipper";
        } else {
            shippersData.add(shipper);
            return "redirect:/shippers";
        }
    }
    
}