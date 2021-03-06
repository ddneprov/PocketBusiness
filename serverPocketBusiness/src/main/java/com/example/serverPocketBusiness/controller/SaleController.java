package com.example.serverPocketBusiness.controller;


import com.example.serverPocketBusiness.dto.DateDto;
import com.example.serverPocketBusiness.entity.Sale;
import com.example.serverPocketBusiness.orchestration.SaleOrchestration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.util.Date;
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

    @GetMapping("/byDate")
    public List<Sale> getByDay(@RequestParam String date) throws ParseException { return saleOrchestration.getByDate(date); }
}
