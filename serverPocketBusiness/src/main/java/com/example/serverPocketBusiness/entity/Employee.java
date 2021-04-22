package com.example.serverPocketBusiness.entity;

import javax.persistence.*;


@Entity
@Table(name = "employee_table")
public class Employee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String name;
    private String position;
    private Double salary;
    private Double tax;
    private Double salaryWithTax;

    public Employee(){}

    public Employee(Employee employee){
        this.name = employee.getName();
        this.position = employee.getPosition();
        this.salary = employee.getSalary();
        this.tax = employee.getTax();
        this.salaryWithTax = employee.getSalaryWithTax();
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

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public Double getSalary() {
        return salary;
    }

    public void setSalary(Double salary) {
        this.salary = salary;
    }

    public Double getTax() {
        return tax;
    }

    public void setTax(Double tax) {
        this.tax = tax;
    }

    public Double getSalaryWithTax() {
        return salaryWithTax;
    }

    public void setSalaryWithTax(Double salaryWithTax) {
        this.salaryWithTax = salaryWithTax;
    }
}
