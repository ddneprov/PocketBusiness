package com.example.serverPocketBusiness.controller;


import com.example.serverPocketBusiness.entity.Bank;
import com.example.serverPocketBusiness.repository.BankRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/bank")
public class BankController {

    @Autowired
    private BankRepository bankRepository;

    @GetMapping("/info")
    public Bank getBankInfo(){
        return bankRepository.findAll().get(0);
    }
}
