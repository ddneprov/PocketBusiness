package com.example.serverPocketBusiness.orchestration;


import com.example.serverPocketBusiness.entity.ProfitPerDay;
import com.example.serverPocketBusiness.repository.ProfitPerDayRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Comparator;
import java.util.List;

@Service
public class ProfitOrvhestration {

    @Autowired
    private ProfitPerDayRepository profitPerDayRepository;


    public List<ProfitPerDay> getAllProfitByDays(){
        List<ProfitPerDay> profitPerDay = profitPerDayRepository.findAll();
        profitPerDay.sort(Comparator.comparing(ProfitPerDay::getDate));
        profitPerDay = profitPerDay.subList(0, 7);
        return profitPerDay;
    }

    public void create(ProfitPerDay profit){
        profitPerDayRepository.save(profit);
    }
}
