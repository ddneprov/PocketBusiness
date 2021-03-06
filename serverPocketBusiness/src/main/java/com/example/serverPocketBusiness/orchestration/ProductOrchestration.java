package com.example.serverPocketBusiness.orchestration;

import com.example.serverPocketBusiness.entity.Product;
import com.example.serverPocketBusiness.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Comparator;
import java.util.List;
import java.util.Optional;


@Service
public class ProductOrchestration {

    @Autowired
    private ProductRepository productRepository;

    /**
     * создание продукта
     * @param product
     */
    public void createProduct(Product product){
        Product product1 = new Product();
        product1 = product;
        productRepository.save(product1);
    }

    /**
     * поиск продукта
     * @param id
     * @return
     */
    public Product findProductById(Integer id){
        Optional<Product> product = productRepository.findFirstById(id);
        if (product.isPresent())
            return product.get();
        throw new NullPointerException("no such product by id");
    }

    public List<Product> findAll(){
        return productRepository.findAll();
    }

    public List<Product> findAllSortedByCountOfSales(){
        List<Product> products = productRepository.findAll();
        products.sort(Comparator.comparing(Product::getCountOfSales).reversed());
        return products;
    }
}
