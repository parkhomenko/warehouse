package com.sparkhomenko.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * The entry point controller
 */
@Controller
public class HomeController extends AbstractController {
    
    /**
     * Shows the home page
     * @return name which will be resolved into the jsp page using
     * apache tiles configuration in the main.xml file
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String showHome() {
        return "home";
    }
}