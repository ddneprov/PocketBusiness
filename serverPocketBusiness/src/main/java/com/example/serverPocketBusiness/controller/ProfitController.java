package com.example.serverPocketBusiness.controller;


import com.example.serverPocketBusiness.entity.ProfitPerDay;
import com.example.serverPocketBusiness.orchestration.ProfitOrvhestration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/profit")
public class ProfitController {

    @Autowired
    private ProfitOrvhestration profitOrvhestration;

    @GetMapping("/find")
    private List<ProfitPerDay> getAllProfit(){
        return profitOrvhestration.getAllProfitByDays();
    }

    @PostMapping("/create")
    private void create(ProfitPerDay profit){
        ProfitPerDay profitPerDay = new ProfitPerDay();
        profitPerDay = profit;
        profitOrvhestration.create(profitPerDay);
    }
}
