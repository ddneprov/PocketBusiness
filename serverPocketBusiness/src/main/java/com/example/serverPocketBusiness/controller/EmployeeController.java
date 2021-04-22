package com.example.serverPocketBusiness.controller;


import com.example.serverPocketBusiness.entity.Employee;
import com.example.serverPocketBusiness.repository.EmployeeRepositiry;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/employee")
public class EmployeeController {

    @Autowired
    private EmployeeRepositiry employeeRepositiry;


    @PostMapping("/create")
    public void createEmployee(@RequestBody Employee employee){
        Employee employee1 = new Employee();
        employee1 = employee;
        employeeRepositiry.save(employee1);
    }
}
