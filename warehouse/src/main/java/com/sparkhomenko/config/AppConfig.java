package com.sparkhomenko.config;

import java.io.IOException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * Application configuration file
 */
@Configuration
@EnableTransactionManagement
@ComponentScan("com.sparkhomenko.database")
@Import(DispatcherConfig.class)
public class AppConfig {
    
    /**
     * Database connection settings
     * @return data source object
     */
    @Bean
    DriverManagerDataSource dataSource() {
        DriverManagerDataSource source = new DriverManagerDataSource();
        source.setDriverClassName("oracle.jdbc.driver.OracleDriver");
        source.setUrl("jdbc:oracle:thin:test@127.0.0.1:1521/XE");
        source.setUsername("test");
        source.setPassword("qazqazqaz");
        return source;
    }
    
    /**
     * Hibernate session settings
     * @return session factory object
     */
    @Bean
    SessionFactory sessionFactory() {
        LocalSessionFactoryBean factory = new LocalSessionFactoryBean();
        
        Properties properties = new Properties();
        properties.setProperty("hibernate.show_sql", "true");
        properties.setProperty("hibernate.dialect", "org.hibernate.dialect.Oracle10gDialect");
        properties.setProperty("hibernate.connection.charSet", "UTF-8");
        properties.setProperty("hibernate.jdbc.batch_size", "20");
        
        factory.setDataSource(dataSource());
        factory.setPackagesToScan("com/sparkhomenko/entities/**");
        factory.setHibernateProperties(properties);
        
        try {
            factory.afterPropertiesSet();
        } catch (IOException ex) {
            Logger.getLogger(AppConfig.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return factory.getObject();
    }
    
    /**
     * Creates hibernate transaction management system
     * @return transaction manager object
     */
    @Bean
    HibernateTransactionManager transactionManager() {
        HibernateTransactionManager manager = new HibernateTransactionManager();
        manager.setSessionFactory(sessionFactory());
        return manager;
    }
    
}