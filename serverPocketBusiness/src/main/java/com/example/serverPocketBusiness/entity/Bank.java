package com.example.serverPocketBusiness.entity;


import javax.persistence.*;

@Entity
@Table(name = "bank_table")
public class Bank {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private Double moneyRemaining;
    private Double products;
    private Double debtsToUs;
    private Double debtsOur;
    private Double cleanMoney;

    public Bank(){}

    public Bank(Double moneyRemaining, Double products, Double debtsToUs, Double debtsOur, Double cleanMoney){
        this.moneyRemaining = moneyRemaining;
        this.products = products;
        this.debtsToUs = debtsToUs;
        this.debtsOur = debtsOur;
        this.cleanMoney = cleanMoney;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Double getMoneyRemaining() {
        return moneyRemaining;
    }

    public void setMoneyRemaining(Double moneyRemaining) {
        this.moneyRemaining = moneyRemaining;
    }

    public Double getProducts() {
        return products;
    }

    public void setProducts(Double products) {
        this.products = products;
    }

    public Double getDebtsToUs() {
        return debtsToUs;
    }

    public void setDebtsToUs(Double debtsToUs) {
        this.debtsToUs = debtsToUs;
    }

    public Double getDebtsOur() {
        return debtsOur;
    }

    public void setDebtsOur(Double debtsOur) {
        this.debtsOur = debtsOur;
    }

    public Double getCleanMoney() {
        return cleanMoney;
    }

    public void setCleanMoney(Double cleanMoney) {
        this.cleanMoney = cleanMoney;
    }
}
