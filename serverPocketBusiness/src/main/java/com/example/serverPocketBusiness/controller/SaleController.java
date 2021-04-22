package com.example.serverPocketBusiness.controller;


import com.example.serverPocketBusiness.entity.Sale;
import com.example.serverPocketBusiness.repository.SaleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/sale")
public class SaleController {

    @Autowired
    private SaleRepository saleRepository;

    @PostMapping("/create")
    public void createSale(@RequestBody Sale sale){
        Sale sale1 = new Sale();
        sale1 = sale;
        saleRepository.save(sale1);
    }
}
