package com.example.serverPocketBusiness.repository;

import com.example.serverPocketBusiness.entity.Employee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface EmployeeRepository extends JpaRepository<Employee, String> {

    Optional<Employee> findFirstByName(String name);
}
