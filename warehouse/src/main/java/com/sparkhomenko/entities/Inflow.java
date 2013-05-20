package com.sparkhomenko.entities;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Digits;
import javax.validation.constraints.NotNull;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * Represents the database inflows table
 */
@Entity
@Table(name="inflows")
public class Inflow implements Serializable {
    private static final long serialVersionUID = 1L;
    
    @GeneratedValue(strategy=GenerationType.AUTO, generator="inflows_generator")
    @Id
    @SequenceGenerator(name="inflows_generator", sequenceName="INFLOWS_SEQ")
    @Column(name="id", unique=true, nullable=false, precision = 9, scale = 0)
    private Long id;
    
    @NotNull
    @ManyToOne(targetEntity=Product.class)
    @JoinColumn(name="product")
    private Product product;
    
    @NotNull
    @Column(name="amount")
    private Integer amount;
    
    @Digits(integer=9, fraction=2)
    @DecimalMin("0.00")
    @Column(name="price")
    private BigDecimal price;
    
    @NotNull
    @ManyToOne(targetEntity=Shipper.class)
    @JoinColumn(name="shipper")
    private Shipper shipper;
    
    @NotNull
    @ManyToOne(targetEntity=Warehouse.class)
    @JoinColumn(name="warehouse")
    private Warehouse warehouse;
    
    @NotNull
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @Column(name="inflowdate")
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date inflowdate;
    
    @OneToMany(fetch=FetchType.EAGER, mappedBy="inflow")
    @Fetch(FetchMode.SELECT)
    private Set<Outflow> outflows =
            new HashSet<Outflow>(0);

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Shipper getShipper() {
        return shipper;
    }

    public void setShipper(Shipper shipper) {
        this.shipper = shipper;
    }

    public Warehouse getWarehouse() {
        return warehouse;
    }

    public void setWarehouse(Warehouse warehouse) {
        this.warehouse = warehouse;
    }

    public Date getInflowdate() {
        return inflowdate;
    }

    public void setInflowdate(Date inflowdate) {
        this.inflowdate = inflowdate;
    }

    public Set<Outflow> getOutflows() {
        return outflows;
    }

    public void setOutflows(Set<Outflow> outflows) {
        this.outflows = outflows;
    }
    
    /**
     * Gets the amount of goods which are left
     * in the currently available stock for the current inflow
     * @return amount of goods
     */
    public Integer getLeft() {
        Integer left = amount;
        for (Outflow outflow : outflows) {
            left -= outflow.getAmount();
        }
        return left;
    }
}