//
//  TodayView.swift
//  pocket_business
//
//  Created by 18177231 on 24.04.2021.
//  Copyright © 2021 ddneprov. All rights reserved.
//

import Foundation
import SwiftUI
import SwiftUICharts


// Main screen

    struct TodayView: View {
        let utils = Utils()
        let requsets = Requests()
        
        
        @State var sales = [Sale]()
      
        
        var body: some View {
            NavigationView{
                ScrollView{
                    
                    VStack{
                        let fatBurning = Legend(color: .green, label: "Fat Burning", order: 3)
                        let warmUp = Legend(color: .blue, label: "Warm Up", order: 2)
                        let line = Legend(color: .secondary, label: "Выручка")

                        let mediana = DataPoint(value: 99, label: "109к", legend: line)

                        let points: [DataPoint] = [
                            .init(value: 70, label: "пн", legend: warmUp),
                            .init(value: 90, label: "вт", legend: fatBurning),
                            .init(value: 91, label: "ср", legend: warmUp),
                            .init(value: 92, label: "чт", legend: warmUp),
                            .init(value: 130, label: "пт", legend: warmUp),
                            .init(value: 124, label: "сб", legend: warmUp),
                            .init(value: 102, label: "вс", legend: warmUp),
                        ]
                        
                        
                        BarChartView(dataPoints: points, limit: mediana)
                        
                        Text(self.utils.getDate())
                            .font(.system(size: 24, weight: .heavy, design: .default))
                            .padding(.horizontal, 0)
                            .frame(width: 400, height: 50, alignment: .leading)

                        Spacer()
                        Spacer()
                       
                        ForEach (0..<sales.count, id: \.self) { index in
                            HStack {
                                Text(sales[index].names).padding(10)
                                Spacer()
                                Text(String(sales[index].totalCost)).padding(10)
                            }
                            Divider()
                        }
                        
                        
                    }.navigationTitle("330₽/чек")
                }
            }.onAppear{self.getAllSalesResponse()}
        }
        
       
        
        func getAllSalesResponse() {
            let url = URL(string: "http://localhost:8080/sale/all")!

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
                    do {
                        sales = try JSONDecoder().decode([Sale].self, from: data)
                        print("Response data string:\n \(dataString)")
                    } catch let error {
                        print(error)
                    }
                   
                }
            }
            task.resume()
        }
    }
