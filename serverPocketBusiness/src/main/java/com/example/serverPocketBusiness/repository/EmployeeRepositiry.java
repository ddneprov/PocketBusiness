package com.example.serverPocketBusiness.repository;

import com.example.serverPocketBusiness.entity.Employee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EmployeeRepositiry extends JpaRepository<Employee, Integer> {
}
