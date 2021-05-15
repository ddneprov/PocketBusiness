package com.example.serverPocketBusiness.repository;


import com.example.serverPocketBusiness.entity.ProfitPerDay;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProfitPerDayRepository extends JpaRepository<ProfitPerDay, Integer> {

}
