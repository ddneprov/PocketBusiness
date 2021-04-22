//
//  Requests.swift
//  pocket_business
//
//  Created by 18177231 on 21.04.2021.
//  Copyright © 2021 ddneprov. All rights reserved.
//

import Foundation



class Requests{
    
    /*
    func getAllProductsResponse() {
        let url = URL(string: "http://localhost:8080/product/all")!

        //guard let requestUrl = url else { fatalError() }
        let requestUrl = url

        // Create URL Request
        var request = URLRequest(url: requestUrl)
        // Specify HTTP Method to use
        request.httpMethod = "GET"
       
        // Send HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            // Check if Error took place
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            // Read HTTP Response Status code
            if let response = response as? HTTPURLResponse {
                print("Response HTTP Status code: \(response.statusCode)")
            }
            
            // Convert HTTP Response Data to a simple String
            if let data = data, let dataString = String(data: data, encoding: .utf8){
                do{
                    ContentView().products = try JSONDecoder().decode([Product].self, from: data) // не сохраняет
                    print("Response data string:\n \(dataString)")
                } catch let error {
                    print(error)
                }
               
            }
        }
        task.resume()
    }*/
}
