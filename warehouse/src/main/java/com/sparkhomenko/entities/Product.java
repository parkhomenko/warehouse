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
 * Represents the database goods table
 */
@Entity
@Table(name="goods")
public class Product implements Serializable {
    private static final long serialVersionUID = 1L;
    
    @GeneratedValue(strategy=GenerationType.AUTO, generator="goods_generator")
    @Id
    @SequenceGenerator(name="goods_generator", sequenceName="GOODS_SEQ")
    @Column(name="id", unique=true, nullable=false, precision = 9, scale = 0)
    private Long id;
    
    @NotEmpty
    @Size(min=1, max=45)
    @Column(name="name")
    private String name;
    
    @NotEmpty
    @Size(min=1, max=20)
    @Column(name="units")
    private String units;

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

    public String getUnits() {
        return units;
    }

    public void setUnits(String units) {
        this.units = units;
    }
}