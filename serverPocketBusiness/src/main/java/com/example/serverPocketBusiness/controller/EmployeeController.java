package com.example.serverPocketBusiness.controller;


import com.example.serverPocketBusiness.entity.Employee;
import com.example.serverPocketBusiness.repository.EmployeeRepositiry;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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

    @GetMapping("/all")
    public List<Employee> getAll(){
        return employeeRepositiry.findAll();
    }
}
