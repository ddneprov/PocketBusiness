//
//  PeopleView.swift
//  pocket_business
//
//  Created by 18177231 on 24.04.2021.
//  Copyright © 2021 ddneprov. All rights reserved.
//

import Foundation
import SwiftUI





struct PeopleView: View {
    
    @State private var date = Date()
    @State var employees = [Employee]()

    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    
                    DatePicker(
                            "Start Date",
                            selection: $date,
                            displayedComponents: [.date]
                        )
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .background(RoundedRectangle(cornerRadius: 10)
                            .fill(Color.yellow)
                            .opacity(0.2))
                            .datePickerStyle(GraphicalDatePickerStyle())
                    .padding(10)
                    .accentColor(.red)
                    
                    
                    
                    VStack{
                        ForEach (0..<employees.count, id: \.self) { index in
                            HStack {
                                Text(employees[index].name).padding(10)
                                Spacer()
                            }
                            Divider()
                        }
                    }
                
                }.navigationTitle("Сотрудники")
            }.onAppear {
                self.getAllEmployees()
            }
        }
    }
    
    func getAllEmployees(){
        let url = URL(string: "http://localhost:8080/employee/all")!

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
                    employees = try JSONDecoder().decode([Employee].self, from: data)
                    print("Response getAllEmployees string:\n \(dataString)")
                } catch let error {
                    print(error)
                }
               
            }
        }
        task.resume()
    }
    
}
