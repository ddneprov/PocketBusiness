package com.example.serverPocketBusiness.repository;


import com.example.serverPocketBusiness.entity.Warehouse;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface WarehouseRepository extends JpaRepository<Warehouse, String> {

}
