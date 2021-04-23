package com.example.serverPocketBusiness.controller;


import com.example.serverPocketBusiness.entity.Sale;
import com.example.serverPocketBusiness.orchestration.SaleOrchestration;
import com.example.serverPocketBusiness.repository.SaleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/sale")
public class SaleController {

    @Autowired
    private SaleOrchestration saleOrchestration;

    @PostMapping("/create")
    public void createSale(@RequestBody Sale sale){
        saleOrchestration.createSale(sale);
    }

    @GetMapping("/all")
    public List<Sale> getAll(){
        return saleOrchestration.getAll();
    }
}
