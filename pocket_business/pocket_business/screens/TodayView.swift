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
        @State var profitLastWeek = [ProfitPerDay]()
        @State var points = [DataPoint]()
    
        @State private var date = Date()

      
        
        var body: some View {
            NavigationView{
                ScrollView{
                    
                    VStack{

                        
                        BarChartView(dataPoints: points).accentColor(.black).padding(.leading, 10)
                        
                        
                        HStack{
                            
                            Text("Чеки: ")
                                .font(.system(size: 24, weight: .heavy, design: .default))
                                .padding(.leading, 5)
                                .frame(width: 100, height: 50, alignment: .leading)
                            
                            DatePicker(
                                    "",
                                    selection: $date,
                                    displayedComponents: [.date, .hourAndMinute]
                            ).padding(10).onChange(of: date, perform: { (value) in
                                dateChanged()
                            }).accentColor(.black)
                        }
                        

                        Spacer()
                        Spacer()
                       
                        
                        ForEach (0..<sales.count, id: \.self) { index in
                            HStack {
                                Text(sales[index].names).padding(10)
                                Spacer()
                                Text(String(sales[index].totalCost) + String(" ₽")).padding(10)
                            }
                            Divider()
                        }
                        
                        
                    }.navigationTitle("170₽/чек")
                }
            }.onAppear{
                self.getAllSalesResponse()
                //self.getProfitPerDay()
            }
        }
        
       
        func dateChanged(){
            print("changed date" + date.description)
        }
        
        
        func getAllSalesResponse() {
            
            getLastWeek()
            
            let url1 = URL(string: "http://localhost:8080/profit/getLastWeek")!
            
            //guard let requestUrl = url else { fatalError() }
            let requestUrl1 = url1

            // Create URL Request
            var request2 = URLRequest(url: requestUrl1)
            // Specify HTTP Method to use
            request2.httpMethod = "GET"
           
            // Send HTTP Request
            let task1 = URLSession.shared.dataTask(with: request2) { (data, response, error) in
                
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
                        profitLastWeek = try JSONDecoder().decode([ProfitPerDay].self, from: data)
                        
                        /// заполняем гистограму
                        let warmUp = Legend(color: .blue, label: "", order: 2)
                        let fatBurning = Legend(color: .green, label: "Сегодня", order: 3)
                        let line = Legend(color: .secondary, label: "Выручка")
                        
                        if(points.isEmpty) {
                            points.append(.init(value: profitLastWeek[0].cleanProfit, label: LocalizedStringKey.init(profitLastWeek[0].dayOfTheWeek), legend: warmUp))
                            points.append(.init(value: profitLastWeek[1].cleanProfit, label: LocalizedStringKey.init(profitLastWeek[1].dayOfTheWeek), legend: warmUp))
                            points.append(.init(value: profitLastWeek[2].cleanProfit, label: LocalizedStringKey.init(profitLastWeek[2].dayOfTheWeek), legend: warmUp))
                            points.append(.init(value: profitLastWeek[3].cleanProfit, label: LocalizedStringKey.init(profitLastWeek[3].dayOfTheWeek), legend: warmUp))
                            points.append(.init(value: profitLastWeek[4].cleanProfit, label: LocalizedStringKey.init(profitLastWeek[4].dayOfTheWeek), legend: warmUp))
                            points.append(.init(value: profitLastWeek[5].cleanProfit, label: LocalizedStringKey.init(profitLastWeek[5].dayOfTheWeek), legend: warmUp))
                            points.append(.init(value: profitLastWeek[6].cleanProfit, label: LocalizedStringKey.init(profitLastWeek[6].dayOfTheWeek), legend: fatBurning))
                        }
                       
                        //mediana = DataPoint.init(value: 1000, label: "1000h", legend: line)
                        
                        print("Response profitLastWeek string:\n \(dataString)")
                    } catch let error {
                        print(error)
                    }
                   
                }
            }
            task1.resume()
        }
        
        func getLastWeek() {
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
