//
//  ContentView.swift
//  pocket_business
//
//  Created by 18177231 on 29/01/2021.
//  Copyright © 2021 ddneprov. All rights reserved.
//  I'm not a swift developer, sorry for this code

import SwiftUI
import SwiftUICharts




struct ContentView: View {
    
    let utils = Utils()
    let requsets = Requests()
    
    @State var statusString : String = "Current Time"
    @State var products = [Product]()
    
    
    var body: some View {
        
        
        
        NavigationView{
            ScrollView{
                
                VStack{
                    let fatBurning = Legend(color: .green, label: "Fat Burning", order: 3)
                    let warmUp = Legend(color: .blue, label: "Warm Up", order: 2)



                    let line = Legend(color: .secondary, label: "Выручка", order: 5)

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
                    
                    Spacer()
                        
                    ForEach (0..<products.count, id: \.self) { index in
                        Text(products[index].name).baselineOffset(10)
                        Divider()
                    }
                }
                .navigationTitle(self.utils.getDate())
            }
            
        }.onAppear{self.getAllProductsResponse()}
        
       
        
        
    }
    
    
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
                    products = try JSONDecoder().decode([Product].self, from: data)
                    print("Response data string:\n \(dataString)")
                } catch let error {
                    print(error)
                }
               
            }
        }
        task.resume()
    }
}




struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        Group {
            ContentView()
            
        }
    }
}

