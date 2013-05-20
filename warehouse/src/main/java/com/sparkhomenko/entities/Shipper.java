package com.sparkhomenko.entities;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import org.hibernate.validator.constraints.NotEmpty;

/**
 * Represents the database shippers table
 */
@Entity
@Table(name="shippers")
public class Shipper implements Serializable {
    private static final long serialVersionUID = 1L;
    
    @GeneratedValue(strategy=GenerationType.AUTO, generator="shippers_generator")
    @Id
    @SequenceGenerator(name="shippers_generator", sequenceName="SHIPPERS_SEQ")
    @Column(name="id", unique=true, nullable=false, precision = 9, scale = 0)
    private Long id;
    
    @NotEmpty
    @Size(min=1, max=45)
    @Column(name="name")
    private String name;
    
    @NotEmpty
    @Size(min=1, max=45)
    @Column(name="representative")
    private String representative;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRepresentative() {
        return representative;
    }

    public void setRepresentative(String representative) {
        this.representative = representative;
    }
}