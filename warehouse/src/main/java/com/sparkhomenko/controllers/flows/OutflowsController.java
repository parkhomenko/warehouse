package com.sparkhomenko.controllers.flows;

import com.sparkhomenko.controllers.AbstractController;
import com.sparkhomenko.database.flows.def.OutflowsData;
import com.sparkhomenko.entities.Outflow;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Provides methods which transfer outflows data
 * to the corresponding jsp view pages
 * 
 * Outflow is an action of selling goods
 * from the warehouse to some customer
 */
@Controller
@RequestMapping(value = "/outflows")
public class OutflowsController extends AbstractController {
    
    @Autowired
    OutflowsData outflowsData;
    
    /**
     * Gets outflows and renders them
     * @param model map collection of parameters which can be used in the jsp file
     * @return name which will be resolved into the jsp page using
     * apache tiles configuration in the outflows.xml file
     */
    @RequestMapping(method = RequestMethod.GET)
    public String showOutflows(ModelMap model) {
        List<Outflow> outflows = outflowsData.get();
        model.addAttribute("outflows", outflows);
        return "outflows";
    }
    
}