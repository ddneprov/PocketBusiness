//
//  TopView.swift
//  pocket_business
//
//  Created by 18177231 on 24.04.2021.
//  Copyright © 2021 ddneprov. All rights reserved.
//

import Foundation
import SwiftUI
import SwiftUICharts



struct TopView: View {
    
        @State var products = [Product]()
        @State var points = [DataPoint]()

        
//        var points1 : [DataPoint] {
//            let low = Legend(color: .gray, label: "Low", order: 1)
//
//            for product in products {
//                print("frfrfrfr")
//                points.append(.init(value: Double(product.countOfSales),
//                                    label: LocalizedStringKey(product.name),
//                                    legend: low))
//            }
//            return points
//        }
    
        var body: some View {
            NavigationView{
                
                
                
                ScrollView{
                    VStack{
                        
                        ForEach (0..<products.count, id: \.self) { index in
                            HStack{
                                let imageName: String = String(index + 1) + ".circle"
                                Image(systemName: (imageName)).padding(10)
                                Text(products[index].name)
                                Spacer()
                                Text(String(products[index].countOfSales) + " шт.").padding(10)
                            }//.baselineOffset(10)
                        }

                        HorizontalBarChartView(dataPoints: points).padding(10)
                        
                        Divider()
                    }
                }
            }.onAppear{
                self.getAllProductsResponse()
            }.onDisappear(){
                
            }
        
        }
    
    
    
        func getAllProductsResponse() {
            let url = URL(string: "http://localhost:8080/product/top")!

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
                        products = try JSONDecoder().decode([Product].self, from: data)
                        
                        let low = Legend(color: .red, label: "", order: 1)
                        points = [DataPoint]()
                        for product in products {
                            points.append(.init(value: Double(product.countOfSales),
                                                label: LocalizedStringKey(product.name),
                                                legend: low))
                        }
                        
                        print("Response data string:\n \(dataString)")
                    } catch let error {
                        print(error)
                    }
                   
                }
            }
            task.resume()
        }
    
}
