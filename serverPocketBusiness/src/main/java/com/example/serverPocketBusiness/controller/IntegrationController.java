package com.example.serverPocketBusiness.controller;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;

@RestController
@RequestMapping("/1c")
public class IntegrationController {


    @GetMapping("/getList")
    public String getList(){
        String query = "http://89.208.85.216/test6/hs/employees";

        HttpURLConnection connection = null;

        try {
            connection = (HttpURLConnection) new URL(query).openConnection();
            connection.setRequestMethod("GET");
            connection.connect();
        } catch (Exception e) {

        } finally {
            if (connection != null) connection.disconnect();
        }

        try (Scanner scanner =
                     new Scanner(
                             new BufferedInputStream(
                                     connection.getInputStream()
                             )
                     )
        ) {
            StringBuilder answer = new StringBuilder();
            while (scanner.hasNextLine()) {
                answer.append(scanner.nextLine());
            }
            return answer.toString();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "error";
    }
}
