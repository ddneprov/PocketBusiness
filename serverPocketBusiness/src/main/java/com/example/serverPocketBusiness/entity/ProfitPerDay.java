package com.example.serverPocketBusiness.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "profit_table")
public class ProfitPerDay {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @JsonFormat(pattern="yyyy-MM-dd")
    private Date date;

    private Double cleanProfit;
    private Double totalProfit;
    private String dayOfTheWeek;

    public ProfitPerDay(){}

    public ProfitPerDay(ProfitPerDay profitPerDay){
        this.date = profitPerDay.getDate();
        this.cleanProfit = profitPerDay.getCleanProfit();
        this.totalProfit = profitPerDay.getCleanProfit();
        this.dayOfTheWeek = profitPerDay.getDayOfTheWeek();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Double getCleanProfit() {
        return cleanProfit;
    }

    public void setCleanProfit(Double cleanProfit) {
        this.cleanProfit = cleanProfit;
    }

    public Double getTotalProfit() {
        return totalProfit;
    }

    public void setTotalProfit(Double totalProfit) {
        this.totalProfit = totalProfit;
    }

    public String getDayOfTheWeek() {
        return dayOfTheWeek;
    }

    public void setDayOfTheWeek(String dayOfTheWeek) {
        this.dayOfTheWeek = dayOfTheWeek;
    }
}
