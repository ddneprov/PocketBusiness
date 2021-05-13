//
//  ThirdView.swift
//  pocket_business
//
//  Created by 18177231 on 24.04.2021.
//  Copyright © 2021 ddneprov. All rights reserved.
//

import Foundation
import SwiftUI
import SwiftUICharts


struct ThirdView: View {
    @State var products = [Product]()
    @State var points = [DataPoint]()
    
    var body: some View {
        
        NavigationView{
            ScrollView{
                
                VStack{
                    Text("Топ товаров")
                        .font(.system(.title3, design: .rounded))
                        .frame(width: 380, height: 30, alignment: .leading)
                    
                    
                    HorizontalBarChartView(dataPoints: points).padding(10)
                }

                Spacer()
                Divider()
                Spacer()
                
                VStack{
                    
                    Text("Доходность")
                        .font(.system(.title3, design: .rounded))
                        .frame(width: 380, height: 30, alignment: .leading)
                    
                    let highIntensity = Legend(color: .orange, label: "2021", order: 5)
                    let buildFitness = Legend(color: .yellow, label: "2020", order: 4)
                    let fatBurning = Legend(color: .green, label: "2019", order: 3)
                    let warmUp = Legend(color: .blue, label: "2018", order: 2)
                    let low = Legend(color: .gray, label: "2017", order: 1)

                    let limit = DataPoint(value: 120, label: "120к/мес", legend: highIntensity)

                    let points: [DataPoint] = [
                        .init(value: 70, label: "", legend: low),
                        .init(value: 90, label: "", legend: warmUp),
                        .init(value: 91, label: "", legend: warmUp),
                        .init(value: 92, label: "", legend: warmUp),
                        .init(value: 130, label: "", legend: fatBurning),
                        .init(value: 124, label: "", legend: fatBurning),
                        .init(value: 135, label: "", legend: fatBurning),
                        .init(value: 133, label: "", legend: fatBurning),
                        .init(value: 136, label: "", legend: fatBurning),
                        .init(value: 138, label: "", legend: fatBurning),
                        .init(value: 150, label: "", legend: buildFitness),
                        .init(value: 151, label: "", legend: buildFitness),
                        .init(value: 150, label: "", legend: buildFitness),
                        .init(value: 136, label: "", legend: fatBurning),
                        .init(value: 135, label: "", legend: fatBurning),
                        .init(value: 130, label: "", legend: fatBurning),
                        .init(value: 130, label: "", legend: fatBurning),
                        .init(value: 150, label: "", legend: buildFitness),
                        .init(value: 151, label: "", legend: buildFitness),
                        .init(value: 150, label: "", legend: buildFitness),
                        .init(value: 160, label: "", legend: fatBurning),
                        .init(value: 159, label: "", legend: fatBurning),
                        .init(value: 161, label: "", legend: fatBurning),
                        .init(value: 158, label: "", legend: fatBurning),
                    ]

                    BarChartView(dataPoints: points, limit: limit).padding(10)
                }
                
                Spacer()
                Divider()
                Spacer()
                
                VStack{
                    
                    Text("Количество клиентов").font(.system(.title3, design: .rounded))
                        .frame(width: 380, height: 30, alignment: .leading)
                    
                    let buildFitness = Legend(color: .yellow, label: "2021", order: 4)
                    let fatBurning = Legend(color: .green, label: "2020", order: 3)
                    let warmUp = Legend(color: .blue, label: "2019", order: 2)
                    let low = Legend(color: .gray, label: "2018", order: 1)

                    let points: [DataPoint] = [
                        .init(value: 70, label: "1", legend: low),
                        .init(value: 90, label: "2", legend: warmUp),
                        .init(value: 91, label: "3", legend: warmUp),
                        .init(value: 92, label: "4", legend: warmUp),
                        .init(value: 80, label: "5", legend: fatBurning),
                        .init(value: 28, label: "6", legend: fatBurning),
                        .init(value: 50, label: "7", legend: fatBurning),
                        .init(value: 60, label: "8", legend: fatBurning),
                        .init(value: 65, label: "9", legend: fatBurning),
                        .init(value: 75, label: "10", legend: fatBurning),
                        .init(value: 120, label: "11", legend: buildFitness),
                        .init(value: 151, label: "12", legend: buildFitness),
                        .init(value: 180, label: "13", legend: buildFitness)
                    ]

                    LineChartView(dataPoints: points).padding(10)
                }
            }.navigationTitle("Метрики")
            }.onAppear{
                self.getAllProductsResponse()
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
                    
                    var low = Legend(color: .black, label: "", order: 1)
                    points = [DataPoint]()
                    for product in products {
                        
                        if product.countOfSales < 40 {
                            low = Legend(color: .orange, label: "", order: 3)
                        }
                        
                        if product.countOfSales > 40 {
                            low = Legend(color: .yellow, label: "", order: 3)
                        }
                        if product.countOfSales > 60 {
                            low = Legend(color: .green, label: "", order: 2)
                        }
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
