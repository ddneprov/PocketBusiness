package com.example.serverPocketBusiness.orchestration;


import com.example.serverPocketBusiness.entity.Product;
import com.example.serverPocketBusiness.entity.Sale;
import com.example.serverPocketBusiness.repository.ProductRepository;
import com.example.serverPocketBusiness.repository.SaleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SaleOrchestration {


    @Autowired
    private SaleRepository saleRepository;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    ProductOrchestration productOrchestration;

    /**
     *
     * @param sale
     */
    public void createSale(Sale sale) {

        String[] tokens = sale.getProducts().split(",");
        for (String token : tokens) {
            Product product = productOrchestration.findProductById(Integer.parseInt(token));
            product.setAmount(product.getAmount() - 1);// todo столько сколько купили
            product.setCountOfSales(product.getCountOfSales() + 1); // todo столько сколько продали
            productRepository.save(product);
        }

        Sale sale1 = new Sale();
        sale1 = sale;
        saleRepository.save(sale1);
    }

    public List<Sale> getAll(){
        return saleRepository.findAll();
    }
}
