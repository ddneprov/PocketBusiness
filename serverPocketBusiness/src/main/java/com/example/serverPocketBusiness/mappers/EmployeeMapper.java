package com.example.serverPocketBusiness.mappers;


import com.example.serverPocketBusiness.entity.Employee;
import com.example.serverPocketBusiness.repository.EmployeeRepository;
import com.example.serverPocketBusiness.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class EmployeeMapper {

    @Autowired
    private EmployeeRepository employeeRepository;

    //{
    // "Андрей Кудрявцев": {"Код": "000000001"},
    // "Днепров Данила Андреевич": {"Код": "000000003"},
    // "Петров Дмитрий Николаевич": {"Код": "000000002"}
    // }
    public List<Employee> map(String str){
        List<Employee> employees = employeeRepository.findAll();

        String [] names = str.split("[\\d{}:,\"]");
        for (String name : names) {
            if(!name.equals(StringUtils.EMPTY) && !name.equals(StringUtils.SPACE) && !name.equals(StringUtils.CODE)) {
                Optional<Employee> employeesDB = employeeRepository.findFirstByName(name);
                if(employeesDB.isEmpty()){
                    Employee employee = new Employee();
                    employee.setName(name);
                    employee.setPosition("");
                    employee.setSalary(0.0);
                    employee.setPhoneNumber("");
                    employee.setTax(25.0);
                    employee.setSalaryWithTax(0.0);
                    employeeRepository.save(employee);
                }
            }
        }
        return employeeRepository.findAll();
    }

    /**
    private String name;
    private String position;
    private Double salary;
    private Double tax;
    private Double salaryWithTax;
    private String phoneNumber;
     */


}
