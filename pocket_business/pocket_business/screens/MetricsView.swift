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


struct MetricsView: View {
    
    @State var topProducts = [Product]()
    @State var warehouse_products = [Warehouse]()
    @State var points = [DataPoint]()
    
    var body: some View {
        

        NavigationView{
            ScrollView{
                
                Spacer()
                
                VStack{
                    Text("Топ товаров")
                        .font(.system(.title2, design: .rounded)).fontWeight(.heavy).font(.title2).padding([.top,.bottom], 20)
                            .frame(width: 380, height: 30, alignment: .leading)
        
                    HorizontalBarChartView(dataPoints: points).padding(10)
                }

                Spacer()
                Spacer()
                
                VStack{
                    
                    Text("Доходность")
                        .font(.system(.title2, design: .rounded)).fontWeight(.heavy).font(.title2).padding([.top,.bottom], 20)
                            .frame(width: 380, height: 30, alignment: .leading)
                    
                    let highIntensity = Legend(color: .orange, label: "май", order: 5)
                    let buildFitness = Legend(color: .yellow, label: "апрель", order: 4)
                    let fatBurning = Legend(color: .green, label: "март", order: 3)
                    let warmUp = Legend(color: .blue, label: "февраль", order: 2)
                    let low = Legend(color: .gray, label: "январь", order: 1)

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

                    BarChartView(dataPoints: points, limit: limit).padding(10).accentColor(.black)
                }
                
                Spacer()
                Spacer()
                
                VStack{
                    
                    Text("Количество клиентов").font(.system(.title2, design: .rounded)).fontWeight(.heavy).font(.title2).padding([.top,.bottom], 20)
                        .frame(width: 380, height: 30, alignment: .leading)
                    
                    let buildFitness = Legend(color: .yellow, label: "май", order: 4)
                    let fatBurning = Legend(color: .green, label: "апрель", order: 3)
                    let warmUp = Legend(color: .blue, label: "март", order: 2)
                    let low = Legend(color: .gray, label: "февраль", order: 1)

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

                    LineChartView(dataPoints: points).padding(10).accentColor(.black)
                    
                    
                    Spacer()
                    Spacer()
        
                    
                    Text("Доступный остаток").font(.system(.title2, design: .rounded)).fontWeight(.heavy).font(.title2).padding([.top,.bottom], 20)
                        .frame(width: 380, height: 30, alignment: .leading)
                    
                    Spacer()
                    
                    ForEach (0..<warehouse_products.count, id: \.self) { index in
                        HStack {
                            Text(warehouse_products[index].name).padding(10)
                            Spacer()
                            
                            
                            if(warehouse_products[index].amount > 9) {
                                Text(String(warehouse_products[index].amount)).padding(10).foregroundColor(Color.black)
                            }
                            if (warehouse_products[index].amount < 6) {
                                Text(String(warehouse_products[index].amount)).padding(10).foregroundColor(Color.red).font(Font.body.bold())
                            }
                            else if (warehouse_products[index].amount < 10) {
                                Text(String(warehouse_products[index].amount)).padding(10).foregroundColor(Color.orange).font(Font.body.bold())
                            }
                        }
                        Divider()
                    }
                }
            
            }.onAppear {
                self.callServer()
            }.navigationTitle("Метрики")
        }
    }
    

    func callServer(){
        getTopProductsResponse()
        getAllProductsCount()
    }

    
    func getTopProductsResponse() {
        
        //getAllProductsCount()
        
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
                    topProducts = try JSONDecoder().decode([Product].self, from: data)
                    
                    var low = Legend(color: .black, label: "", order: 1)
                    points = [DataPoint]()
                    for product in topProducts {
                        
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
                    
                    print("Response top saled products string:\n \(dataString)")
                } catch let error {
                    print(error)
                }
               
            }
        }
        task.resume()
    }
    
    
    func getAllProductsCount(){
        let url = URL(string: "http://localhost:8080/warehouse/getAll")!

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
                    warehouse_products = try JSONDecoder().decode([Warehouse].self, from: data)
                    print("Response all products string:\n \(dataString)")
                } catch let error {
                    print(error)
                }
               
            }
        }
        task.resume()
    }
}

