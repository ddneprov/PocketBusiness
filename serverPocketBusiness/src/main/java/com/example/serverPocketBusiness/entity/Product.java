package com.example.serverPocketBusiness.entity;

import javax.persistence.*;
import java.util.Date;


@Entity
@Table(name = "product_table")
public class Product {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String name;
    private Double cost;
    private Integer amount;
    private Date expirationDate;


    public Product(){}

    public Product(Product product){
        this.name = product.getName();
        this.cost = product.getCost();
        this.amount = product.getAmount();
        this.expirationDate = product.getExpirationDate();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getCost() {
        return cost;
    }

    public void setCost(Double cost) {
        this.cost = cost;
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public Date getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(Date expirationDate) {
        this.expirationDate = expirationDate;
    }
}
