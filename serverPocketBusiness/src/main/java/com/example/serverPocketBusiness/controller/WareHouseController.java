package com.example.serverPocketBusiness.controller;


import com.example.serverPocketBusiness.entity.Warehouse;
import com.example.serverPocketBusiness.repository.WarehouseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/warehouse")
public class WareHouseController {

    @Autowired
    private WarehouseRepository warehouseRepository;

    @RequestMapping("/getAll")
    public List<Warehouse> getAll(){
        return warehouseRepository.findAll();
    }
}
