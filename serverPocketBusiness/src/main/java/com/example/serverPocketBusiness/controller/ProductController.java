package com.example.serverPocketBusiness.controller;

import com.example.serverPocketBusiness.entity.Product;
import com.example.serverPocketBusiness.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ProductController {

    @Autowired
    private ProductRepository productRepository;

    @PostMapping("/createProduct")
    public void createProduct(@RequestBody Product product){
        Product product1 = new Product();
        product1 = product;
        productRepository.save(product1);
    }
}
