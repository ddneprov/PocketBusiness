package com.example.serverPocketBusiness.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "sale_table")
public class Sale {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String products;
    private String amounts;
    private String costs;
    private String costsWithTax;

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date date;
    private Double totalCost;
    private Double totalCostWithTax;

    public Sale(){}

    public Sale(Sale sale){
        this.id = sale.getId();
        this.products = sale.getProducts();
        this.amounts = sale.getAmounts();
        this.date = sale.getDate();
        this.costs = sale.getCosts();
        this.costsWithTax = sale.getCostsWithTax();
        this.totalCost = sale.getTotalCost();
        this.totalCostWithTax = sale.getTotalCostWithTax();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProducts() {
        return products;
    }

    public void setProducts(String products) {
        this.products = products;
    }

    public String getAmounts() {
        return amounts;
    }

    public void setAmounts(String amounts) {
        this.amounts = amounts;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getCosts() {
        return costs;
    }

    public void setCosts(String totalCosts) {
        this.costs = totalCosts;
    }

    public Double getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(Double totalCost) {
        this.totalCost = totalCost;
    }

    public String getCostsWithTax() {
        return costsWithTax;
    }

    public void setCostsWithTax(String costsWithTax) {
        this.costsWithTax = costsWithTax;
    }

    public Double getTotalCostWithTax() {
        return totalCostWithTax;
    }

    public void setTotalCostWithTax(Double totalCostWithTax) {
        this.totalCostWithTax = totalCostWithTax;
    }
}
