package com.sparkhomenko.config;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;
import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

/**
 * Spring initializer class
 * 
 * Configures the ServletContext programmatically
 * as opposed to the traditional web.xml-based approach
 */
public class WebInitializer implements WebApplicationInitializer {

    /**
     * Configure the given ServletContext with any servlets, filters,
     * listeners context-params and attributes
     * necessary for initializing this web application
     * @param sc the ServletContext to initialize
     * @throws ServletException if any call against the given
     * ServletContext throws a ServletException
     */
    public void onStartup(ServletContext sc) throws ServletException {
        
        AnnotationConfigWebApplicationContext rootContext =
                new AnnotationConfigWebApplicationContext();
        rootContext.register(AppConfig.class);

        sc.addListener(new ContextLoaderListener(rootContext));
        
        ServletRegistration.Dynamic dispatcher =
                sc.addServlet("dispatcher", new DispatcherServlet(rootContext));
        dispatcher.setLoadOnStartup(1);
        dispatcher.addMapping("/");
    }
    
}