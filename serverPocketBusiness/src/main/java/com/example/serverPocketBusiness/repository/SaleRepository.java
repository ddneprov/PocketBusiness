package com.example.serverPocketBusiness.repository;

import com.example.serverPocketBusiness.entity.Sale;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;
import java.util.Optional;


@Repository
public interface SaleRepository extends JpaRepository<Sale, String> {
    Optional<List<Sale>> findAllByDate(Date date);
}
