package com.sparkhomenko.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles2.TilesConfigurer;
import org.springframework.web.servlet.view.tiles2.TilesView;

/**
 * Spring MVC configuration
 */
@Configuration
@EnableWebMvc
@ComponentScan("com.sparkhomenko.controllers")
public class DispatcherConfig extends WebMvcConfigurerAdapter {
    
    /**
     * Stores registrations of resource handlers
     * for serving static resources
     * @param registry resource handler registry object
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
    }
    
    /**
     * Allowes direct resolution of symbolic view names to URLs,
     * without explicit mapping definition;
     * it uses apache tiles as a view class
     * @return view resolver object
     */
    @Bean
    UrlBasedViewResolver viewResolver() {
        UrlBasedViewResolver resolver = new UrlBasedViewResolver();
        resolver.setViewClass(TilesView.class);
        return resolver;
    }
    
    /**
     * Defines tiles configuration files
     * @return tiles configurer object
     */
    @Bean
    TilesConfigurer tilesConfigurer() {
        TilesConfigurer configurer = new TilesConfigurer();
        String[] definitions = new String[] {
            "/WEB-INF/tiles/main.xml",
            "/WEB-INF/tiles/warehouses.xml",
            "/WEB-INF/tiles/shippers.xml",
            "/WEB-INF/tiles/customers.xml",
            "/WEB-INF/tiles/goods.xml",
            "/WEB-INF/tiles/inflows.xml",
            "/WEB-INF/tiles/outflows.xml",
            "/WEB-INF/tiles/stock.xml",
            "/WEB-INF/tiles/remains.xml"
        };
        configurer.setDefinitions(definitions);
        return configurer;
    }
    
}