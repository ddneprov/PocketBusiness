package com.example.serverPocketBusiness.controller;

import com.example.serverPocketBusiness.entity.Product;
import com.example.serverPocketBusiness.orchestration.ProductOrchestration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductOrchestration productOrchestration;

    @PostMapping("/create")
    public void createProduct(@RequestBody Product product){
        productOrchestration.createProduct(product);
    }

    @GetMapping("/find")
    public Product findProductById(Integer id){
        return productOrchestration.findProductById(id);
    }

    @GetMapping("/all")
    public List<Product> findAll(){
        return productOrchestration.findAll();
    }

    @GetMapping("/top")
    public List<Product> findAllSortedByCountOfSales(){
        return productOrchestration.findAllSortedByCountOfSales();
    }

}
