package com.example.serverPocketBusiness.orchestration;


import com.example.serverPocketBusiness.entity.Employee;
import com.example.serverPocketBusiness.mappers.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.Scanner;

@Service
public class EmployeeOrchestration {

    @Autowired
    private EmployeeMapper employeeMapper;


    public List<Employee> getAll() {
        String response1c = request1CEmployee();
        return employeeMapper.map(response1c);
    }



    private String request1CEmployee(){
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
