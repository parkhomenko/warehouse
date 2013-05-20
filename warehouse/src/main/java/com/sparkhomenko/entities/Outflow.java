package com.sparkhomenko.entities;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.validation.constraints.NotNull;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * Represents the database outflows table
 */
@Entity
@Table(name="outflows")
public class Outflow implements Serializable {
    private static final long serialVersionUID = 1L;
    
    @GeneratedValue(strategy=GenerationType.AUTO, generator="outflows_generator")
    @Id
    @SequenceGenerator(name="outflows_generator", sequenceName="OUTFLOWS_SEQ")
    @Column(name="id", unique=true, nullable=false, precision = 9, scale = 0)
    private Long id;
    
    @NotNull
    @ManyToOne(targetEntity=Inflow.class)
    @JoinColumn(name="inflow")
    private Inflow inflow;
    
    @NotNull
    @ManyToOne(targetEntity=Customer.class)
    @JoinColumn(name="customer")
    private Customer customer;
    
    @NotNull
    @Column(name="amount")
    private Integer amount;
    
    @NotNull
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @Column(name="outflowdate")
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date outflowdate;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Inflow getInflow() {
        return inflow;
    }

    public void setInflow(Inflow inflow) {
        this.inflow = inflow;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public Date getOutflowdate() {
        return outflowdate;
    }

    public void setOutflowdate(Date outflowdate) {
        this.outflowdate = outflowdate;
    }
}